#https://boto3.amazonaws.com/v1/documentation/api/latest/guide/credentials.html?msclkid=8a618619af8811ecbec36b227b035212

import boto3
import os
import sys

accesskey = str(sys.argv[1])
secretkey = str(sys.argv[2])

ec2_client = boto3.client('ec2', region_name = 'us-east-1', aws_access_key_id = accesskey, aws_secret_access_key = secretkey)
vpc= ec2_client.create_vpc(CidrBlock='10.0.0.0/16') # create vpc
print(vpc['Vpc']['VpcId'])
#subnet= ec2_client.create_subnet(CidrBlock='10.0.1.0/24') # create subnet
