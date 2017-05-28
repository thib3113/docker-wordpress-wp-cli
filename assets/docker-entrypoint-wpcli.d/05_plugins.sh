#!/bin/bash
echo 'Configuring Plugins'

# remove defaults
$WP plugin uninstall hello akismet

# force SSL
cd $WORDPRESS_PATH/wp-content/plugins
wget -v https://gist.githubusercontent.com/jamessmoore/6d9e58d83bb52909e64e040f3077b695/raw/9a701fec3fc9090917ac53c26cf1ad60d4747ec1/force-ssl-url-scheme.php
$WP plugin activate force-ssl-url-scheme

# install wp importer and defaults
$WP plugin install wordpress-importer --activate

# install/activate project plugins
$WP plugin install capability-manager-enhanced --activate
$WP plugin install all-in-one-wp-security-and-firewall --activate
$WP plugin install bwp-google-xml-sitemaps --activate
$WP plugin install contact-form-7 --activate
$WP plugin install postman-smtp
$WP plugin install listo
$WP plugin install custom-login --activate
$WP plugin install disable-password-reset --activate
$WP plugin install simple-pdf-exporter --activate
#
$WP plugin install ml-slider --activate
$WP plugin install megamenu --activate
#
# wp-google-fonts causes errors with the theme
# $WP plugin install wp-google-fonts --activate
#
$WP plugin install googleanalytics --activate
$WP plugin install google-analytics-dashboard-for-wp --activate
#
# # Contexture Page Security
#
$WP plugin install contexture-page-security
$WP option update ad_opt_login_anon true
#$WP plugin install peters-login-redirect

# Install FISIF-Tools
cd $WORDPRESS_PATH/wp-content/plugins
wget https://github.com/jamessmoore/fisif-tools/archive/master.zip
unzip master.zip && rm master.zip

$WP plugin status
