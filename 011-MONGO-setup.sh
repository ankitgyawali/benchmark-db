#!/bin/bash
mongoimport --db bestbuy --collection products --type json --file ../open-data-set/products.json --jsonArray &>/dev/null
