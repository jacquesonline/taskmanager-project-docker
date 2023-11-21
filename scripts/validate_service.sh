#!/bin/bash

# ValidateService CodeDeploy Event

IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
HEALTH=$(curl http://$IP/health)

if [ "$HEALTH" != "Healthy" ]; then
  echo "Instance is not healthy"
  exit 1
else
  echo "Instance is healthy"
fi