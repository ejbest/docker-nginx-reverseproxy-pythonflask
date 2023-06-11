# Interview Take Home 
##### Erich EJ Best
###### ej.best@outlook.com 
###### 201-218-9860 

#### Docker, Nginx with Reverse Proxy and Python Flask 
<br>
Requirements for task are at this link
https://github.com/ejbest66/docker-nginx-reverseproxy-pythonflask/blob/main/REQUIREMENTS.md

As was stated in the instructions; this is to show the senior abilities of the person on this task.<br>
There was a couple of items that are wished to be shared.

- Used tls files for https support on nginx reverse proxy.  As a result certicates will be generated and not saved to the repo, and is part of the automation.

- This project is using images from the public domain.  For a production application and any internal testing we should only use vetted images from trusted sources that are checksum checked and scanned.  We should only pull from locked trusted internal repositories.

1. Goal: See completed 'Dockerfile and run application'
 
2. Docker Exercise: Hello World in the repo "app.py"
 
3. Scripting Exercise: code in script/parse.py in the repo and will create "files/*.txt" as required from http://127.0.0.1:5000/data.

4. Reverse Proxy Configuration examine nginx.conf in the repo
   - see a block of code named "location" that has reverse proxy details
   
### Testing Environment  
- Debian GNU/Linux 11 (bullseye) 
- docker version 24.0.2
- docker compose 2.18.1

### How to Run 
<pre>
git clone https://github.com/ejbest66/docker-nginx-reverseproxy-pythonflask.git
cd docker-nginx-reverseproxy-pythonflask
bash job.sh
</pre>
<br>
<br>
Hope is a good start for a project; hope it is what you asked for, is a good foundation something bigger.


