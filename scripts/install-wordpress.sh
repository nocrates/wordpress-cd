#!/bin/bash

#############################
# Install WordPress files
#############################
tar xvf wordpress-4.1.1.tar.gz
mv wordpress/* /var/www/html/
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

#############################
#  Change file permissions
#############################
chown -R apache:apache /var/www/html/*
find /var/www/html -type d -exec chmod 775 {} \;
find /var/www/html -type f -exec chmod 664 {} \;
usermod -a -G apache ec2-user

#############################
# Modify wp-config
#############################

sed -i "s/\('DB_HOST', '\)\([^']*\)/\1localhost/g" /var/www/html/wp-config.php
sed -i "s/\('DB_NAME', '\)\([^']*\)/\1wordpress/g" /var/www/html/wp-config.php
sed -i "s/\('DB_USER', '\)\([^']*\)/\1wordpress/g" /var/www/html/wp-config.php
sed -i "s/\('DB_PASSWORD', '\)\([^']*\)/\1abcd1234/g" /var/www/html/wp-config.php
