#!/bin/bash
WP='/usr/bin/sudo -u www-data /bin/wp-cli.phar --path=/var/www/html'

# REMOTE_SRC='/var/www/html/remote_src'
# IMAGES_SRC="$REMOTE_SRC/images"
# CONTENT_IMAGES=$(find $IMAGES_SRC/ -not -path '*/\.*' -type f -name "*.*")
# for i in "${CONTENT_IMAGES[@]}"
# do
# 	echo "$i"
# 	$WP media import $i --debug
# done
