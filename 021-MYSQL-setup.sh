#!/bin/bash

mysql -u root -p$MYSQL_PWD < 90-ddl.sql
mysql -u root -p$MYSQL_PWD bestbuy < 91-dml.sql

