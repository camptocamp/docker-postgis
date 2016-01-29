#Postgis 2.1/2.2 Docker container

The tags are named after the PostgreSQL versions; PostgreSQL 9.4 is using
Postgis 2.1, 9.5 is using 2.2.

Here is a sample Dockerfile for using it:
```
FROM camptocamp/postgis:9.5
MAINTAINER Camptocamp "info@camptocamp.com"

ENV POSTGRES_USER www-data
ENV POSTGRES_DB toto
ADD *.sql /docker-entrypoint-initdb.d/
```
Name your SQL files starting with a 2 digit number prefix starting from `01_`
to ensure your scripts are started after the ones from the
`camptocamp/postgis` image.

See the postgres image documentation for more details:
https://hub.docker.com/_/postgres/

