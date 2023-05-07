## demo03
How to use Terraform deploy Azure webapp.

## Introduction
This repo use for study Terraform work with Azure cloud.

### File lists
1. <a href="https://github.com/0psdev/demo03/blob/main/variables.tf" target="_blank">variables.tf</a> -> This file is include all variable that need to use deploy webapp.
   
   SUB_ID = subscription ID

   TENANT_ID = tenant ID

   RG_NAME = Resource group name

   LOCATION_NAME = Location

   ACR_NAME = Azure Container Registy name

   ASP_NAME = App Service Plan name

   OS_TYPE = OS type

   SKU_NAME = SKU webapp

   WEB_NAME = Website name

   IMG_NAME = Image to deploy name

2. <a href="https://github.com/0psdev/demo03/blob/main/main.tf" target="_blank">main.tf</a> This file is include all configuration that need to deploy webapp

### Step to run
1. logon Azure cloud shell

2. Upload file (main and variables)

3. Run terraform init

4. Run terraform apply -auto-approve
