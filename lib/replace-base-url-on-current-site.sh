#!/bin/bash
# This script overwrites the base url in an imported database
# With the base url set in the environment settings
# expects one given parameter - the url to replace

#NOTE that this parameter can't have any spaces (crazy things are going on if so)
#But that's not really an issue here


if [ -z "${1}" ]; then
	echo "base_url is unset. Please add the base_url you want to replace with to the url."
	exit;
fi


BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";
MODULEDIR="$BASEDIR/ttools-sitesync-wordpress";
WPPATH="$BASEDIR/public/";


#Script can be called with a second environment parameter
ENV=LOCAL;
if [ "${2}" ]; then
	ENV=$2;
fi
ENVVARS="$BASEDIR/ttools-core/lib/vars-for-env.sh $ENV"
eval `$ENVVARS`



SEARCH="$1";
REPLACE="$($ENV_PHPPATH $MODULEDIR/lib/php/echo-base_url.php)"


#SEARCH="'MrWordPress'";
#SEARCH="http://kongernes-samling:8888/";


echo "Now replacing $SEARCH with $REPLACE...";



cd $WPPATH;



#cmd="php $MODULEDIR/thirdparty/wp-cli.phar search-replace $SEARCH $REPLACE --dry-run"
cmd="$ENV_PHPPATH $MODULEDIR/thirdparty/wp-cli.phar search-replace $SEARCH $REPLACE"
echo "Executing:"
echo $cmd;
echo;
$cmd;




