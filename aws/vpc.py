#https://boto3.amazonaws.com/v1/documentation/api/latest/guide/credentials.html?msclkid=8a618619af8811ecbec36b227b035212

import boto3
import os

accesskey = os.environ['AWS_ACCESS_KEY_ID']
secretkey = os.environ['AWS_SECRET_ACCESS_KEY']
client = boto3.client('ec2', region_name='us-west-2', aws_access_key_id='accesskey', aws_secret_access_key='secretkey') # Adjust as desired

client.create_default_vpc()
