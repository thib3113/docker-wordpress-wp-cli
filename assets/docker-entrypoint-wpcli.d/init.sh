#!/bin/bash
MWD='/assets/docker-entrypoint-wpcli.d'

$MWD/00_base.sh
$MWD/05_plugins.sh
#$MWD/10_theme.sh
#$MWD/15_media.sh
#$MWD/20_content.sh
#$MWD/25_menu.sh
#$MWD/50_widgets.sh
#$MWD/80_users.sh

# enable for debugging
# SLEEPTIME=3600
# echo "Sleeping $SLEEPTIME seconds to allow for manual debug";
# sleep $SLEEPTIME;
