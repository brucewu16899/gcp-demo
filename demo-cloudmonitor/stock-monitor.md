# 簡單的做個股票監控

## Yahoo股票API

Yahoo有提供一個公開的股票API介面，可以透過下面的方式簡單的瀏覽所要看的股票資訊，在這邊以2330.TW這支股票為例，下面是取出該股票資訊的方法

```
curl -sS -L 'http://finance.yahoo.com/d/quotes.csv?s=2330.TW&f=snd1l1c6'
```

## 建立監控

在開始輸入資料前，需要先建立要收容這個資料的監控類別，這邊我們只收一支股票資料，所以只要能夠把值呈現出來即可。

### 先建立監控類別

這邊透過init來初始化stock這個名稱的監控，指令如下：

```
gcmetric -t init -n stock
```

### 新增一筆簡單的資料

設定好後，我們先簡單的測試一下執行：

```
gcmetric -t simple -n stock -d `curl -sS -L "http://finance.yahoo.com/d/quotes.csv?s=2330.TW&f=snd1l1c6" | awk -F',' '{print $4}'`
```

除果上面的輸入沒有錯誤，應該會出現類似這樣的資訊：

```
[2015-08-12 09:44:36.305] [DEBUG] [default] - [index.js - writeTimeSeries] create timeseries metric with: {"url":"https://www.googleapis.com/cloudmonitoring/v2beta2/projects/mitac-cp300-taipei101/timeseries:write","json":{"timeseries":[{"timeseriesDesc":{"project":"mitac-cp300-taipei101","metric":"custom.cloudmonitoring.googleapis.com/stock"},"point":{"start":"2015-08-12T01:44:36.305Z","end":"2015-08-12T01:44:36.305Z","doubleValue":"129.00"}}]},"method":"POST"}
```

### 連續執行

如果一切無誤，可以透過簡單的forever loop來做連續執行：

```
while [ true ] ;
do
  gcmetric -t simple -n stock -d `curl -sS -L "http://finance.yahoo.com/d/quotes.csv?s=$1&f=snd1l1c6" | awk -F',' '{print $4}'`
  sleep $2
done
```

其中$1, $2是由指令列帶入的參數

## 建立報表

建立報表部分，請參考：https://github.com/peihsinsu/gcmetrics/blob/master/sample.md#add-to-cloud-monitor
