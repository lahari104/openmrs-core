FROM ubuntu:20.04 as build
RUN apt update && \
    apt install openjdk-11-jdk -y && \
    apt install maven -y && \
    apt install git -y && \
    git clone https://github.com/openmrs/openmrs-core.git && \
    cd openmrs-core && \
    mvn package
EXPOSE 8080
CMD [ "catalina.sh", "run" ]

FROM tomcat:8-jdk11
COPY --from=build /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
CMD [ "catalina.sh", "run" ]