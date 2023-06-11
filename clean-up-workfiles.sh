#!/bin/bash

docker ps -a
docker images 
docker compose stop 
x=$?; if [ $x -ne 0 ]; then echo "stop container for xyz_app status $x"; exit $x; fi
#
docker compose rm
x=$?; if [ $x -ne 0 ]; then echo "stop container for xyz_app status $x"; exit $x; fi
#
echo "Would you like to clean off the Images?"
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
docker container stop $(docker ps -aq --filter ancestor=nginx)
x=$?; if [ $x -ne 0 ]; then echo "stop container for nginx status $x"; exit $x; fi
#
docker container stop $(docker ps -aq --filter ancestor=alpine/openssl)
x=$?; if [ $x -ne 0 ]; then echo "stop container for alpine status $x"; exit $x; fi
#
docker container stop $(docker ps -aq --filter ancestor=xyz_app)
x=$?; if [ $x -ne 0 ]; then echo "stop container for xyz_app status $x"; exit $x; fi
#
docker container rm $(docker ps -aq --filter ancestor=nginx)
x=$?; if [ $x -ne 0 ]; then echo "remove nginx container status $x"; exit $x; fi
#
docker container rm $(docker ps -aq --filter ancestor=alpine/openssl)
x=$?; if [ $x -ne 0 ]; then echo "remove container alpine status $x"; exit $x; fi
#
docker container rm $(docker ps -aq --filter ancestor=xyz_app)
x=$?; if [ $x -ne 0 ]; then echo "remove container xyz_app status $x"; exit $x; fi
#
docker image rmi nginx
x=$?; if [ $x -ne 0 ]; then echo "remove image nginx status $x"; exit $x; fi
#
docker image rmi alpine/openssl
x=$?; if [ $x -ne 0 ]; then echo "remove image alpine status $x"; exit $x; fi
#
docker image rmi xyz_app
x=$?; if [ $x -ne 0 ]; then echo "remove image xyz app status $x"; exit $x; fi
#
rm -Rf files/*.txt
x=$?; if [ $x -ne 0 ]; then echo "clean up parse files status $x"; exit $x; fi
