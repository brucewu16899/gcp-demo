#!/bin/bash
source cfg.sh
export FOLDER=./files
export BACKUP=./backup
# Test db

if [ `bq ls $DATASET | grep "Not found" | wc -l` = "1" ] ; then
	echo "dataset not found..."
	bq mk $DATASET
fi

if [ `bq ls $DATASET | grep $TABLE | wc -l` = "0" ] ; then
	echo "table not found..."
	bq mk $DATASET.$TABLE $SCHENA
fi


for name in `ls $FOLDER` ; do
gsutil cp $FOLDER/$name $GCS_BUCKET && \
	bq load $PROJECT:$DATASET.$TABLE $GCS_BUCKET/$name $SCHEMA && \
	mv $FOLDER/$name $BACKUP 
done
