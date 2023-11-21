#!/bin/bash

# ApplicationStart CodeDeploy Event

systemctl restart flasktodo.service
systemctl restart nginx

systemctl enable flasktodo.service
systemctl enable nginx

