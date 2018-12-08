# Pathfinder in Docker
This repository provides an image to run the [Pathfinder project](https://github.com/OpenMatchmaking/pathfinder) in Docker.

# Configuration
Before starting the pathfinder image, you can override the configuration of the instance by specifiying one or more environment variables either on the docker-compose file or on the docker run command line:

- For docker-compose configuration just add the variable name and its value in the `environment` section, like here:
```yaml
pathfinder:
  image: openmatchmaking/pathfinder:latest
  ports:
    - 9000:9000
  environment:
    - LOG_LEVEL=error
``` 
- For manual execution add a `-e` option with each variable and value

Available variables:
- `SECURED_MODE`: Enable the SSL/TLS mode for connections with RabbitMQ. Default: **no**
- `CONFIG_PATH`: Path to a custom settings file. Default: an empty string
- `LISTENED_IP`: The used IP for a server. Default: **127.0.0.1**
- `LISTENED_PORT`: The listened port. Default: **9000**
- `RABBITMQ_HOST`: The used host by RabbitMQ broker. Default: **127.0.0.1**
- `RABBITMQ_PORT`: The listened port by RabbitMQ broker. Default: **5672**
- `RABBITMQ_VIRTUAL_HOST`: The virtual host of a RabbitMQ node. Default: **vhost**
- `RABBITMQ_USER`: A RabbitMQ application username. Default: **user**
- `RABBITMQ_PASSWORD`: A RabbitMQ application password. Default: **password**
- `SSL_CERTIFICATE`: Path to a SSL certificate. Default: an empty string
- `SSL_KEY`: Path to a SSL public key. Default: an empty string
- `LOG_LEVEL`: Logging level for the application. Default: **info**

# Docker entrypoint variables 
| Name              | Description                                          | Default value | Values        |      
|-------------------|------------------------------------------------------|---------------|---------------|
| RABBITMQ_HOST     | Hostname of the RabbitMQ instance.                   | rabbitmq      | –             |
| RABBITMQ_PORT     | Listened port by the RabbitMQ instance.              | 5672          | –             |
| SERVICE_HOST      | Hostname of the service.                             | localhost     | –             |
| SERVICE_PORT      | Listened port by the service.                        | 8000          | –             |                
| WAIT_FOR_RABBITMQ | Wait until the RabbitMQ container isn't initialized. | `false`       | `false` or a positive integer value |
| WAIT_FOR_SERVICE  | Wait until the service container isn't initialized.  | `false`       | `false` or a positive integer value |
