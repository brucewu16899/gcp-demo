# MQTT server on docker

這是個簡單的MQTT Server的docker compose範例，透過啟動MQTT Server後，即可用client.js做測試...

## Start Server

```
docker-compose -f compose.yaml up -d
```


## Check

```
docker-compose -f compose.yaml ps
```

如果啟動無誤，可以看到類似下面訊息：

```
           Name                      Command          State            Ports
--------------------------------------------------------------------------------------
demodockermqtt_db_1           /entrypoint.sh mongod   Up      0.0.0.0:27017->27017/tcp
demodockermqtt_mqttserver_1   mosca -v                Up      0.0.0.0:1883->1883/tcp
```


## 測試

```
cd mqttclient && node client.js
```

如果連線無誤，可以看到下面訊息：

```
presence:: Hello mqtt
```

## 啟動emitter，持續發送訊息

```
node emitter.js
```

如果正常啟動，會每固定時間發送訊息給有接收這個訊號的client...
