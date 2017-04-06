#!/bin/bash

# download fresh copy
echo '....Downloading Wordpress....'
$WP core download

echo '....Configuring Base....'
# create a wp-config file
$WP core config

# perform a new install
$WP core install --allow-root --debug --url="$WORDPRESS_SITE_URL:$WORDPRESS_PORT" --path=$WORDPRESS_PATH --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL"
