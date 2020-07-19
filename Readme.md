## benchmark-db

This mini project aims to benchmark a bunch of use-case specific queries for MySQL & MongoDB. The goal is to produce data that allows us to analyze which database is better in various E-Commerce scenarios.

Use cases benchmarked on this iteration:
    - Complete catalog ingest
    - Catalog promotion update
    - Single Product Fetch
    - Multiple Product Fetches

### benchmark.sh

Benchmark.sh is the main test harness that takes in three arguments in this order.
1. Script to benchmark
2. Output file to produce
3. Number of iterations to run the script

Sample usage looks like so:  ./benchmark.sh 011-setup-mongo.sh mongo_setup.csv 2


## Results

Results of the project will be submitted inside the "docs" folder.
