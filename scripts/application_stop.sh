#!/bin/bash

# ApplicationStop CodeDeploy Event

NGINX=$(pgrep nginx)
if [ -n "$NGINX" ]; then
    systemctl stop nginx
fi

FLASKTODO=$(pgrep flasktodo)
if [ -n "$FLASKTODO" ]; then
    systemctl stop flasktodo
fi
