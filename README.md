Cloud Deploy 2023 updates sample
===

```bash
PROJECT_ID='iwanariy-cd-update-2023'
```

```bash
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
    --role="roles/run.developer"
```

```bash
gcloud deploy apply --file=clouddeploy.yaml --region=us-central1 --project=$PROJECT_ID
```

```bash
gcloud deploy releases create test-release-001 \
   --project=$PROJECT_ID \
   --region=us-central1 \
   --delivery-pipeline=my-run-demo-app-1 \
   --images=my-app-image=gcr.io/cloudrun/hello
```