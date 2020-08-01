#!/bin/bash
mysql -u root -p$MYSQL_PWD bestbuy < 92-teardown.sql
