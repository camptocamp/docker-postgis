#Postgis 2.1 Docker container

Here is a sample Dockerfile for using it:
```
FROM camptocamp/postgis
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

