#!/usr/bin/env bash
set -e

rabbitmq_timeout=${WAIT_FOR_RABBITMQ:-false}
service_timeout=${WAIT_FOR_SERVICE:-false}

if [[ ${rabbitmq_timeout} != false ]]; then
    /wait-for.sh ${RABBITMQ_HOST:-rabbitmq} ${RABBITMQ_PORT:-5672} ${rabbitmq_timeout} "RabbitMQ"
fi

if [[ ${service_timeout} != false ]]; then
    /wait-for.sh ${SERVICE_HOST:-localhost} ${SERVICE_PORT:-8000} ${service_timeout} "Service"
fi

exec "$@"
