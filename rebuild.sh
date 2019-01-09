#!/bin/bash

docker rm -f frox froxdb
docker build -t giabar/gb-froxlor .
docker run -d -p 3306:3306 --name=froxdb -e MYSQL_ROOT_PASSWORD=root_password -e MYSQL_DATABASE=froxlor -e MYSQL_USER=froxlor -e MYSQL_PASSWORD=froxpwd mysql:5.7.17
sleep 2
docker run -d -p 8077:80 --name=frox --link=froxdb giabar/gb-froxlor
