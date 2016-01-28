#Postgis 2.1 Docker container

Here is a sample Dockerfile for using it:
```
FROM camptocamp/postgis
MAINTAINER Camptocamp "info@camptocamp.com"

ENV POSTGRES_USER www-data
ENV POSTGRES_DB toto
ADD *.sql /docker-entrypoint-initdb.d/
```

See the postgres image documentation for more details:
https://hub.docker.com/_/postgres/

