#!/bin/bash
echo 'Configuring Plugins'

# remove defaults
$WP plugin uninstall hello akismet

# force SSL
$WP plugin install wp-force-ssl
# install/activate project plugins
#$WP plugin install all-in-one-wp-security-and-firewall --activate
#$WP plugin install bwp-google-xml-sitemaps --activate
#$WP plugin install contact-form-7 --activate
#$WP plugin install postman-smtp --activate
#$WP plugin install listo --activate
# $WP plugin install custom-login
# $WP plugin install disable-password-reset --activate
# $WP plugin install peters-login-redirect --activate
#
# $WP plugin install ml-slider --activate
# $WP plugin install megamenu --activate
#
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
