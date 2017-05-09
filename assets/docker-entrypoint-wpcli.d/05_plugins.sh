#!/bin/bash
echo 'Configuring Plugins'

# remove defaults
$WP plugin uninstall hello akismet

# install wp importer
$WP plugin install wordpress-importer --activate

# force SSL
cd $WORDPRESS_PATH/wp-content/plugins
wget -v https://gist.githubusercontent.com/jamessmoore/6d9e58d83bb52909e64e040f3077b695/raw/9a701fec3fc9090917ac53c26cf1ad60d4747ec1/force-ssl-url-scheme.php
$WP plugin activate force-ssl-url-scheme

# install/activate project plugins
$WP plugin install all-in-one-wp-security-and-firewall --activate
$WP plugin install bwp-google-xml-sitemaps --activate
#$WP plugin install contact-form-7 --activate
#$WP plugin install postman-smtp --activate
#$WP plugin install listo --activate
$WP plugin install custom-login
$WP plugin install disable-password-reset --activate
$WP plugin install peters-login-redirect --activate
#
$WP plugin install ml-slider --activate
$WP plugin install megamenu --activate
#
# wp-google-fonts causes errors with the theme
# $WP plugin install wp-google-fonts --activate
#
# $WP plugin install googleanalytics --activate
# $WP plugin install google-analytics-dashboard-for-wp --activate
#
# # Contexture Page Security
#
# $WP plugin install contexture-page-security --activate
# $WP option update ad_opt_login_anon true

$WP plugin status
