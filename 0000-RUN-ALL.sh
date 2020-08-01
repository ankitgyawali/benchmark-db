#1/bin/bash

# Number of times to setup & teardown a "catalog" for benchmarking
ITERATIONS=10
# Number of times e-commerce use cases activity should be executed
ITER_FACTOR=3


# OPTIONAL or define it before hand
# python 020-1-init-sql-cluster-queries.py

# Cleanup for benchmark
rm *MONGO*.csv
rm *MYSQL*.csv

for i in $( eval echo {1..$ITERATIONS} )
do
    start_iter=`date +%s.%N`

    # ## MONGODB
    ./0001-BENCHMARK.sh 011-MONGO-setup.sh 011-MONGO-setup.csv 1
    ./0001-BENCHMARK.sh 012-MONGO-multi-reads.sh 012-MONGO-multi-reads.csv $ITER_FACTOR
    ./0001-BENCHMARK.sh 013-MONGO-single-bulk-read.sh 013-MONGO-single-bulk-read.csv $ITER_FACTOR
    ./0001-BENCHMARK.sh 014-MONGO-multi-discount-update.sh 014-MONGO-multi-discount-update.csv $ITER_FACTOR
    ./0001-BENCHMARK.sh 015-MONGO-search-discounted.sh 015-MONGO-search-discounted.csv $ITER_FACTOR
    ./0001-BENCHMARK.sh 016-MONGO-teardown.sh 016-MONGO-teardown.csv 1

    # ## MYSQL
    ./0001-BENCHMARK.sh 021-MYSQL-setup.sh 021-MYSQL-setup.csv 1
    ./0001-BENCHMARK.sh 022-MYSQL-multi-reads.sh 022-MYSQL-multi-reads.csv $ITER_FACTOR
    ./0001-BENCHMARK.sh 023-MYSQL-single-bulk-read.sh 023-MYSQL-single-bulk-read.csv $ITER_FACTOR
    ./0001-BENCHMARK.sh 024-MYSQL-multi-discount-update.sh 024-MYSQL-multi-discount-update.csv $ITER_FACTOR
    ./0001-BENCHMARK.sh 025-MYSQL-search-discounted.sh 025-MYSQL-search-discounted.csv $ITER_FACTOR
    ./0001-BENCHMARK.sh 026-MYSQL-teardown.sh 026-MYSQL-teardown.csv 1

    end_iter=`date +%s.%N`
    iter_runtime=$( echo "$end_iter - $start_iter" | bc -l ) 
    echo -e "RUNTIME for a complete setup/teardown #$i: Runtime $iter_runtime"
done

paste -d , 011-MONGO-setup.csv 012-MONGO-multi-reads.csv 013-MONGO-single-bulk-read.csv 014-MONGO-multi-discount-update.csv 015-MONGO-search-discounted.csv 016-MONGO-teardown.csv >> RESULTS_MDB.csv
paste -d , 021-MYSQL-setup.csv 022-MYSQL-multi-reads.csv 023-MYSQL-single-bulk-read.csv 024-MYSQL-multi-discount-update.csv 025-MYSQL-search-discounted.csv 026-MYSQL-teardown.csv >> RESULTS_MSQL.csv

## Backups
cp RESULTS_MDB.csv RESULTS_MDB_R.csv
cp RESULTS_MSQL.csv RESULTS_MSQL_R.csv
cp RESULTS_MDB.csv ../RESULTS_MDB_BACKUP.csv
cp RESULTS_MSQL.csv ../RESULTS_MSQL_BACKUP.csv
