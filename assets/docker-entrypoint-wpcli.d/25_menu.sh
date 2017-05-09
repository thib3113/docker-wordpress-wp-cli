#!/bin/bash
BASEURL=$WORDPRESS_SITE_URL

# setup menus - http://wp-cli.org/commands/menu/

#################### main-menu #######################################################################################
# $WP menu create main-menu
$WP menu location assign main-menu main-menu

$WP menu item add-custom main-menu "Home" "$BASEURL"

about_fisif_id=$($WP menu item add-custom main-menu "About-Us" "$BASEURL/about-us" --porcelain)
$WP menu item add-custom main-menu "History" "$BASEURL/about-fisif/history" --parent-id=$about_fisif_id
$WP menu item add-custom main-menu "How-The-Fund-Works" "$BASEURL/about-fisif/how-the-fund-works" --parent-id=$about_fisif_id
$WP menu item add-custom main-menu "Board-of-Trustees" "$BASEURL/about-fisif/board-of-trustees" --parent-id=$about_fisif_id
$WP menu item add-custom main-menu "Staff" "$BASEURL/about-fisif/staff" --parent-id=$about_fisif_id
$WP menu item add-custom main-menu "Testimonials" "$BASEURL/about-fisif/testimonials" --parent-id=$about_fisif_id

news_id=$($WP menu item add-custom main-menu "News" "$BASEURL/news" --porcelain)
$WP menu item add-custom main-menu "Calendar-of-Events" "$BASEURL/category/events" --parent-id=$news_id
$WP menu item add-custom main-menu "Announcements" "$BASEURL/category/announcements" --parent-id=$news_id
$WP menu item add-custom main-menu "Newsletters" "$BASEURL/category/newsletter" --parent-id=$news_id
$WP menu item add-custom main-menu "WCA-News" "$BASEURL/category/wca" --parent-id=$news_id
$WP menu item add-custom main-menu "NMRA" "$BASEURL/category/nmra" --parent-id=$news_id
$WP menu item add-custom main-menu "NMGA" "$BASEURL/category/nmga" --parent-id=$news_id

$WP menu item add-custom main-menu "Legislative" "$BASEURL/legislative"

member_id=$($WP menu item add-custom main-menu "Members" "$BASEURL/member" --porcelain)
$WP menu item add-custom main-menu "Find-an-HCP" "$BASEURL/find-an-hcp" --parent-id=$member_id
$WP menu item add-custom main-menu "Find-an-Agent" "$BASEURL/member/find-an-agent" --parent-id=$member_id
members_home_id=$($WP menu item add-custom main-menu "Members-Home" "$BASEURL/members/member-home" --parent-id=$member_id --porcelain)
$WP menu item add-custom main-menu "Account-Receivable-Report" "$BASEURL/member/member-home/account-receivable-report" --parent-id=$members_home_id
$WP menu item add-custom main-menu "Premium-Computation" "$BASEURL/member/member-home/premium-computation" --parent-id=$members_home_id
$WP menu item add-custom main-menu "Loss-Run-Report" "$BASEURL/member/member-home/loss-run-report" --parent-id=$members_home_id
$WP menu item add-custom main-menu "Certificate-of-Insurance" "$BASEURL/member/member-home/certificate-of-insurance" --parent-id=$members_home_id
$WP menu item add-custom main-menu "Submit-E1-Form" "$BASEURL/member/member-home/submit-e1-form" --parent-id=$members_home_id
$WP menu item add-custom main-menu "Loss-Ratio-Report" "$BASEURL/member/member-home/loss-ratio-report" --parent-id=$members_home_id
$WP menu item add-custom main-menu "Resources" "$BASEURL/member/member-home/resources" --parent-id=$members_home_id

agent_id=$($WP menu item add-custom main-menu "Agent" "$BASEURL/agent" --porcelain)
$WP menu item add-custom main-menu "Become-An-Agent" "$BASEURL/agent/become-a-fisif-agent" --parent-id=$agent_id
agent_home_id=$($WP menu item add-custom main-menu "Agent-Home" "$BASEURL/agent/agent-home" --parent-id=$agent_id --porcelain)
$WP menu item add-custom main-menu "Submit-Quote-Application" "$BASEURL/agent/submit-quote-application" --parent-id=$agent_id
$WP menu item add-custom main-menu "Application-Forms" "$BASEURL/agent/application-forms" --parent-id=$agent_id
$WP menu item add-custom main-menu "Rates" "$BASEURL/agent/agents-home/rates" --parent-id=$agent_home_id
$WP menu item add-custom main-menu "Agent-Premium-Estimator" "$BASEURL/agent/agents-home/agent-premium-estimator" --parent-id=$agent_home_id
$WP menu item add-custom main-menu "Agent-Commision-Report" "$BASEURL/agent/agents-home/commission-report" --parent-id=$agent_home_id

$WP menu item add-custom main-menu "Contact-Us" "$BASEURL/contact"

#################### front-page-menu #######################################################################################
# $WP menu create front-page-menu
$WP menu location assign front-page-menu front-page-menu

#################### pubsub-member-menu #######################################################################################
#$WP menu create pubsub-member-menu
$WP menu location assign pubsub-member-menu pubsub-member-menu


#################### footer-menu #######################################################################################
$WP menu create footer-menu
$WP menu location assign footer-menu footer-menu

$WP menu list --debug
