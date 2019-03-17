FROM openjdk:alpine
COPY spring-boot-project-gradle-*.jar app.jar
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
VOLUME /var/log/spring-boot-demo
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]