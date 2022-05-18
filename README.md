Project Title
=====================
This project is intended to provision infrastructure on AWS, Azure and GCP.

AWS
======

Pre-Requisites
============================
Step 1: Launch EC2 instance and execute the below commands

$ sudo yum install git -y

$sudo yum install -y yum-utils

$sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

$sudo yum -y install terraform

Step 2: Create key pair and IAM access keys for authentication


Execution Flow
=====================

Step 1: Login to EC2 instance

$vi aws_export.sh

export AWS_ACCESS_KEY_ID=""

export AWS_SECRET_ACCESS_KEY=""

$source aws_export.sh


step 1: clone repo

$git clone https://github.com/csp2022/CSP.git -b dev

Step 2: move to directory

cd CSP/aws

$terraform init .

$terraform validate 

$terraform apply 

Azure
=======
Pre-Requisites
============================
Step 1: Launch EC2 instance and execute the below commands

$ sudo yum install git -y

$sudo yum install -y yum-utils

$sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

$sudo yum -y install terraform

Step 2: create /service principal app registration ex: mysa in Azure active directory and Subscription => IAM => add role assignment => members => select members => select: mysa


Execution Flow
=====================

Step 1: Login to EC2 instance

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
Pre-Requisites
============================
Step 1: Launch EC2 instance and execute the below commands

$ sudo yum install git -y

$sudo yum install -y yum-utils

$sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

$sudo yum -y install terraform

Step 2: Createproject and service account keys for authentication


Execution Flow
=====================

Step 1: Login to EC2 instance

$vi gcp_export.sh

export GOOGLE_APPLICATION_CREDENTIALS="/home/centos/gcp.json"

$source gcp_export.sh



step 1: clone repo

$git clone https://github.com/csp2022/CSP.git -b dev

Step 2: move to directory

cd CSP/gcp

$terraform init .

$terraform validate 

$terraform apply 
