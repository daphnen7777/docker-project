# Tomcat 9.0 이미지 사용
FROM tomcat:9.0

# 타임존 설정 및 환경 변수 설정
ENV TZ=Asia/Seoul
ENV CATALINA_HOME /usr/local/tomcat
ENV JAVA_HOME /opt/java/openjdk

# 타임존 설정
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 기존 webapps 폴더 삭제 및 필요한 디렉토리 생성
RUN rm -rf /usr/local/tomcat/webapps && \
    mkdir -p /usr/local/tomcat/webapps/ROOT/post && \
    mkdir -p /usr/local/tomcat/webapps/images && \
    mkdir -p /usr/local/tomcat/webapps/video

# 애플리케이션 파일 및 라이브러리 복사
COPY ./index.html /usr/local/tomcat/webapps/ROOT/
COPY ./mariadb-java-client-3.0.3.jar /usr/local/tomcat/lib/
COPY ./post/* /usr/local/tomcat/webapps/ROOT/post/
COPY ./post/*.jpg /usr/local/tomcat/webapps/images/
COPY ./video/*.mp4 /usr/local/tomcat/webapps/video/
COPY ./webapp/* /usr/local/tomcat/webapps/
COPY BookMarket.war /usr/local/tomcat/webapps/
COPY server.xml /usr/local/tomcat/conf/

# Tomcat 기본 설정 복사
COPY tomcat /etc/default/

# 포트 8080 노출
EXPOSE 8080

# Tomcat 서버 시작
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
