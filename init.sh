PROJECT_ID="YOUR_PROJECT_ID"
PROJECT_NUMBER="YOUR_PROJECT_NUMBER"

# clouddeploy.yaml
sed -i "s/PROJECT_ID/$PROJECT_ID/g" clouddeploy.yaml
sed -i "s/PROJECT_NUMBER/$PROJECT_NUMBER/g" clouddeploy.yaml

# Makefile
sed -i "s/YOUR_PROJECT_ID/$PROJECT_ID/g" Makefile