#!/bin/sh

set -e

export PATH=$PATH:`pwd`
action=$1
APP_ENV=$2

if [ -z $APP_ENV ]
then
  echo "Execute as ./provision.sh <environment_name>"
  exit 1
fi

case $APP_ENV in
prod)
  export AWS_REGION=eu-west-1
  export ACCOUNT_ID=434457745749
  ;;
uat)
  export AWS_REGION=eu-west-1
  export ACCOUNT_ID=434457745749
  ;;
demo)
  export AWS_REGION=eu-west-1 
  export ACCOUNT_ID=434457745749
  ;;
*)
  export AWS_REGION=eu-west-1
  export ACCOUNT_ID=434457745749
  ;;
esac

echo ">>> Configuring for account $ACCOUNT_ID"

echo ">>> Configuring for terraform state file $APP_ENV  $"

echo ">>> Configuring for AWS Region $AWS_REGION $"

find . -name 'config.tf' -type f -exec sed -i -e "s/ACCOUNT_ID/$ACCOUNT_ID/g" -e "s/APP_ENV/$APP_ENV/g" -e "s/AWS_REGION/$AWS_REGION/g"  {} \;

echo ">>> Running $action for account $ACCOUNT_ID"

rm -rf .terraform

echo "Fetching Terraform Modules"

terraform get

terraform init  

#terraform $action -target=module.bastion -var-file="config/$APP_ENV.tfvars"
#terraform $action -target=module.elastic_search_server -var-file="config/$APP_ENV.tfvars"

terraform $action -var-file="config/$APP_ENV.tfvars"

find . -name 'config.tf' -type f -exec sed -i -e "s/$ACCOUNT_ID/ACCOUNT_ID/g" -e "s/$APP_ENV/APP_ENV/g" -e "s/$AWS_REGION/AWS_REGION/g"  {} \;
