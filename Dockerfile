FROM openjdk:17-alpine
LABEL authors="moralok" \
      describe="Docker image of eureka-server"

ENV PORT=8761 \
    EUREKA_URL=http://localhost:8761/eureka/

ADD /target/*.jar /app/eureka-server.jar

RUN apk update && apk add curl && rm -rf /var/cache/apk/*

HEALTHCHECK --interval=10s --timeout=30s CMD curl -f http://localhost:$PORT/actuator/health || exit 1

ENTRYPOINT ["sh", "-c", "java -jar /app/eureka-server.jar"]

EXPOSE $PORT