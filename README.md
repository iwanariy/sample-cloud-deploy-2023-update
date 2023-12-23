Cloud Deploy 2023 updates sample
===

このファイルは [Google Cloud Advent Calendar 2023 (通常版)](https://zenn.dev/google_cloud_jp/articles/cloud-deploy-updates-2023) 12/24 分のサンプルファイルです。
動作保証はございませんので、参考程度にご確認下さい。

## Getting Started

`init.sh` ファイル内の `PROJECT_ID` 等を書き換え、 `./init.sh` を実行してから利用して下さい。


## Permission
以下は、権限が過剰 or 権限等が不足している可能性がありますので、参考として記載しています。

```bash
PROJECT_ID="YOUR_PROJECT_ID"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member=serviceAccount:$(gcloud projects describe $PROJECT_ID \
    --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
    --role="roles/clouddeploy.jobRunner"

gcloud iam service-accounts add-iam-policy-binding $(gcloud projects describe $PROJECT_ID \
    --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
    --member=serviceAccount:$(gcloud projects describe $PROJECT_ID \
    --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
    --role="roles/iam.serviceAccountUser" \
    --project=$PROJECT_ID

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member=serviceAccount:$(gcloud projects describe $PROJECT_ID \
    --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
    --role="roles/run.admin"
```