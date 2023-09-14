# CloudQuery GitHub Demo

A demo project with CloudQuery, Metabase, and Postgres containers syncing issues data from a GitHub repository.

## How to run this

The metabase container is built for ARM processors. Use `metabase/metabase` if you're on x86 architecture.

You will need Docker and docker-compose installed.

Copy .env.example to .env and insert your own GitHub access token (readonly permissions are enough).

Run `docker-compose up -d` to start the containers.
