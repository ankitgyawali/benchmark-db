#!/bin/bash
PRODUCT_COUNT_TO_SEARCH=500
mysql -u root -p$MYSQL_PWD bestbuy  -e "SELECT * FROM products p1 INNER JOIN (  SELECT sku FROM products LIMIT $PRODUCT_COUNT_TO_SEARCH) p2 on p2.sku = p1.sku" >/dev/null 2>/dev/null
