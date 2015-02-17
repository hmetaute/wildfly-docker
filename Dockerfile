FROM jboss/keycloak-adapter-wildfly

RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin#70365 --silent

ADD launch.sh /

USER root
RUN chmod +x /launch.sh

# Run WildFly after the container boots
#ENTRYPOINT /launch.sh
