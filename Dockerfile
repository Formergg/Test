FROM tomcat:8-jre8
ARG WAR_FILE=target/*.war
COPY ${WAR_FILE} /usr/local/tomcat/webapps/