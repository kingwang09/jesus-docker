#! /usr/bin/env bash

echo "Hello world";

# docker에 dump file copy
#docker cp ./db/pp_23_10_17.sql postgresql-docker:/pp_23_10_17.sql

# docker postsql dump import
docker exec postgresql-docker psql --host postgresql-docker --username docker --dbname docker_db < /import/pp_23_10_17.sql