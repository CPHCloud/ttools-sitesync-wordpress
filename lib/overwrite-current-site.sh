#!/bin/bash
#This script overwrites the current site
#Called from sitesync-core
#Needs to be supplied with db name, files dir, and environment

DBNAME=$1
FILESDIR=$2
ENV=$3


BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";
MODULEDIR="$BASEDIR/ttools/sitesync-wordpress";
WP_PATH="$BASEDIR/public";

ENVVARS="$BASEDIR/ttools/core/lib/vars-for-env.sh $ENV"
eval `$ENVVARS`

cd $WP_PATH;

echo "Importing database...";

$ENV_PHPPATH $MODULEDIR/thirdparty/wp-cli.phar db import $DBNAME

echo "Importing files...";

FILES_TO_IMPORT=$FILESDIR/public/content/uploads/;



rsync -avz --delete $FILES_TO_IMPORT $WP_PATH/content/uploads;



