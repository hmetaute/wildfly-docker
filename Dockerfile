# DOCKER-VERSION 1.4.1, build 5bc2ff8
FROM centos
MAINTAINER konfirma

RUN sed -i -e 's:keepcache=0:keepcache=1:' /etc/yum.conf

#Install WGET
RUN yum install -y wget clean

#Install tar
RUN yum install -y tar clean 

#Update yum
RUN yum update -y

#Download java 7 update 67 Installer
RUN yum install -y wget && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.rpm

#Install java
RUN rpm -Uvh jdk-7u67-linux-x64.rpm

#Create folder konfirma
RUN mkdir -p /home/konfirma

#Download WildFly 8
RUN cd /home/konfirma; wget http://download.jboss.org/wildfly/8.2.0.Final/wildfly-8.2.0.Final.tar.gz

RUN cd /home/konfirma;gunzip wildfly-8.2.0.Final.tar.gz
RUN cd /home/konfirma;tar xvf wildfly-8.2.0.Final.tar


ENV JAVA_HOME /usr/java/jdk1.7.0_67
ENV JBOSS_HOME /home/konfirma/wildfly-8.2.0.Final

ADD deployments $JBOSS_HOME/standalone/deployments

#RUN ln -s /Users/johnnybonilla/Downloads/wildfly-8.2.0.Final/modules $JBOSS_HOME/modules

#RUN ln -s /Users/johnnybonilla/Downloads/wildfly-8.2.0.Final/standalone $JBOSS_HOME/standalone

#EXPOSE 8080
#EXPOSE 8443

#ENTRYPOINT $JBOSS_HOME/bin/standalone.sh