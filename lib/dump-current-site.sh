#!/bin/bash
#This script dumps the current site
#Called from sitesync-core
#Needs to be supplied with db name, files dir, and environment

DBNAME=$1
FILESDIR=$2
ENV=$3


BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";
MODULEDIR="$BASEDIR/ttools-sitesync-wordpress";
WP_PATH="$BASEDIR/public";
FILES_PATHS="$WP_PATH/content/uploads"; #this can be one or more paths, separated with spaces


ENVVARS="$BASEDIR/ttools-core/lib/vars-for-env.sh $ENV"
eval `$ENVVARS`

cd $WP_PATH;


echo "Dumping database...";

$ENV_PHPPATH $MODULEDIR/thirdparty/wp-cli.phar db export $DBNAME


echo "Dumping files...";

#rewriting files dir a little to make sure
#they are saved relative to the repo root
FILESDIR="$FILESDIR/public/content";
mkdir -p $FILESDIR;


#note that --info=progress2 only works out-of-the-box on linux, not os OSX:
#http://serverfault.com/questions/219013/showing-total-progress-in-rsync-is-it-possible
#also see comment here:
#http://www.cyberciti.biz/faq/show-progress-during-file-transfer/


#spinner, from here:
#http://unix.stackexchange.com/questions/92920/use-the-command-bar-in-bash-without-i-o
#sp='/-\|'
str='.'
printf ' '
for i in $(seq 3); do
  printf "$str"
  #printf '\b%.1s' "$sp"
  #sp=${sp#?}${sp%???}
  str="$str."
  sleep 1
done
echo ''

rsync -az --delete $FILES_PATHS $FILESDIR;
#rsync -az --delete --info=progress2 $FILES_PATHS $FILESDIR;
