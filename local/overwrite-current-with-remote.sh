#! /bin/bash
#Overwrite Current with Remote
#Currently hard coded to be used to pull Dev into Local
#But can be modified to also work for pulling Live to Test/Dev (e.g. as a nightly task)

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";
MODULEDIR="$BASEDIR/ttools-wordpress-sync";


#hardcoding environment (for now)
ENV="Dev"
ENVVARS="$BASEDIR/ttools-core/lib/vars-for-env.sh $ENV"
eval `$ENVVARS`

echo "Now Overwriting Current Site with Database & Assets from $ENV environment...";


echo "Sniffing local path on $ENV...";

SERVER_COMMANDS="$ENV_PHPPATH $ENV_REPODIR/ttools-wordpress-sync/lib/php/echo-base_url.php";
SEARCH="$(ssh $ENV_CUSTOM_SSHCONNECTIONSTR -t $SERVER_COMMANDS)";
#echo search is $SEARCH;



echo "Dumping site on $ENV...";
SERVER_COMMANDS="$ENV_REPODIR/ttools-serversync/lib/dump-current-site.sh dump $ENV;";
ssh $ENV_CUSTOM_SSHCONNECTIONSTR -t $SERVER_COMMANDS;


echo "Downloading dump...";
$BASEDIR/ttools-serversync/lib/sync-dump-from-env.sh $ENV;


echo "Overwriting current site...";
$BASEDIR/ttools-serversync/lib/overwrite-current-site.sh;


echo "Replacing base url...";
$MODULEDIR/lib/replace-base-url-on-current-site.sh $SEARCH;
