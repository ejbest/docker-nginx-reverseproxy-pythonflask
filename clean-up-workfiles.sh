#!/bin/bash
echo "-------------------------------------------------------------------------------"
for s in "alpine/openssl" "nginx" "xyz_app"
do
    echo "docker image ${s}"
    if [ "$(docker ps -aq --filter ancestor=$s)" ]; then
        docker container stop $(docker ps -aq --filter ancestor="$s")
        x=$?; if [ $x -ne 0 ]; then echo "stop container for ${s} status $x"; exit $x; fi
        docker container rm $(docker ps -aq --filter ancestor="$s")
        x=$?; if [ $x -ne 0 ]; then echo "remove ${s} container status $x"; exit $x; fi
    else
        echo "No containers running on ${s}"
    fi
    if docker image inspect "$s" >/dev/null 2>&1; then
        docker image rmi ${s}
        x=$?; if [ $x -ne 0 ]; then echo "remove image ${s} status $x"; exit $x; fi
    else
        echo "No such image: ${s}"
    fi
    set +x
done
 