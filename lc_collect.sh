#!/bin/bash

URL="http://192.168.1.9/"
OUTPUT="lc1000_dataset.csv"

echo "Algoritma,Run,ResponseTime,Throughput" > $OUTPUT

for i in {1..100}
do
result=$(ab -n 1000 -c 5 -k $URL)

rt=$(echo "$result" | grep "Time per request:" | head -1 | awk '{print $4}')
tp=$(echo "$result" | grep "Requests per second" | awk '{print $4}')

echo "LeastConnection,$i,$rt,$tp" >> $OUTPUT

sleep 1
done

echo "Data Least Connection selesai disimpan di $OUTPUT"
