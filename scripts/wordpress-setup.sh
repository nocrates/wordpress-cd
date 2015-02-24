#!/bin/bash

########################################################
#  POST installation variables to WordPress install.php
########################################################
curl -X POST \
--data "weblog_title=test&user_name=admin&admin_password=admin&admin_password2=admin&admin_email=admin@example.com" \
-i http://localhost/wp-admin/install.php?step=2

