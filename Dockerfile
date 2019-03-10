# Stage 1: Build an application from a source code 
FROM rust:1.33 as build

# Get the latest code from pathfinder's master branch
RUN apt-get update && apt-get install git
RUN git clone https://github.com/OpenMatchmaking/pathfinder.git
RUN cd pathfinder && git checkout 1.0.0

# And built it in release mode
WORKDIR pathfinder/pathfinder
RUN cargo build --release

# ------------------------------------------------------------
# Stage 2: Create a separate image for the compiled application
FROM debian:stretch-slim
RUN apt-get update && apt-get -y install openssl netcat


# Copies the binary from the "build" stage to the current stage
WORKDIR /app
COPY --from=build pathfinder/pathfinder/target/release/pathfinder /app

ENV SECURED_MODE="no" \
    CONFIG_PATH="" \
    LISTENED_IP="127.0.0.1" \
    LISTENED_PORT="9000" \
    RABBITMQ_HOST="127.0.0.1" \
    RABBITMQ_PORT="5672" \
    RABBITMQ_VIRTUAL_HOST="vhost" \
    RABBITMQ_USER="user" \
    RABBITMQ_PASSWORD="password" \
    SSL_CERTIFICATE="" \
    SSL_KEY="" \ 
    LOG_LEVEL="info"

EXPOSE 9000

# Configures the startup
COPY ./wait-for.sh ./docker-entrypoint.sh /
COPY ./run.sh ./run.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["./run.sh"]
