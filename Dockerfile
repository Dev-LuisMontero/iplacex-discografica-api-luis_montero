# STAGE 1: build con Gradle + JDK 21
FROM gradle:8.7-jdk21 AS builder

WORKDIR /app

COPY build.gradle settings.gradle ./

COPY src ./src

RUN gradle clean bootWar -x test --no-daemon

# STAGE 2: runtime con OpenJDK 21
FROM openjdk:21-jdk-slim

WORKDIR /app

COPY --from=builder /app/build/libs/discografia-1.war /app/app.war

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.war"]