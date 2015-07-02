# Dockerfile PostgreSQL

## Info

This Dockerfile creates a container running PostgreSQL 9.3

Here's what it does in particular:

- Install PostgreSQL
- exposing it on port `5432`
- initializes a database in `/data`
- inserts a superuser in the database: `docker:docker` (change in the Dockerfile)


## Install

- `docker build -t "postgresql9.3" .`
- `docker run -d postgresql9.3`


## Persistance

You can mount the database directory as a volume to persist your data:

`docker run -p 127.0.0.1:5432:5432 -v /data/pg:/data -name pg postgresql9.3`

But before you can do so you first need to create the source folder: `mkdir -p /data/pg`
