# Simple Docker DynDNS Client

Simple DynDNS Client in Docker

Copy `.env.example` to `.env` and setup enviroment variables.

## Build

```
docker-compose build
```

## Deploy via docker-compose

After build you can start it

```
docker-compose up -d
```

Check cron running

```
docker-compose logs -f
```

## Deploy to Docker Swarm

```
version: "3.7"
services:
  dyndns_client:
    image: olkitu/simple-docker-dyndns-client
    deploy:
      replicas: 1
      update_config:
        parallelism: 2
        delay: 10s
        failure_action: rollback
        monitor: 1m
        order: start-first
      restart_policy:
        condition: on-failure
        max_attempts: 3
    environment:
      URL: https://dyndns_endpoint
      CRON: 0 1 * * *
```