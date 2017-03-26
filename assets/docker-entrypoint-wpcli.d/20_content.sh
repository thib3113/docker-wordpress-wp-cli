#!/bin/bash

echo '....Configuring Content....'

WP='/usr/bin/sudo -u www-data /bin/wp-cli.phar'
BASEURL=$WORDPRESS_SITE_URL

# remove default content
$WP post delete 1 --force # "Hello World" post
$WP post delete 2 --force # Sample page

##############################################################
################ create post categories ######################
##############################################################
$WP term create category Announcements --slug='announcements' --description='Announcements / Breaking News'
$WP term create category Events --slug='events' --description='Events Calendar'
$WP term create category Newsletter --slug='newsletter' --description='Newsletter'

################ create top-level pages
#### Meta Slider
title='_Meta_Slider'
content='Placeholder for the Meta Slider'
metasliderid=$($WP post create --post_content="$content" --post_type=page --post_title="$title" --porcelain)

#### Home page
title='The One-Click Wordpress Site'
name='home'
content='This is the content for the front page of The One-Click Wordpress Site'
frontpage_id=$($WP post create --post_content="$content" --post_type=page --post_name="$name" --post_title="$title" --porcelain)
$WP post update $frontpage_id --post_status=publish
$WP option update show_on_front page
$WP option update page_on_front $frontpage_id

#### About page
title='About Us'
datfile="$REMOTE_SRC/core/data/who-we-are.dat.php"
content='Information about us and what we do.'
postid=$($WP post create --post_content="$content" --post_type=page --post_title="$title" --porcelain)
$WP post update $postid --post_status=publish
about_us_id=$postid

#### FAQ
title='Frequently Asked Questions'
content='Frequently Asked Questions Page'
postid=$($WP post create --post_content="$content" --post_type=page --post_title="$title" --porcelain)
$WP post update $postid --post_status=publish --post_parent=$worker_overview_id

#### Contact Us
title='Contact Us'
name='contact'
content='Contact Us page'
postid=$($WP post create --post_content="$content" --post_type=page --post_name="$name" --post_title="$title" --porcelain)
$WP post update $postid --post_status=publish
