#!/bin/bash
WP='/usr/bin/sudo -u www-data /bin/wp-cli.phar --path=/var/www/html'
WORDPRESS_PATH='/var/www/html'

echo '....Configuring Base....'
# install the core - variables starting with $WORDPRESS_ are
# expected to be bash environment variables
$WP core install --allow-root --debug \
	--url="$WORDPRESS_SITE_URL:$WORDPRESS_PORT" \
	--path="$WORDPRESS_PATH" \
	--title="$WORDPRESS_TITLE" \
	--admin_user="$WORDPRESS_ADMIN_USER" \
	--admin_password="$WORDPRESS_ADMIN_PASSWORD" \
	--admin_email="$WORDPRESS_ADMIN_EMAIL"
