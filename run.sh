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
--ssl-cert=${SSL_CERTIFICATE}
--ssl-key=${SSL_KEY}
"

if [[ "${SECURED_MODE}" =~ ^(yes|Yes|YES)$ ]]; then
  OPTIONS="-s $OPTIONS"
fi

./pathfinder $OPTIONS
