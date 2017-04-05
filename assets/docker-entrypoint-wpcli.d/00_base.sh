#!/bin/bash
echo '....Configuring Base....'
if $($WP core is-installed); then
	echo 'Wordpress is already installed..'
  /usr/bin/env | grep 'W'
fi

# install the core - variables starting with $WORDPRESS_ are
# expected to be bash environment variables
if ! $($WP core is-installed); then
		# perform a new install
		$WP core install --allow-root --debug \
			--url="$WORDPRESS_SITE_URL:$WORDPRESS_PORT" \
			--path=$WORDPRESS_PATH \
			--title="$WORDPRESS_TITLE" \
			--admin_user="$WORDPRESS_ADMIN_USER" \
			--admin_password="$WORDPRESS_ADMIN_PASSWORD" \
			--admin_email="$WORDPRESS_ADMIN_EMAIL"
fi
