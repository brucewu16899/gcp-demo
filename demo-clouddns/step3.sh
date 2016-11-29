#!/bin/bash
gcloud dns record-sets transaction start -z=iotzone
gcloud dns record-sets transaction add -z=iotzone --name="aaa.iot.linkerdcos.io." --type=A --ttl=300 "7.5.7.8"
gcloud dns record-sets transaction execute -z=iotzone
