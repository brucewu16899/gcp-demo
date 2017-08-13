# 設定GCS Bucket Lifecycle

GCS支援透過gsutil指定Bucket內物件的生命週期，透過如夏的config檔指定物件存在的時間與所使用的Class

```
{
"lifecycle": {
  "rule": [
  {
    "action": {"type": "Delete"},
    "condition": {
      "age": 30,
      "isLive": true
    }
  },
  {
    "action": {"type": "Delete"},
    "condition": {
      "isLive": false,
      "numNewerVersions": 3
    }
  }
]
}
}
```
上述設定檔第一部分指定物件在30天之後進行刪除動作，第二部分則是針對檔案啟用Version管理功能時候，最多保留3個線上版本。


```
# gsutil lifecycle set config.json gs://cccccccccc/
Setting lifecycle configuration on gs://cccccccccc/...
```

```
# gsutil lifecycle get gs://cccccccccc/
{"rule": [{"action": {"type": "Delete"}, "condition": {"age": 30, "isLive": true}}, {"action": {"type": "Delete"}, "condition": {"isLive": false, "numNewerVersions": 3}}]}
```
