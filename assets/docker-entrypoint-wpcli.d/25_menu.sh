#!/bin/bash
WP='/usr/bin/sudo -u www-data /bin/wp-cli.phar'
BASEURL=$WORDPRESS_SITE_URL

# setup menus - http://wp-cli.org/commands/menu/
echo '....Configuring Menus....'

#################### main-menu #######################################################################################
$WP menu create main-menu
$WP menu location assign main-menu main-menu

$WP menu item add-custom main-menu "Home" "$BASEURL"
$WP menu item add-custom main-menu "About Us" "$BASEURL/about_us"
$WP menu item add-custom main-menu "Contact Us" "$BASEURL/contact"

#################### front-page-menu #######################################################################################
$WP menu create front-page-menu
$WP menu location assign front-page-menu front-page-menu

#################### footer-menu #######################################################################################
$WP menu create footer-menu
$WP menu location assign footer-menu footer-menu

$WP menu list --debug
