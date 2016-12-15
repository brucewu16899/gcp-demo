#!/bin/bash
source cfg.sh
# Test db

if [ `bq ls $DATASET | grep "Not found" | wc -l` = "1" ] ; then
	echo "dataset not found..."
	bq mk $DATASET
fi

if [ `bq ls $DATASET | grep $TABLE | wc -l` = "0" ] ; then
	echo "table not found..."
	bq mk $DATASET.$TABLE $SCHENA
fi

# Load data to cloud storage
gsutil cp $FILE $GCS_BUCKET

# Load data from storage to bigquery 
bq load $PROJECT:$DATASET.$TABLE $GCS_BUCKET/$FILE $SCHEMA
