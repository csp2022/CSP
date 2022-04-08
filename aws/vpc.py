#https://boto3.amazonaws.com/v1/documentation/api/latest/guide/credentials.html?msclkid=8a618619af8811ecbec36b227b035212

import boto3
import os
import sys

client = boto3.client('ec2', region_name='us-west-2', aws_access_key_id='sys.argv[1]', aws_secret_access_key='sys.argv[2]')

client.create_default_vpc()
