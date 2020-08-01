#!/usr/bin/python3
from pypika import Query, Table, Field
import json

print("Building SQL queries for test..")

products_table = Query.into('products')
products_has_categories_table = Query.into('products_has_categories')

with open('../open-data-set/products.json') as g:
  products = json.load(g)
  g.close()

for product in products:
    products_table = products_table.insert(product['sku'], product['name'], 
                            product['type'], product['price'], product['upc'], product['shipping'], 
                            product['description'], product.get('manufacturer', 'False'), product.get('model', 'False'), 
                            product['url'], product['image'])

    for categoryid in product['category']:
        products_has_categories_table = products_has_categories_table.insert(product['sku'], categoryid['id'])

dml_sql_file = open("91-dml.sql", "w")

dml_sql_file.write('use bestbuy;')
dml_sql_file.write("\n")

dml_sql_file.write(products_has_categories_table.get_sql().replace('"products_has_categories"', 'products_has_categories') + ';')
dml_sql_file.write("\n")

dml_sql_file.write(products_table.get_sql().replace('"products"', 'products') + ';')
dml_sql_file.close()

print("Completed succesfully.")
