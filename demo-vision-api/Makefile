export TOKEN=$(shell gcloud auth application-default print-access-token)
gen-request:
		echo "{\"requests\":[{\"image\":{\"content\":\"`base64 humon001.png`\"},\"features\":[{\"type\":\"FACE_DETECTION\",\"maxResults\":3},{\"type\":\"LABEL_DETECTION\",\"maxResults\":2}]}]}" > test.json

request:
		curl -H "Authorization:Bearer ${TOKEN}"  -H "Content-type: application/json" "https://vision.googleapis.com/v1/images:annotate" -d @test.json

request-from-gcs:
		curl -H "Authorization:Bearer ${TOKEN}"  -H "Content-type: application/json" "https://vision.googleapis.com/v1/images:annotate" -d @test-from-gcs.json

request-from-url:
		curl -H "Authorization:Bearer ${TOKEN}"  -H "Content-type: application/json" "https://vision.googleapis.com/v1/images:annotate" -d @test-from-url.json
