# Datalab

## Start datalab at Local


```
export ENTRYPOINT=/datalab/run.sh
export PORJECT_ID=[your-project-id]
export CONTENT=[your-content-path]

$ docker run -it \
  --entrypoint=$ENTRYPOINT \
  -p 127.0.0.1:8080:8080 \
  -v "$CONTENT:/content" \
  -e "PROJECT_ID=$PROJECT_ID" \
  -e "DATALAB_ENV=local" \
  -e "DATALAB_DEBUG=true" \
  -e 'DATALAB_SETTINGS_OVERRIDES={"consoleLogLevel": "debug" }' \
  gcr.io/cloud-datalab/datalab:latest
```

## Start datalab at Cloud

```
datalab create --no-create-repository regression
```