#!/bin/bash

docker run -d --name jenkins -p 8080:8080 jenkins/jenkins:lts
docker run -d --name httpd -p 8081:80 httpd

sleep 20

docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

status=$(docker inspect -f '{{.State.Running}}' jenkins)

if [ "$status" = "true" ]; then
echo "<h1>Jenkins is running</h1>" > index.html
else
echo "<h1>Jenkins is NOT running</h1>" > index.html
fi

docker cp index.html httpd:/usr/local/apache2/htdocs/index.html
rm index.html
