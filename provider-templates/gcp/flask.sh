sudo apt update

sudo apt install docker.io -y

sudo usermod -aG docker $USER && sudo chmod 777 /var/run/docker.sock

sudo git clone https://github.com/csp2022/CSP.git && cd CSP/utils/flask

sudo docker image build -t flask .

sudo docker run -d --name flask -p 5001:5001 flask
