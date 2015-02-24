#!/bin/bash

service mysqld start

mysql -u root <<-EOF
#  Set root password to abcd1234
UPDATE mysql.user SET Password=PASSWORD('abcd1234') WHERE User='root';
#
#  Remove remote access to root
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
#
#  Remove anonymous access
DELETE FROM mysql.user WHERE User='';
#
#  Remove test database
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';
#
#
FLUSH PRIVILEGES;
#
#  Create wordpress database
CREATE DATABASE wordpress;
#
#  Create wordpress user with password abcd1234
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'abcd1234';
#
#  Give wordpress user access to wordpress database
GRANT USAGE ON *.* TO wordpress@localhost IDENTIFIED BY 'abcd1234';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpress@localhost;
#
EOF

service mysqld stop
