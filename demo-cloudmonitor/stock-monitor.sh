#!/bin/bash

# Execute: bash add-stock-2330.sh 2330.TW 10

# Prepare the environment
export PATH=~/project/googlews/gcmetrics/bin:$PATH

# Do the loop for insert data
while [ true ] ; 
do
	gcmetric -t simple -n stock -d `curl -sS -L "http://finance.yahoo.com/d/quotes.csv?s=$1&f=snd1l1c6" | awk -F',' '{print $4}'`
	sleep $2
done
