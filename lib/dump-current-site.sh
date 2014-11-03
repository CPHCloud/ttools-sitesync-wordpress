#!/bin/bash
#This script dumps the current site
#Needs to be supplied with file and environment

FILE=$1
ENV=$2


BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";
MODULEDIR="$BASEDIR/ttools-sitesync-wordpress";
WPPATH="$BASEDIR/public/";

ENVVARS="$BASEDIR/ttools-core/lib/vars-for-env.sh $ENV"
eval `$ENVVARS`

cd $WPPATH;

$ENV_PHPPATH $MODULEDIR/thirdparty/wp-cli.phar db export $FILE
