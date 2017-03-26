#!/bin/bash
THEME='twentyseventeen'
WP='/usr/bin/sudo -u www-data /bin/wp-cli.phar'
LOGOURL=''

echo '....Configuring Theme....'

if $($WP theme is-installed $THEME); then
    echo 'Configuring Theme:' $THEME
else
    echo 'Unable to configure theme (not installed)'
    exit 0
fi

# activate and configure theme
$WP theme activate $THEME --debug

# display the result
$WP theme mod get --all
$WP theme status $THEME
