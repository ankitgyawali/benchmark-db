#!/bin/bash
mongo bestbuy --quiet --eval 'db.products.createIndex( { description: "text" } )' >/dev/null 2>/dev/null
mongo bestbuy --quiet --eval 'DBQuery.shellBatchSize = 500; db.products.find( { $text: { $search: "On sale" } } ).limit(500)' >/dev/null 2>/dev/null
