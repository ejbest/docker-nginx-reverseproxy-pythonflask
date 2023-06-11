#!/bin/bash
docker run -v ./tls:/tls alpine/openssl req -out /tls/tls.crt -new -keyout /tls/tls.key -newkey rsa:4096 -nodes -sha256 -x509 -subj "/O=Python/CN=Flask" -days 3650
