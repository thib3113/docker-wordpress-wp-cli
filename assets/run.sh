#!/bin/bash

# Initialize WordPress
/assets/init.sh

# Start the service using wordpress:latest docker-entrypoint.sh
docker-entrypoint.sh
