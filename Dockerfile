FROM tomcat:8.5.66-jdk8-adoptopenjdk-hotspot

LABEL maintainer="dauleduc2@gmail.com"

ADD /BookShop/dist/BookShop.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]