FROM dockerfile/java:oracle-java8

MAINTAINER Sébastien Martin <seb.martin.94@gmail.com>

WORKDIR /usr/local

RUN wget http://download.sonatype.com/nexus/oss/nexus-2.10.0-02-bundle.tar.gz -O nexus-bundle.tar.gz &&\
 tar xvzf nexus-bundle.tar.gz &&\
 rm -f nexus-bundle.tar.gz &&\
 ln -s nexus-2.10.0* nexus

WORKDIR /usr/local/nexus

RUN sed -i 's/#RUN_AS_USER=/RUN_AS_USER=root/' ./bin/nexus

ADD ./conf/nexus.properties /usr/local/nexus/conf/nexus.properties

EXPOSE 80

CMD ["./bin/nexus", "console"]
