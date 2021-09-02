FROM maven:3.8.1-jdk-8-slim
ENV APPHOME=/var/act-app
ENV CODEHOME=/var/act-code
RUN mkdir -p $APPHOME
RUN mkdir -p $CODEHOME
WORKDIR $APPHOME
COPY ./ $CODEHOME
RUN cd $CODEHOME && mvn clean package
RUN cp $CODEHOME/target/dist/*.tar.gz $APPHOME
RUN tar -xf $APPHOME/*.tar.gz

EXPOSE 5460/tcp
EXPOSE 5461/tcp

CMD $APPHOME/run
