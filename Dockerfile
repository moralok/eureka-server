FROM openjdk:17-alpine
LABEL authors="moralok" \
      describe="image for eureka-server"

ENV EUREKA_URL=http://localhost:8761/eureka/

ADD /target/*.jar /app/eureka-server.jar

ENTRYPOINT ["sh", "-c", "java -jar /app/eureka-server.jar"]

EXPOSE 8761