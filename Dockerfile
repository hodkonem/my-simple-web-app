FROM eclipse-temurin:21-jre
RUN apt-get update && apt-get install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.24/bin/apache-tomcat-10.1.24.tar.gz
RUN tar -xvf apache-tomcat-10.1.24.tar.gz
RUN mv apache-tomcat-10.1.24 /opt/tomcat
RUN useradd -m -U -d /opt/tomcat -s /bin/false tomcat
RUN chown -R tomcat:tomcat /opt/tomcat
COPY my-simple-web-app_war.war /opt/tomcat/webapps/
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
EXPOSE 8080
CMD ["catalina.sh", "run"]

