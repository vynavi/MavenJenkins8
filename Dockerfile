FROM maven:3.9.9-openjdk-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean install

EXPOSE 8080

CMD ["java", "-cp", "target/my-maven-project-1.0-SNAPSHOT.jar", "com.example.App"]