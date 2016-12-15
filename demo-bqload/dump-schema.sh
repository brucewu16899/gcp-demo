#!/bin/bash
source cfg.sh
bq --format=json show $PROJECT:$DATASET.$TABLE | json schema.fields | cat > schema.json
