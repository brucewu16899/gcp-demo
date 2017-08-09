# Speech API

## Record a Voice file

If your sox cannot support flac, please try to reinstall...

```
brew remove sox
brew install sox --with-lame --with-flac --with-libvorbis
```

Record audio in Mac..

```
sox -d output.wav
``` 

Convert wav to flac

```
sox output.wav --rate 16k --bits 16 --channels 1 output.flac
```

## Do request

```
$ curl -s -k -H "Content-Type: application/json" -H "Authorization: Bearer ya29.GlxUB...Pzgk5g" https://speech.googleapis.com/v1/speech:recognize -d @test.json
{
  "results": [
    {
      "alternatives": [
        {
          "transcript": "hello how are you I'm fine thank you and you",
          "confidence": 0.97644997
        }
      ]
    }
  ]
}
```

