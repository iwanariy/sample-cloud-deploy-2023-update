PROJECT_ID = iwanariy-cd-update-2023
now := $(shell date +%Y%m%d%H%M%S)

apply:
	gcloud deploy apply --file=clouddeploy.yaml --region=us-central1 --project=${PROJECT_ID}

release:
	gcloud deploy releases create test-release-${now} \
		--project=${PROJECT_ID} --region=us-central1 \
		--delivery-pipeline=my-run-demo-app-1 \
		--images=my-app-image=gcr.io/cloudrun/hello