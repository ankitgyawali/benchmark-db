#!/bin/bash
PRODUCT_COUNT_TO_SEARCH=500
for i  in $(mongo bestbuy --quiet --eval 'DBQuery.shellBatchSize = 500; db.products.find({}, {sku:1, _id: 0}).limit(500).toArray()' | jq '.[].sku');
do
    mongo bestbuy --quiet --eval "db.products.findOne({ sku: $i})" >/dev/null 2>/dev/null
done


