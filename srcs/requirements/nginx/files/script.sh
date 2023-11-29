#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/nginx-selfsigned.key -out /etc/nginx/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Agadir/L=Agadir/O=Mediaplus.ma/OU=DevOps/CN=localhost"