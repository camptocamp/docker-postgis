#!/bin/bash

set -e

for version in *
do
    if [ -d $version ]
    then
        docker build -t camptocamp/postgis:$version $version
    fi
done
