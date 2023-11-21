#!/bin/bash

# BeforeInstall CodeDeploy Event

if [ -d /var/www/flasktodo ]; then
    ARCHIVE=flasktodo_$(date '+%Y%m%d-%H%M').tar.gz
    cd /var/www
    tar czf $ARCHIVE flasktodo
    aws s3 cp $ARCHIVE s3://tci-s3-demo/flasktodo-codedeploy/$ARCHIVE
    cd /var
    rm -rf /var/www
    mkdir /var/www
fi

if [ ! -d /var/log/uwsgi ]; then
    mkdir /var/log/uwsgi
fi

if [ ! -f /etc/nginx/nginx.conf-orig ]; then
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf-orig
fi

if [ -f /etc/nginx/nginx.conf ]; then
    rm /etc/nginx/nginx.conf
fi

if [ -f /etc/nginx/conf.d/flasktodo.conf ]; then
    rm /etc/nginx/conf.d/flasktodo.conf
fi

if [ -f /etc/systemd/system/flasktodo.service ]; then
    rm /etc/systemd/system/flasktodo.service
fi