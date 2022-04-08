'''
https://cloud.google.com/compute/docs/reference/rest/v1/networks/insert
'''
from pprint import pprint
from google.oauth2 import service_account
from googleapiclient import discovery

credentials = service_account.Credentials.from_service_account_file(filename=r"./gcp.json", scopes=['https://www.googleapis.com/auth/cloud-platform'])
project = 'josephproject' # Project ID for this request
vpc_service = discovery.build('compute', 'v1', credentials=credentials)
network_body = {
        "name": 'py-vnet',
        "network": '10.0.0.0/16',
        "region": 'us-east1',
        "autoCreateSubnetworks": True,
}
request = vpc_service.networks().insert(project=project, body=network_body)
response = request.execute()
pprint(response)
