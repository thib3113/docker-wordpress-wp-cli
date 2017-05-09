#!/bin/bash
echo '....Configuring Content....'

BASEURL=$WORDPRESS_SITE_URL

# remove default content
$WP post delete 1 --force # "Hello World" post
$WP post delete 2 --force # Sample page

##############################################################
################ create post categories ######################
##############################################################
$WP term create category Announcements --slug='announcements' --description='\"Announcements / Breaking News\"'
$WP term create category Events --slug='events' --description='\"Events Calendar\"'
$WP term create category Newsletter --slug='newsletter' --description='Newsletter'

$WP import /assets/wxr/pages.xml --authors=skip
$WP import /assets/wxr/contact_forms.xml --authors=skip
