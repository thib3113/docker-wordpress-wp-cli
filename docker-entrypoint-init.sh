#!/bin/bash

# Initialize WordPress
/assets/docker-entrypoint-wpcli.d/init.sh

# Start the service using wordpress:latest docker-entrypoint.sh
docker-entrypoint.sh
