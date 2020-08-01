#!/bin/bash
for i  in $(mongo bestbuy --quiet --eval 'DBQuery.shellBatchSize = 500; db.products.find({}, {sku:1, _id: 0}).limit(500).toArray()' | jq '.[].sku');
do
    mongo bestbuy --quiet --eval 'db.products.updateOne({ sku: '$i' }, { $set:  { price: 9.99, description: "On sale"}})' >/dev/null 2>/dev/null
done

