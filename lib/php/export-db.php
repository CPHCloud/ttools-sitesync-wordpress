<?php

include "sniff-environment.php";

$basedir = dirname(dirname(dirname(dirname(dirname(__FILE__)))));

//echo $basedir;


$sqldumpfile = "$basedir/temp/localdump.sql";


if (!file_exists("$basedir/temp")) {
	mkdir("$basedir/temp", 0777, true);
}


//return;

//Mamp mode
$socketInfo = null;
//if ($this->isMamp) {
//	$socketInfo = ' --socket ' . '/Applications/MAMP/tmp/mysql/mysql.sock';
//}


$cmd = 'mysqldump -u'
	. DB_USER
	. $socketInfo
	. ' -p' . escapeshellarg(DB_PASSWORD)
	. ' -h ' . DB_HOST
	. ' ' . DB_NAME
	. ' > ' . $sqldumpfile;
//. ' | gzip -c > ' . $file;

//running dump
exec($cmd);
//BackupLog::debug($cmd);

//taring
$cmd = "cd $basedir/temp/; nice -n 19 tar -zcf localdump.tar.gz localdump.sql;";
//BackupLog::debug($cmd);
exec($cmd);