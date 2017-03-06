#!/bin/bash

echo '[wp-cli user configuration]'

WP='/usr/bin/sudo -u www-data /bin/wp-cli.phar'
SRC_DB='example_db'
TS=`date +'%Y:%m:%d %H:%M:%S'`

echo $TS;
# configure roles and accounts
$WP role create member Member
$WP db query "INSERT INTO wp_ps_groups VALUES (2,'Members','Members',1,'$TS',NULL,'none')"
$WP role create agent Agent
$WP db query "INSERT INTO wp_ps_groups VALUES (3,'Agents','Agents',1,'$TS',NULL,'none')"


# create a test Agent account
#$WP user create testagent testagent@ohmydocker.com --role=agent --user_pass='testagent123' --display_name="Test Agent"
#$WP user meta add testagent agentid "18"
#$WP db query "INSERT INTO wp_ps_groups_relationships VALUES (2,3,2,NULL)"

# create a test Member account
#$WP user create testmember testmember@ohmydocker.com --role=member --user_pass='testmember123' --display_name="Test Member"
#$WP user meta add testmember memberid "0001A"

MEMBERS=($(echo "SELECT id from ${SRC_DB}.members WHERE active = 'Y'" | wp db cli | sed -e 's/id//'))
for id in "${MEMBERS[@]}"
do
	name=$(echo "SELECT name from ${SRC_DB}.members WHERE id = \"$id\"" | wp db cli | sed -E "s/name//g" | sed ':a;N;$!ba;s/\n//g')
	password=$(echo "SELECT password from ${SRC_DB}.members WHERE id = \"$id\"" | wp db cli | sed -E "s/password//g" | sed ':a;N;$!ba;s/\n//g')
	agencyid=$(echo "SELECT agencyid from ${SRC_DB}.members WHERE id = \"$id\"" | wp db cli | sed -E "s/agencyid//g" | sed ':a;N;$!ba;s/\n//g')
	userid=$id
	echo "Importing [member]: $userid - $name - $password"
	$WP user create $userid $userid@fisif.com --role=member --user_pass="$password" --display_name="$name" --first_name="$name"
	WPUID=$($WP user get $userid --field=ID)
	$WP user meta add $userid agencyid "$agencyid"
	$WP db query "INSERT INTO wp_ps_group_relationships VALUES ($WPUID,2,$WPUID,NULL)"
done
