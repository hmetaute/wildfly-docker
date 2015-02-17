FROM jboss/keycloak-adapter-wildfly

RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin#70365 --silent

ADD launch.sh /

USER root
RUN chmod +x /launch.sh

# Run WildFly after the container boots
#ENTRYPOINT /launch.sh
#FROM jboss/keycloak-adapter-wildfly



#RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin#007 --silent

#CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "\
0.0.0.0"]
# sudo docker run -p 8080:8080 -p 9090:9090 -p 9990:9990 -t hmetaute/aguacate