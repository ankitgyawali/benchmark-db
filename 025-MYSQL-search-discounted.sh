#!/bin/bash
PRODUCT_COUNT_TO_SEARCH=500
mysql -u root -p$MYSQL_PWD bestbuy -N -B -e "select * from products where description like '%sale%' limit $PRODUCT_COUNT_TO_SEARCH" >/dev/null 2>/dev/null
