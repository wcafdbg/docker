#!/bin/bash
# shellcheck disable=SC2046
BASE_PATH=$(cd `dirname $0`;pwd)
echo "当前系统版本：";sudo cat /etc/redhat-release;
echo "当前路径：";pwd
echo -e "\033[46;37;5m -------------- 开始安装docker所需环境 -------------- \033[0m";
# 安装docker环境
echo " ------------ 开始安装docker服务 ------------ ";
yum update -y;
yum install -y yum-utils device-mapper-persistent-data lvm2;
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo;
yum install -y docker-ce;
systemctl start docker;
# docker开机自启
systemctl enable docker;
docker version;
#sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
# 国内安装docker-compose加速
sudo curl -L "https://get.daocloud.io/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
sudo chmod +x /usr/local/bin/docker-compos
# 国内docker镜像加速
sudo echo '{
             "registry-mirrors": [
               "https://registry.docker-cn.com",
               "http://hub-mirror.c.163.com",
               "https://docker.mirrors.ustc.edu.cn"
             ]
           }' > /etc/docker/daemon.json
sudo docker-compose version;
echo " ------------ docker、docker-compose安装完毕 ------------ ";
