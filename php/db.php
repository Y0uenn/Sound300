<?php
include "../php/constants.php";
$mysqlServerIp="127.0.0.1";
$mysqlServerPort = "3306";
$mysqlDbName = DB_NAME;
$mysqlDbCharset = "UTF8";
$mysqlDsn = "mysql:host=".$mysqlServerIp.";port=".$mysqlServerPort.";dbname=".$mysqlDbName.";charset=".$mysqlDbCharset.";";

// GRANT ALL ON tp7.* TO user@127.0.0.1 IDENTIFIED BY 'nunu';
// SELECT User, Host FROM mysql.user WHERE Host <> 'localhost';
// DELETE FROM mysql.user WHERE User='user' AND Host='127.0.0.1.%';

$myUserDb = DB_USER ;
$myPwdDb = DB_PASSWORD ;

$dbCnx = new PDO($mysqlDsn, $myUserDb, $myPwdDb);
?>
