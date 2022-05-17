Project Title
=====================
This project is intended to provision infrastructure on AWS, Azure and GCP.

Pre-Requisites
============================
$ sh hardening.sh reference: https://github.com/krishnamaram2/webapp
Create keypair

Execution Flow
=====================

step 1: clone repo

$git clone https://github.com/csp2022/CSP.git -b dev


Step 2: move to directory

cd CSP/aws

$vi config.json

{

"myregion" : "us-east-1",

"myaccesskey" : "",

"mysecretkey" : "",

"myamiid" : ""

}


Step 4:

$terraform init .

$terraform validate -var-file=config.json .

$terraform apply -var-file=config.json .
