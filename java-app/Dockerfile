FROM openjdk:12-jdk-alpine
EXPOSE 8080
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ADD target/spring-demo*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
