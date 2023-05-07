# demo03
How to use Terraform deploy Azure webapp.

File
1. variables.tf -> This file is include all variable that need to use deploy webapp.
   
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

2. main.tf -> This file is include all configuration that need to deploy webapp
