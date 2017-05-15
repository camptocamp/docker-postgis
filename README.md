# This image is deprecated, please use https://hub.docker.com/r/camptocamp/postgres/ instead

# Postgis Docker container

The tags are named after the PostgreSQL versions:

* PostgreSQL 9.4 is using PostGIS 2.1,
* PostgreSQL 9.5 is using PostGIS 2.2,
* PostgreSQL 9.6 is using PostGIS 2.3.

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

See the PostgreSQL image documentation for more details:
https://hub.docker.com/_/postgres/

