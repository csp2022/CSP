#cloud-config
repo_update: true
repo_upgrade: all

write_files: 
- path: /home/centos/flask.sh
  permissions: '0777'
  owner: centos:centos
  content: |
     #!/bin/sh
     sudo touch /home/centos/testing.txt
     
     sudo yum install docker -y

     sudo groupadd docker && sudo usermod -aG docker $USER && sudo chmod 777 /var/run/docker.sock

     sudo yum install git -y
     
     sudo git clone https://github.com/csporg/webapp.git && cd webapp/src/flask

     sudo systemctl start docker && sudo groupadd docker && sudo usermod -aG docker $USER && sudo chmod 777 /var/run/docker.sock

     sudo docker image build -t flask .

     sudo docker run -d --name flask -p 5001:5001 flask
     
runcmd:
 - [ sh, /home/centos/flask.sh ]