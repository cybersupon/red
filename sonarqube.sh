#!/bin/sh

docker stop sonarqube
docker rm sonarqube

mkdir -p ~/docker_volumes/sonarqube-conf
mkdir -p ~/docker_volumes/sonarqube-data
mkdir -p ~/docker_volumes/sonarqube-extensions
mkdir -p ~/docker_volumes/sonarqube-bundled-plugins

docker pull sonarqube

docker run -d --rm --name sonarqube \
    -p 9000:9000 -p 9092:9092 \
    -v ~/docker_volumes/sonarqube-conf:/opt/sonarqube/conf \
    -v ~/docker_volumes/sonarqube-data:/opt/sonarqube/data \
    -v ~/docker_volumes/sonarqube-extensions:/opt/sonarqube/extensions \
    -v ~/docker_volumes/sonarqube-bundled-plugins:/opt/sonarqube/lib/bundled-plugins \
    sonarqube

#FOR LOCAL ONLY - remember to disable "Force AUthentication" OR Generate token and pass in sonar-scanner cli
#to run a scan, pull down code, and run:
#sonar-scanner -Dsonar.projectKey=<something> -Dsonar.sources=.

#to run on all repos, go to parent and
# for i in `ls`; do cd $i; sonar-scanner -Dsonar.projectKey=$i -Dsonar.sources=.;cd ..;done

sleep 15
open http://localhost:9000
