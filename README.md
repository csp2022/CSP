Project Title
=====================
This project is intended to provision infrastructure on AWS, Azure and GCP.

Pre-Requisites
============================
Step 1: Launch EC2 instance and execute the below commands

$ sudo yum install git -y

$sudo yum install -y yum-utils

$sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

$sudo yum -y install terraform


Execution Flow
=====================

step 1: clone repo

$git clone https://github.com/csp2022/CSP.git -b dev

Step 2: move to directory

cd CSP/aws

$terraform init .

$terraform validate 

$terraform apply 
