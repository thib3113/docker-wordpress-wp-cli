#!/bin/bash
WP='/usr/bin/sudo -u www-data /bin/wp-cli.phar --path=/var/www/html'
BASEURL=$WORDPRESS_SITE_URL

# setup menus - http://wp-cli.org/commands/menu/

#################### main-menu #######################################################################################
$WP menu create main-menu
$WP menu location assign main-menu main-menu

about_fisif_id=$($WP menu item add-custom main-menu "About Us" "$BASEURL/about-us" --porcelain)
$WP menu item add-custom main-menu "History" "$BASEURL/about-fisif/history" --parent-id=$about_fisif_id
$WP menu item add-custom main-menu "How The Fund Was Started" "$BASEURL/about-fisif/how-the-fund-was-started" --parent-id=$about_fisif_id
$WP menu item add-custom main-menu "Board of Trustees" "$BASEURL/about-fisif/board-of-trustees" --parent-id=$about_fisif_id
$WP menu item add-custom main-menu "Staff" "$BASEURL/about-fisif/staff" --parent-id=$about_fisif_id
$WP menu item add-custom main-menu "Financial" "$BASEURL/about-fisif/financial" --parent-id=$about_fisif_id
$WP menu item add-custom main-menu "Testimonials" "$BASEURL/about-fisif/testimonials" --parent-id=$about_fisif_id

news_id=$($WP menu item add-custom main-menu "News" "$BASEURL/news" --porcelain)
$WP menu item add-custom main-menu "Calendar of Events" "$BASEURL/category/events" --parent-id=$news_id
$WP menu item add-custom main-menu "Announcements" "$BASEURL/category/announcements" --parent-id=$news_id
$WP menu item add-custom main-menu "FISIF Newsletters" "$BASEURL/category/newsletter" --parent-id=$news_id
$WP menu item add-custom main-menu "WCA News" "$BASEURL/category/wca" --parent-id=$news_id
$WP menu item add-custom main-menu "NMRA" "$BASEURL/category/nmra" --parent-id=$news_id
$WP menu item add-custom main-menu "NMGA" "$BASEURL/category/nmga" --parent-id=$news_id

$WP menu item add-custom main-menu "Legislative" "$BASEURL/legislative"

member_id=$($WP menu item add-custom main-menu "FISIF Member" "$BASEURL/member" --porcelain)
$WP menu item add-custom main-menu "Overview" "$BASEURL/member" --parent-id=$member_id
$WP menu item add-custom main-menu "Pay My Bill" "$BASEURL/member/pay-my-bill" --parent-id=$member_id
$WP menu item add-custom main-menu "Find an HCP" "$BASEURL/member/find-an-hcp" --parent-id=$member_id
$WP menu item add-custom main-menu "Find an Agent" "$BASEURL/member/find-an-agent" --parent-id=$member_id
members_home_id=$($WP menu item add-custom main-menu "Members Home" "$BASEURL/members/member-home" --parent-id=$member_id --porcelain)
$WP menu item add-custom main-menu "Account Receivable Report" "$BASEURL/member/member-home/account-receivable-report" --parent-id=$members_home_id
$WP menu item add-custom main-menu "Premium Computation" "$BASEURL/member/member-home/premium-computation" --parent-id=$members_home_id
$WP menu item add-custom main-menu "Loss Run Report" "$BASEURL/member/member-home/loss-run-report" --parent-id=$members_home_id

agent_id=$($WP menu item add-custom main-menu "Agent" "$BASEURL/agent" --porcelain)
$WP menu item add-custom main-menu "Overview" "$BASEURL/agent/overview" --parent-id=$agent_id
$WP menu item add-custom main-menu "Become a FISIF Agent" "$BASEURL/agent/become-a-fisif-agent" --parent-id=$agent_id
$WP menu item add-custom main-menu "Submit Application" "$BASEURL/agent/submit-application" --parent-id=$agent_id
agent_home_id=$($WP menu item add-custom main-menu "Agent Home" "$BASEURL/agent/agent-home" --parent-id=$agent_id --porcelain)
$WP menu item add-custom main-menu "Rates" "$BASEURL/agent/agents-home/rates" --parent-id=$agent_home_id
$WP menu item add-custom main-menu "Commission Report" "$BASEURL/agent/agents-home/commission-report" --parent-id=$agent_home_id

worker_id=$($WP menu item add-custom main-menu "Worker" "$BASEURL/worker" --porcelain)
$WP menu item add-custom main-menu "FAQ" "$BASEURL/worker/faq" --parent-id=$worker_id

$WP menu item add-custom main-menu "Contact Us" "$BASEURL/contact"

#################### front-page-menu #######################################################################################
$WP menu create front-page-menu
$WP menu location assign front-page-menu front-page-menu

#################### pubsub-member-menu #######################################################################################
$WP menu create pubsub-member-menu
$WP menu location assign pubsub-member-menu pubsub-member-menu


#################### footer-menu #######################################################################################
$WP menu create footer-menu
$WP menu location assign footer-menu footer-menu

$WP menu list --debug
