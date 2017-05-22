#!/bin/bash
THEME='wp-theme-aa-master'
LOGOURL="$WORDPRESS_SITE_URL/wp-content/themes/$THEME/assets/images/logo.png"

# Download Theme
cd $WORDPRESS_PATH/wp-content/themes
wget https://github.com/jamessmoore/wp-theme-aa/archive/master.zip
unzip master.zip && rm master.zip

BACKGROUND_COLOR='FFFFFF'
GENERAL_COLOR='3391AD'
SECOND_COLOR='3391AD'
THIRD_COLOR='353535'


if $($WP theme is-installed $THEME); then
    echo 'Activating Theme:' $THEME
else
    echo 'Unable to Activate theme (not installed)'
    exit 0
fi

# activate and configure theme
$WP theme activate $THEME --debug
$WP theme mod set background_color $BACKGROUND_COLOR
$WP theme mod set general_color $GENERAL_COLOR
$WP theme mod set second_color $SECOND_COLOR
$WP theme mod set pwt_background_color '#'$BACKGROUND_COLOR
$WP theme mod set pwt_general_color '#'$GENERAL_COLOR
$WP theme mod set pwt_ceneral_color '#'$GENERAL_COLOR
$WP theme mod set pwt_second_color '#'$SECOND_COLOR
$WP theme mod set pwt_logo_upload $LOGOURL
$WP theme mod set pwt_text_logo_1 "DEFAULT"
$WP theme mod set pwt_text_logo_2 "THEME"
$WP theme mod set pwt_blog_page "Latest News Updates"
$WP theme mod set pwt_center_box_title "Center Box Title"
$WP theme mod set pwt_center_box_subtitle "Center Box SubTitle"
$WP theme mod set pwt_center_box_button_text "Center Box Button Text"
$WP theme mod set pwt_center_box_button_link "$WORDPRESS_SITE_URL"


# display the result
$WP theme mod get --all
$WP theme status $THEME
