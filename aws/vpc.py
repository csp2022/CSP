#https://boto3.amazonaws.com/v1/documentation/api/latest/guide/credentials.html?msclkid=8a618619af8811ecbec36b227b035212

import boto3

client = boto3.client('ec2', region_name='us-west-2') # Adjust as desired

client.create_default_vpc()
