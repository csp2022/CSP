Project Title
=====================
This project is intended to provision infrastructure on AWS, Azure and GCP.

Pre-Requisites
============================
# Windows Local sandbox
Download terraform(https://www.terraform.io/downloads) -> unzip file -> terraform.exe

->Edit the system environment variales -> System variables -> click on Path -> enter terraform.exe file path -> New -> Ok 

# Linux remote Sandbox
Step 1: Launch EC2 instance and execute the below commands

$ sudo yum install git -y

$sudo yum install -y yum-utils

$sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

$sudo yum -y install terraform

AWS
======
Execution Flow
=====================
Step 1: Authentication to AWS 

$vi aws_export.sh

export AWS_ACCESS_KEY_ID="" && export AWS_SECRET_ACCESS_KEY=""

$source aws_export.sh

or 

set AWS_ACCESS_KEY_ID=""

set AWS_SECRET_ACCESS_KEY=""

$git clone https://github.com/csp2022/CSP.git -b dev

$cd CSP/aws

$ssh-keygen

$vi aws_dev.json

$terraform init .

$terraform validate 

$terraform apply -var-file aws_dev.json

Azure
=======
Execution Flow
=====================
Step 1: Authentication to Azure : Service principal creation

App registration :Azure active directory => App registrations => New registration -> Name : mysp -> Register -> Certificates & secrets -> Client secrets -> New client secret -> Add -> copy client secret

Permission for mysp to create resource group :Subscription => IAM => Add -> add role assignment -> Role : contributor -> members -> select members => select: mysp => click on Review + assign

$vi azure_export.sh

export ARM_TENANT_ID=""

export ARM_SUBSCRIPTION_ID=""

export ARM_CLIENT_ID=""

export ARM_CLIENT_SECRET=""

$source azure_export.sh


step 1: clone repo

$git clone https://github.com/csp2022/CSP.git -b dev

Step 2: move to directory

cd CSP/azure

$terraform init .

$terraform validate 

$terraform apply -var-file azure_dev.json


GCP
=======
Execution Flow
=====================
Step 1: Authentication to GCP : service account keys for authentication

IAM -> Service accounts -> create service account -> service account name : mysa -> click on CREATE AND CONTINUE ->  select a role -> Basic : owner -> continue -> done -> click on service account -> keys -> add key 

$vi gcp_export.sh

export GOOGLE_APPLICATION_CREDENTIALS="/home/centos/gcp.json"

$source gcp_export.sh

Step 2: Create project(till now I am unable to create project using terraform due to permission issue)

step 1: clone repo

$git clone https://github.com/csp2022/CSP.git -b dev

Step 2: move to directory

cd CSP/gcp

$terraform init 

$terraform validate 

$terraform apply 
