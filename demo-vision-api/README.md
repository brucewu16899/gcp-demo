# Vision API Demo

Setup token...

```
export TOKEN=`gcloud auth application-default print-access-token`
```

Create the post content using image "humon001.png"...

```
echo "{\"requests\":[{\"image\":{\"content\":\"`base64 humon001.png`\"},\"features\":[{\"type\":\"FACE_DETECTION\",\"maxResults\":3},{\"type\":\"LABEL_DETECTION\",\"maxResults\":2}]}]}" > test.json
```

or using EOF way for create...

```
cat <<EOF > test.json
{"requests":[{"image":{"content":"`base64 humon001.png`"},"features":[{"type":"FACE_DETECTION","maxResults":3},{"type":"LABEL_DETECTION","maxResults":2}]}]}
EOF
```

Post the body to Vision API...

```
curl -H "Authorization:Bearer $TOKEN"  -H "Content-type: application/json" "https://vision.googleapis.com/v1/images:annotate" -d @test.json
```

## Using Makefile

Create the request object file...

```
make gen-request
```

Do request...

```
make request
```