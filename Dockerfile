FROM openjdk:8-jdk-alpine
RUN mvn package clean
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["sh","-c","javar -jar /app.jar"]
