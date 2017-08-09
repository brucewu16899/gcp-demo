# Natural Language API

## Sample request

Prepare Token

```
export TOKEN=`gcloud auth application-default print-access-token`
```

Prepare test request

```
{
  "document":{
    "type":"PLAIN_TEXT",
    "content":"Michelangelo Caravaggio, Italian painter, is known for 'The Calling of Saint Matthew'."
  },
  "encodingType":"UTF8"
}
```

Request

```
curl -s -k -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${TOKEN}" \
    https://language.googleapis.com/v1/documents:analyzeEntities \
    -d @request.json
```


## Using Makefile

Create the request body:

```
$ make gen-request TXT="Simon will go to Google Office, will you with him?"
echo '{"document":{"type":"PLAIN_TEXT","content":"Simon will go to Google Office, will you with him?"},"encodingType":"UTF8"}' > test.json
```

Create the request

```
$ make request
curl -s -k -H "Content-Type: application/json" -H "Authorization: Bearer ya29.Gl1T...Uf_mJY" https://language.googleapis.com/v1/documents:analyzeEntities -d @test.json
{
  "entities": [
    {
      "name": "Simon",
      "type": "PERSON",
      "metadata": {},
      "salience": 0.87932295,
      "mentions": [
        {
          "text": {
            "content": "Simon",
            "beginOffset": 0
          },
          "type": "PROPER"
        }
      ]
    },
    {
      "name": "Google Office",
      "type": "ORGANIZATION",
      "metadata": {},
      "salience": 0.12067705,
      "mentions": [
        {
          "text": {
            "content": "Google Office",
            "beginOffset": 17
          },
          "type": "PROPER"
        }
      ]
    }
  ],
  "language": "en"
}
```