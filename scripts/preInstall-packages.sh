#!/bin/bash
#
#  Based on AWS Linux running on EC2 instance
#

# Install Apache, MySQL, and PHP

yum groupinstall -y "Web Server" "MySQL Database" "PHP Support"
yum install -y php-mysql

