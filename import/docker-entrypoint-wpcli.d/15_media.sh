#!/bin/bash

echo 'Configuring WordPress instance....'
WP='/usr/bin/sudo -u www-data /bin/wp-cli.phar'
STOCK_MEDIA='/var/www/html/media'
REMOTE_SRC='/var/www/html/remote_src'
IMAGES_SRC="$REMOTE_SRC/images"
MORE_IMAGES_SRC="$REMOTE_SRC/core/data/images"
NEWSLETTER_SRC="$REMOTE_SRC/core/data/newsletters"
SRCPDFS_SRC="$REMOTE_SRC/core/data/src_pdfs"
DOCSPUBLIC_SRC="$REMOTE_SRC/core/data/docs_public"
DOCSMEMBERS_SRC="$REMOTE_SRC/core/data/docs_members"
DOCSAGENTS_SRC="$REMOTE_SRC/core/data/docs_agents"

SITE_IMAGES=$(find $IMAGES_SRC/ -not -path '*/\.*' -type f -name "*.*")
for i in "${SITE_IMAGES[@]}"
do
	echo "$i"
	$WP media import $i --debug
done

CONTENT_IMAGES=$(find $MORE_IMAGES_SRC/ -not -path '*/\.*' -type f -name "*.*")
for i in "${CONTENT_IMAGES[@]}"
do
	echo "$i"
	$WP media import $i --debug
done

CONTENT_IMAGES=$(find $STOCK_MEDIA/ -not -path '*/\.*' -type f -name "*.*")
for i in "${CONTENT_IMAGES[@]}"
do
	echo "$i"
	$WP media import $i --debug
done

NEWSLETTERS=$(find $NEWSLETTER_SRC/ -not -path '*/\.*' -type f -name "*.*")
for i in "${NEWSLETTERS[@]}"
do
	echo "$i"
	$WP media import $i --debug
done

ITEMS=$(find $DOCSPUBLIC_SRC/ -not -path '*/\.*' -type f -name "*.*")
for i in "${ITEMS[@]}"
do
	echo "$i"
	$WP media import $i --debug
done

ITEMS=$(find $DOCSMEMBERS_SRC/ -not -path '*/\.*' -type f -name "*.*")
for i in "${ITEMS[@]}"
do
	echo "$i"
	$WP media import $i --debug
done

ITEMS=$(find $DOCSAGENTS_SRC/ -not -path '*/\.*' -type f -name "*.*")
for i in "${ITEMS[@]}"
do
	echo "$i"
	$WP media import $i --debug
done

