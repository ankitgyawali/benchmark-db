#!/bin/bash
PRODUCT_COUNT_TO_SEARCH=500
for i  in $( mysql -u root -p$MYSQL_PWD bestbuy -N -B -e "select sku from products limit $PRODUCT_COUNT_TO_SEARCH" 2>&1 | grep -v "Warning");
do  
    mysql -u root -p$MYSQL_PWD bestbuy -N -B -e "update products set price=9.99, description='On Sale' where sku=$i" >/dev/null 2>/dev/null
done
