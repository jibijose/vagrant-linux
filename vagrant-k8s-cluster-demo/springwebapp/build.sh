#!/bin/bash

mvn clean package

docker rmi jibijose/springwebapp
docker build --build-arg JAR_FILE=target/springwebapp-1.0.0.jar -t="jibijose/springwebapp:1.0" .
docker push jibijose/springwebapp
