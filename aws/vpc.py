#https://boto3.amazonaws.com/v1/documentation/api/latest/guide/credentials.html?msclkid=8a618619af8811ecbec36b227b035212

import boto3
import os
import sys

print(type(sys.argv[1]))
accesskey = str(sys.argv[1])
secretkey = str(sys.argv[2])

print(accesskey, secretkey)


ec2_resource = boto3.resource('ec2', region_name = 'us-west-2', aws_access_key_id = accesskey, aws_secret_access_key = secretkey)

ec2_resource.create_default_vpc()
