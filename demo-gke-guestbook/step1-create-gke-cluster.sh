#!/bin/bash
#gcloud container clusters create guestbook
export CLUSTER_NAME=guestbook
export INST_SIZE=3
export TYPE=g1-small
export ZONE=asia-east1-c

gcloud \
  container clusters create $CLUSTER_NAME \
  --num-nodes $INST_SIZE \
  --machine-type $TYPE \
  --zone $ZONE
