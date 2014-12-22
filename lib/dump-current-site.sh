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

rsync -az --delete --info=progress2 $FILES_PATHS $FILESDIR;
