## benchmark-db

This mini project aims to benchmark a bunch of use-case specific queries for MySQL & MongoDB. The goal is to produce data that allows us to analyze which database is better in various E-Commerce scenarios.

Use cases benchmarked on this iteration:
    - Complete catalog ingest - 011*.sh & 021*.sh
    - Single Product Fetch - 012*.sh & 022*.sh
    - Multiple Product Fetches - 013*.sh & 023*.sh
    - Catalog promotion update - 014*.sh & 024*.sh
    - Catalog Search Query - 015*.sh & 025*.sh
    - Complete catalog teardown - 016*.sh & 026*.sh

## Results

Graphs will be available [here](https://github.com/ankitgyawali/benchmark-db/blob/master/Graph.md).

Reports if committed will be placed on `/docs` folder as pdf format.

### 0000-RUN-ALL.sh

Run all performs a complete test between mysql & mongodb by utilizing 0001-BENCHMARK.sh across configured iterations of setting up & tearing down databases with use cases benchmarked in between

### 0001-BENCHMARK.sh

Benchmark.sh is the main test harness that takes in three arguments in this order.
1. Script to benchmark
2. Output file to produce
3. Number of iterations to run the script

Sample usage looks like so:  ./benchmark.sh 011-setup-mongo.sh mongo_setup.csv 2


## Usage 
- Install MongoDB 3.6.3 & MySQL 8.0.21
- Ensure you have python3 & jq installed.
- Run `020-1-init-sql-cluster-queries.py` with appropriate bestbuy dataset product catalog referenced to init DDL queries for MySQL.
- Run `0000-RUN-ALL.sh` with iterations # configured and the benchmarks will be stored on `RESULTS_MDB.csv` & `RESULTS_MSQL.csv` upon completion.
- Optionally graph these csv files using `Graph.Rmd` (requires R installation). 
