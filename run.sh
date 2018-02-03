#!/bin/bash

OPTIONS=$"
--config=${CONFIG_PATH}
--ip=${LISTENED_IP}
--port=${LISTENED_PORT}
--log-level=${LOG_LEVEL}
--rabbitmq-host=${RABBITMQ_HOST}
--rabbitmq-port=${RABBITMQ_PORT}
--rabbitmq-virtual-host=${RABBITMQ_VIRTUAL_HOST}
--rabbitmq-user=${RABBITMQ_USER}
--rabbitmq-password=${RABBITMQ_PASSWORD}
--redis-host=${REDIS_HOST}
--redis-port=${REDIS_PORT}
--redis-password=${REDIS_PASSWORD}
--jwt-secret=${JWT_SECRET}
--ssl-cert=${SSL_CERTIFICATE}
--ssl-key=${SSL_KEY}
"

if [[ "${SECURED_MODE}" =~ ^(yes|Yes|YES)$ ]]; then
  OPTIONS="-s $OPTIONS"
fi

if [[ "${VALIDATE_TOKEN}" =~ ^(yes|Yes|YES)$ ]]; then
  OPTIONS="-v $OPTIONS"
fi

./pathfinder $OPTIONS