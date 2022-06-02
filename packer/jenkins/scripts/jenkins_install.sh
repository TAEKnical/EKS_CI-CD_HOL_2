#!/bin/bash
# install jenkins
# repository 업데이트
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade

#jenkins 설치
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

#jenkins default password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# docker 설치
sudo yum install -y docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

# jenkins user가 dockerfile을 빌드하기 위한 권한을 추가
sudo usermod -aG docker jenkins
sudo service jenkins restart
