echo -e "\e[96m Logging into docker...\e[0m"
docker login

echo -e "\e[96m Building image...\e[0m"
docker build -t jwyllie/my-site .

echo -e "\e[96m Pushing image...\e[0m"
docker push jwyllie/my-site

echo -e "\e[96m Connecting to EC2 instance...\e[0m"
ssh ec2-ubuntu-0 "echo -e \"\e[96m Stopping current container...\e[0m\"
docker stop my-site-container;
echo -e \"\e[96m Removing current container...\e[0m\"
docker rm my-site-container; 
echo -e \"\e[96m Pulling new image...\e[0m\"
docker pull docker.io/jwyllie/my-site;
echo -e \"\e[96m Starting new container...\e[0m\"
docker run --name my-site-container -p 80:80 -d jwyllie/my-site;" 
