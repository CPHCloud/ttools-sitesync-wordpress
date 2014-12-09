#!/bin/bash
#This script prompts for a url to replace the base url with
#It's an import helper:
#You import a database from a backup, and afterwards you run this script to
#make your site run on a new domain


BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";
MODULEDIR="$BASEDIR/ttools-sitesync-wordpress";


echo "CAUTION: You're about to replace the base url on your current site with the new one set in your configuration";
echo "Enter old url to replace:";

read URL;



$MODULEDIR/lib/replace-base-url-on-current-site.sh $URL;





