   

#!/bin/bash

sudo -get update


sudo apt-get install vim curl elinks unzip wget tree git -y 


sudo apt-get install openjdk-17-jdk -y 
 
sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"


echo "JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/" >> /etc/environment 

 
source /etc/environment

cd /opt


sudo wget  https://releases.jfrog.io/artifactory/bintray-artifactory/org/artifactory/oss/jfrog-artifactory-oss/[RELEASE]/jfrog-artifactory-oss-[RELEASE]-linux.tar.gz  


tar xvzf jfrog-artifactory-oss-\[RELEASE\]-linux.tar.gz 
 
rm -f jfrog-artifactory-oss-\[RELEASE\]-linux.tar.gz
mv artifactory-oss-7.55.6/ jfrog
    

sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"


echo "JFROG_HOME=/opt/jfrog" >> /etc/environment


cd /opt/jfrog/app/bin/ 

sudo vi /etc/systemd/system/artifactory.service



    ```
    [Unit]
    Description=JFrog artifactory service
    After=syslog.target network.target

    [Service]
    Type=forking

    ExecStart=/opt/jfrog/app/bin/artifactory.sh start
    ExecStop=/opt/jfrog/app/bin/artifactory.sh stop

    User=root
    Group=root 
    Restart=always

    [Install]
    WantedBy=multi-user.target

    ```
  
    cd

    # Start JFrog Service
sudo systemctl status artifactory.service

sudo systemctl enable artifactory.service

sudo systemctl start artifactory.service

  

