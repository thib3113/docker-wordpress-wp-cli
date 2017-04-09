#!/bin/bash

# download fresh copy
echo '....Downloading Wordpress....'
$WP core download --path=$WORDPRESS_PATH

echo '....Configuring Base....'
# create a wp-config file
$WP core config --path=$WORDPRESS_PATH --dbhost="$WORDPRESS_DB_HOST" --dbname="$WORDPRESS_DB_USER" --dbuser="$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD"

# perform a new install
$WP core install --allow-root --debug --path=$WORDPRESS_PATH --url="$WORDPRESS_SITE_URL:$WORDPRESS_PORT" --path=$WORDPRESS_PATH --title='"$WORDPRESS_TITLE"' --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL"
