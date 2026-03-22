#!/bin/bash

status=$(docker inspect -f '{{.State.Running}}' jenkins)

if [ "$status" = "true" ]; then
echo "<h1>Jenkins is running</h1>" > index.html
else
echo "<h1>Jenkins is NOT running</h1>" > index.html
fi

docker cp index.html httpd:/usr/local/apache2/htdocs/index.html
rm index.html

