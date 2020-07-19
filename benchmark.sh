#1/bin/bash

RED='\033[0;31m'
BLUE='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

INFO="$BLUE[INFO]:$NC"
OK="$GREEN[OK]:$NC"
ERROR="$RED[ERROR]:$NC"
WARN="$YELLOW[WARN]:$NC"

if [ -z $1 ] || [ ! -f $1 ] ||  [ -z $2 ] ||  [ -z $3 ]; then
    echo -e "${ERROR} Appropriate agruments not provided. Usage: benchmark.sh [script_to_benchmark.sh] [output_file_to_produce] [num_of_iterations]"
    echo -e "${INFO} Example: ./benchmark.sh 011-setup-mongo.sh mongo_setup.csv 10"
    exit
fi

script_name=$1
script_name_tag=$2
iteration=$3

rm $script_name_tag

echo -e "${OK} Benchmarking:  $script_name script for $iteration iterations."
echo -e "${OK} Output will be stored at $script_name_tag."

for i  in $(seq "$iteration");
do
    start=`date +%s.%N`
        bash $script_name
    end=`date +%s.%N`
    runtime=$( echo "$end - $start" | bc -l ) 
    echo -e "${INFO} Iteration $i: Runtime $runtime"
    echo $runtime >> $script_name_tag
done
