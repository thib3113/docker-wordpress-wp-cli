#!/bin/bash

URL='http://demo.ohmydocker.com'
PATH='/var/www/html'
TITLE='The One-Click Wordpress Site'
TAGLINE='YOUR alternative for building Wordpress Sites'
ADMIN_USER='ocadmin'
ADMIN_PASSWORD='opensesame'
ADMIN_EMAIL='james@ohmydocker.com'
REMOTE_SRC='/var/www/html/remote_src'

WP='/usr/bin/sudo -u www-data /bin/wp-cli.phar --path=/var/www/html'

echo '....Configuring Base....'
# install the core
$WP core install --allow-root --debug \
	--url="$WORDPRESS_SITE_URL:$WORDPRESS_PORT" \
	--path="$PATH" \
	--title="$TITLE" \
	--admin_user="$ADMIN_USER" \
	--admin_password="$ADMIN_PASSWORD" \
	--admin_email="$ADMIN_EMAIL"
