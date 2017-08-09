export TOKEN=$(shell gcloud auth application-default print-access-token)
gen-request:
		echo '{"document":{"type":"PLAIN_TEXT","content":"${TXT}"},"encodingType":"UTF8"}' > test.json
request:
		curl -s -k -H "Content-Type: application/json" -H "Authorization: Bearer ${TOKEN}" https://language.googleapis.com/v1/documents:analyzeEntities -d @test.json


