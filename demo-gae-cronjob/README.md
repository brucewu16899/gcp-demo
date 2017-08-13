# GAE Cron Job

新版本的GAE讓Cron的Deploy更簡單，只需要透過cron.yaml檔案描述corn job，然後就可以透過gloud app deploy部署到GAE環境。

## 準備

* 需要事先安裝gcloud sdk，並通過認證
* crontab中的url會回指回GAE本身的routing，因此該路必須存在且提供服務

## Create

建立過程需要先準備corn.yaml檔案，然後再進行deploy該檔案。

```
cat << EOF > cron.yaml
cron:
- description: demo job
  url: /tasks/summary
  target: beta
  schedule: every 1 mins
EOF

gcloud app deploy cron.yaml
```


## Delete

刪除的動作則需要準備一個空的cron.yaml檔案，再將該檔案部署至GAE..

```
echo cron: > cron.yaml
gcloud app deploy cron.yaml
```
