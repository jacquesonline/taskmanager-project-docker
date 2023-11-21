#!/bin/bash

# AfterInstall CodeDeploy Event

cd /var/www

cp config/nginx.conf /etc/nginx/nginx.conf

cp config/flasktodo.conf /etc/nginx/conf.d/flasktodo.conf

cp config/flasktodo.service /etc/systemd/system/flasktodo.service

python3 -m venv venv

source venv/bin/activate
pip install -r requirements.txt

chmod -R 755 /var/www
chown -R ec2-user:nginx /var/www

aws s3 cp s3://tci-s3-demo/flask-todo/.env .env

export FLASK_APP=wsgi
flask db upgrade

chown -R ec2-user:nginx /var/log/uwsgi

