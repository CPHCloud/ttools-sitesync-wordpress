#!/bin/bash
#This script overwrites the current site
#Only database is overwritten here - asset sync is handled by core
#Called from sitesync-core
#Needs to be supplied with database file and environment

FILE=$1
ENV=$2


BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";
MODULEDIR="$BASEDIR/ttools-sitesync-wordpress";
WPPATH="$BASEDIR/public/";

ENVVARS="$BASEDIR/ttools-core/lib/vars-for-env.sh $ENV"
eval `$ENVVARS`

cd $WPPATH;

$ENV_PHPPATH $MODULEDIR/thirdparty/wp-cli.phar db import $FILE
