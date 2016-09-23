#!/bin/bash

ECHO="/bin/echo"
CPR="/bin/cp -R"
CP="/bin/cp"
CHOWN="/bin/chown -R"
CHMOD="/bin/chmod -R"
RESTARTAPACHE="/etc/init.d/apache2 restart"

APACHE="/etc/apache2"
SITES_ENABLED="/etc/apache2/sites-enabled"
DEVELOPERS_FOLDER="/var/developers"

$ECHO "Copying developers websites"

$CPR websites/developerguest1_website $DEVELOPERS_FOLDER/
$CHOWN developerguest1.developers $DEVELOPERS_FOLDER/developerguest1_website
$CHMOD 775 /var/developers/developerguest1_website

$CPR websites/developerguest2_website $DEVELOPERS_FOLDER/
$CHOWN developerguest2.developers $DEVELOPERS_FOLDER/developerguest2_website
$CHMOD 775 /var/developers/developerguest2_website

$CPR websites/developers_website $DEVELOPERS_FOLDER/
$CHOWN developerguest1.developers $DEVELOPERS_FOLDER/developers_website
$CHMOD 775 /var/developers/developers_website

$ECHO "Copying john website"
$CPR websites/john_website /var/www/
$CHOWN john.www-data /var/www/john_website
$CHMOD 775 /var/www/john_website

$ECHO "Copying apache sites"
$CP apache2/developerguest1.website.io.conf $SITES_ENABLED
$CP apache2/developerguest2.website.io.conf $SITES_ENABLED
$CP apache2/developers.website.io.conf $SITES_ENABLED
$CP apache2/john.website.io.conf $SITES_ENABLED

$ECHO "Copying apache conf file"
$CP apache2/apache2.conf $APACHE

$ECHO "Restarting Apache2"
$RESTARTAPACHE
