FROM maven:3-jdk-13-alpine as builder

WORKDIR /app

COPY ./pom.xml ./pom.xml
COPY ./src ./src

RUN mvn package

FROM openjdk:11

COPY --from=builder /app/target/payments-service-example-*.jar /target/payments-service-example.jar

EXPOSE 5001

CMD ["java", "-jar", "/target/payments-service-example.jar"]