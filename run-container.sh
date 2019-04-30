#!/bin/bash
#
TAG="titan/ubuntu-gollum"
PORT=8888
if [[ $# -gt 0 ]]; then
 PORT=$1
fi
NAME="utitan-$$"
docker run -d --name $NAME -p $PORT:4567 --rm -v $(pwd):/usr/local/share/wikidata $TAG

echo
echo "Container name is: $NAME"
echo
echo "Connect to container at: 127.0.0.1:$PORT"
echo
