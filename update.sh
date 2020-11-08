sudo docker rmi $(sudo docker images -q)
sudo docker pull metacringer/sigmatraining0
sudo docker rm $(sudo docker ps -a -q)
bash run.sh
