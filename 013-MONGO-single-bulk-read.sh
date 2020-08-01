#!/bin/bash
mongo bestbuy --quiet --eval 'DBQuery.shellBatchSize = 500; db.products.find({}).limit(500)' >/dev/null 2>/dev/null
