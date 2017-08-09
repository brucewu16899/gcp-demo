export TOKEN=$(shell gcloud auth application-default print-access-token)
gen-request:
		echo "{\"requests\":[{\"image\":{\"content\":\"`base64 humon001.png`\"},\"features\":[{\"type\":\"FACE_DETECTION\",\"maxResults\":3},{\"type\":\"LABEL_DETECTION\",\"maxResults\":2}]}]}" > test.json

request:
		curl -s -k -H "Content-Type: application/json" -H "Authorization: Bearer ${TOKEN}" https://speech.googleapis.com/v1/speech:recognize -d @test.json

sample-request:
		curl -s -k -H "Content-Type: application/json" -H "Authorization: Bearer ${TOKEN}" https://speech.googleapis.com/v1/speech:recognize -d @sample.json
