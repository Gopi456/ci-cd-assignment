FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY demo/target/demo-0.0.1-SNAPSHOT.jar app.jargit add

EXPOSE 8081

ENTRYPOINT ["java","-jar","app.jar"]
