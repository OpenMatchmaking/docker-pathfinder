# Stage 1: Build an application from a source code 
FROM rust:1.23 as build

# Get the latest code from pathfinder's master branch
RUN apt-get update && apt-get install git
RUN git clone https://github.com/OpenMatchmaking/pathfinder.git

# And built it in release mode
WORKDIR pathfinder/pathfinder
RUN cargo build --release

# ------------------------------------------------------------
# Stage 2: Create a separate image for the complited application
FROM debian:jessie-slim

# Copies the binary from the "build" stage to the current stage
COPY --from=build pathfinder/pathfinder/target/release/pathfinder .

# Configures the startup!
CMD ["./pathfinder"]
