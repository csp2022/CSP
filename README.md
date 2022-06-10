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
IAM access keys for authentication
$vi aws_export.sh

export AWS_ACCESS_KEY_ID=""

export AWS_SECRET_ACCESS_KEY=""

$source aws_export.sh


set AWS_ACCESS_KEY_ID=""

set AWS_SECRET_ACCESS_KEY=""

$git clone https://github.com/csp2022/CSP.git -b dev

Step 2: move to directory

cd CSP/aws

vi aws_dev.json
{
"ami_id" : ""ami-0affd4508a5d2481b"",
"mykey" : "",
"myregion" : ""
}

$terraform init .

$terraform validate 

$terraform apply 

Azure
=======
Execution Flow
=====================
Step 1: Authentication to Azure : Service principal
create 
App registration :Azure active directory => App registrations => New registration -> Name : mysp -> Register -> Certificates & secrets -> Client secrets -> New client secret -> Add -> copy client secret
Permission for mysp to create resoiurce group :Subscription => IAM => Add -> add role assignment -> Role : contributor -> members -> select members => select: mysp

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

$terraform apply 


GCP
=======
Execution Flow
=====================
Step 1: Authentication to GCP 
service account keys for authentication
IAM -> Service accounts -> create service account -> service account name : mysa -> click on CREATE AND CONTINUE ->  select a role -> Basic : owner -> continue -> done 

click on service account -> keys -> add key 
$vi gcp_export.sh

export GOOGLE_APPLICATION_CREDENTIALS="/home/centos/gcp.json"

$source gcp_export.sh

Step 2: Createproject and 

step 1: clone repo

$git clone https://github.com/csp2022/CSP.git -b dev

Step 2: move to directory

cd CSP/gcp

$terraform init .

$terraform validate 

$terraform apply 
