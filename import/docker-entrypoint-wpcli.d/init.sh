#!/bin/bash
MWD='/docker-entrypoint-wpcli.d'

$MWD/00_base.sh
$MWD/05_plugins.sh
#$MWD/10_theme.sh
#$MWD/15_media.sh
#$MWD/20_content.sh
#$MWD/25_menu.sh
#$MWD/50_widgets.sh
#$MWD/80_users.sh
