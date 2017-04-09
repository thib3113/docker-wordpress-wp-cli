#!/bin/bash

# Import WP-CLI config
cp /assets/wp-cli.yml /var/www/html/wp-cli.yml
chown www-data. /var/www/html/wp-cli.yml

# Initialize WordPress
/assets/docker-entrypoint-wpcli.d/init.sh
