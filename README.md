# BedquiltDB Example Dockerfile

## Info

This Dockerfile creates a container running PostgreSQL 9.4 and BedquiltDB.

Here is a summary of what happens:

- Install PostgreSQL
- Exposes the `postgres` service on port `5432`
- Initializes a database in `/data`
- Installs the `bedquilt` extension
- Inserts a superuser in the database: `docker:docker` (change in the Dockerfile)
- Enables the `bedquilt` extension on the default `postgres` database


## Install

- `docker build -t "bedquiltdb_example" .`
- `docker run -d bedquiltdb_example --name bq`


## Persistance

You can mount the database directory as a volume to persist your data:

`docker run -d -v /data/pg:/data --name bq bedquiltdb_example`

But before you can do so you first need to create the source folder: `mkdir -p /data/pg`
