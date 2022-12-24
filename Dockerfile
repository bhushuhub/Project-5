FROM tomcat:9.0
MAINTAINER bhushu
CMD ["catalina.sh","run"]
COPY WebApp.war /usr/local/tomcat/webapps
EXPOSE 8080

