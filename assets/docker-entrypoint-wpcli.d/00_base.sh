#!/bin/bash
echo '....Configuring Base....'
/usr/bin/env
# install the core - variables starting with $WORDPRESS_ are
# expected to be bash environment variables
if ! $(wp core is-installed); then
		# perform a new install
		$WP core install --allow-root --debug \
			--url="$WORDPRESS_SITE_URL:$WORDPRESS_PORT" \
			--path="$WORDPRESS_PATH" \
			--title="$WORDPRESS_TITLE" \
			--admin_user="$WORDPRESS_ADMIN_USER" \
			--admin_password="$WORDPRESS_ADMIN_PASSWORD" \
			--admin_email="$WORDPRESS_ADMIN_EMAIL"
fi
