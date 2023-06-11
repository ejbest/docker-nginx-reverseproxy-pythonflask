#!/bin/bash
bash generate-cert.sh
x=$?; if [ $x -ne 0 ]; then echo "generate certificate status $x"; exit $x; fi
docker compose build 
x=$?; if [ $x -ne 0 ]; then echo "build container status $x"; exit $x; fi
docker compose up -d
x=$?; if [ $x -ne 0 ]; then echo "run status $x"; exit $x; fi
echo "Here is the testing results"
echo "1. Goal: See completed 'Dockerfile and run application'"
echo " "
echo "2. Docker Exercise: See below "custom greeting" and examine app.py "Hello World" in the repo "
echo "   - was done with http 5000 and https as one security consideration" 
echo " " 
echo "http://127.0.0.1:5000"
curl http://127.0.0.1:5000 --insecure && echo " "
echo " " 
echo "https://127.0.0.1:443"
curl https://127.0.0.1:443 --insecure && echo " "
echo " " 
echo "3. Scripting Exercise: See below data and note code in files/parse.py in the repo"
echo "   -see the URL and files below that were parsed" 
echo " "
echo "http://127.0.0.1:5000/data "
curl http://127.0.0.1:5000/data --insecure && echo " "
python3 script/parse.py
ls -l files 
echo " " 
echo "4. Reverse Proxy Configuration examine nginx.conf in the repo"
echo "   - see location block of code " 
echo " " 
echo "added TLS certificates as a security consideration"
echo "observation the images were downloaded online; they should be only pulled from a repo after vetting and lockdown"
echo " "   
echo "Would you like to clean up Containers and Images?"
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
echo "cleaning up files created"
bash clean-up-workfiles.sh
rm -Rf files
docker ps -a
docker images 
docker volume ls