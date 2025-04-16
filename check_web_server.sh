#!/bin/bash

HOST="127.0.0.1"
PORT=80
URL="http://$HOST:$PORT"

nc -z -w 3 $HOST $PORT
if [ $? -ne 0 ]; then
  exit 1
else
  exit 0
fi

HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}" "$URL")
if [ "$HTTP_STATUS" = "200" ]; then
  exit 0
else
  exit 1
fi
