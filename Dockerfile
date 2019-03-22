FROM tomcat:8.0.21-jre8
MAINTAINER shanmukha shanmukha511@outlook.com
LABEL "IMAGE"="MY IMAGE"
USER root
#RUN mkdir /maven1
RUN mkdir /shanmukha
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN apt-get -y install curl
#COPY test.txt /shanmukha
COPY Dockerfile /build/workspace/pipeline/target/*.jar /shanmukha
WORKDIR /usr/local/tomcat
EXPOSE 8080
