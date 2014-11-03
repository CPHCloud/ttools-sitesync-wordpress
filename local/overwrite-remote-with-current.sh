#! /bin/bash
#Overwriting the Dev sever from localhost
#This could be extended to also work with other servers
#See discussion below

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";
MODULEDIR="$BASEDIR/ttools-sitesync-wordpress";

#hardcoding environment (for now)
#As a note, it's pretty wise that this is hard coded
#as we don't want anyone to accidentally do this on the live
#environment, or a test environment where a client is setting
#data up, but a future version could do this a little more
#intelligently

ENV="Dev"
ENVVARS="$BASEDIR/ttools-core/lib/vars-for-env.sh $ENV"
eval `$ENVVARS`


echo "Now Pushing Your Database & Assets to your $ENV environment...";


echo "Dumping site...";

$BASEDIR/ttools-sitesync-core/lib/dump-current-site.sh dump;



echo "Now syncing files up to the $ENV environment...";

$BASEDIR/ttools-sitesync-core/lib/sync-dump-to-env.sh $ENV;


echo "Connecting with $ENV for import";

#On the server we'll be doing the following

#1. Loading db and files from the dump we just uploaded into the site
SERVER_OVERWRITE_CMD="$ENV_REPODIR/ttools-sitesync-core/lib/overwrite-current-site.sh $ENV";
#2. Replace the base url in the uploaded database with the one that's set on the server
LOCAL_BASE_URL="$(php $MODULEDIR/lib/php/echo-base_url.php)"
SERVER_REPLACE_CMD="$ENV_REPODIR/ttools-sitesync-wordpress/lib/replace-base-url-on-current-site.sh $LOCAL_BASE_URL $ENV";

SERVER_COMMANDS="$SERVER_OVERWRITE_CMD;$SERVER_REPLACE_CMD;";


#echo $SERVER_COMMANDS;

ssh $ENV_CUSTOM_SSHCONNECTIONSTR -t $SERVER_COMMANDS 

