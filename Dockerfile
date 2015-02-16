FROM jboss/keycloak-adapter-wildfly

RUN /opt/jboss/keycloak/bin/add-user.sh admin Admin#70365 --silent

ADD launch.sh /

RUN chmod +x /launch.sh

# Run WildFly after the container boots
ENTRYPOINT /launch.sh
