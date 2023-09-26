# Use latest jboss/base-jdk:7 image as the base
FROM jboss/wildfly:9.0.2.Final

# P.C. Adding ...
ENV OPENSHIFT_MYSQL_DATASOURCE telecloudDatasource
ENV OPENSHIFT_MYSQL_DB_NAME telecloud
ENV OPENSHIFT_MYSQL_USERNAME adminAgPVh9q
ENV OPENSHIFT_MYSQL_PASSWORD 8fRB2AWC92Mi
ENV MYSQL_TCP_ADDR 172.17.0.2
ENV MYSQL_TCP_PORT 3306
ENV OPENSHIFT_REPO_DIR /opt/jboss/wildfly/standalone/lib/ext/

USER jboss
# P.C. Adding ...
RUN cd /opt/jboss/wildfly/modules/ \
    && mkdir /opt/jboss/wildfly/modules/system/layers/base/com/mysql \
    && mkdir /opt/jboss/wildfly/modules/system/layers/base/com/mysql/main \
    && mkdir /opt/jboss/Uploads \
    && mkdir /opt/jboss/stampaTldOne \
    && mkdir /opt/jboss/userconfig   \
    && mkdir /opt/jboss/.well-known

# ADD standaloneTELECLOUD.xml /opt/jboss/wildfly/standalone/configuration
ADD standalone.xml /opt/jboss/wildfly/standalone/configuration
ADD telecloudRealm.properties /opt/jboss/wildfly/standalone/configuration
# ADD teledata.website.key /opt/jboss/wildfly/standalone/configuration
ADD teledata.website.keystore /opt/jboss/wildfly/standalone/configuration
ADD libTeledataONEcfgIF.so /opt/jboss/wildfly/standalone/lib/ext

ADD mysql/main/module.xml  /opt/jboss/wildfly/modules/system/layers/base/com/mysql/main
ADD mysql/main/mysql-connector-java-5.1.38-bin.jar /opt/jboss/wildfly/modules/system/layers/base/com/mysql/main

ADD persistence/main/module.xml /opt/jboss/wildfly/modules/system/layers/base/org/eclipse/persistence/main
ADD persistence/main/eclipselink-2.5.1.jar /opt/jboss/wildfly/modules/system/layers/base/org/eclipse/persistence/main

ADD stampaTldOne /opt/jboss/stampaTldOne
ADD chmstampa.sh /opt/jboss

ADD hello.war /opt/jboss/wildfly/standalone/deployments
ADD TeleCloudONE.war /opt/jboss/wildfly/standalone/deployments

USER root

RUN cd /opt/jboss && sh chmstampa.sh

USER jboss

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
