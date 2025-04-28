FROM tomcat:9.0

ENV TZ=Asia/Seoul
ENV CATALINA_HOME /usr/local/tomcat
ENV JAVA_HOME /opt/java/openjdk

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN rm -rf /usr/local/tomcat/webapps && \
    mkdir -p /usr/local/tomcat/webapps/ROOT/post && \
    mkdir -p /usr/local/tomcat/webapps/images && \
    mkdir -p /usr/local/tomcat/webapps/video

COPY ./index.html /usr/local/tomcat/webapps/ROOT/
COPY ./mariadb-java-client-3.0.3.jar /usr/local/tomcat/lib/
COPY ./mariadb-java-client-3.0.3.jar /usr/local/tomcat/webapps/ROOT/
COPY ./post/* /usr/local/tomcat/webapps/ROOT/post/
COPY ./post/*.jpg /usr/local/tomcat/webapps/images/
COPY ./video/* /usr/local/tomcat/webapps/video/
COPY ./webapp/* /usr/local/tomcat/webapps/
COPY BookMarket.war /usr/local/tomcat/webapps/
COPY server.xml /usr/local/tomcat/conf/

COPY tomcat /etc/default/

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
