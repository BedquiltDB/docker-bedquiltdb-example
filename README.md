# BedquiltDB Example Dockerfile

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

You can then connect to the postgres instance running inside the container,
or just get a `psql` shell for experimenting with:

```bash
$ docker exec -it bedquiltdb_example bash
root@1234 su postgres
postgres@1234 psql
psql (9.4.5)
Type "help" for help.

postgres=#
```

## Persistance

You can mount the database directory as a volume to persist your data:

`docker run -d -v /data/pg:/data --name bq bedquiltdb_example`

But before you can do so you first need to create the source folder: `mkdir -p /data/pg`
