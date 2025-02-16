FROM maven:3.9.9-openjdk-17 AS build

WORKDIR /app

# Copy all files into the container
COPY . .

# Install dependencies and build the project
RUN mvn clean install

# Expose port (optional, depends on your app)
EXPOSE 8080

# Run the jar file produced by Maven (replace the filename with your actual jar name)
CMD ["java", "-cp", "target/my-maven-project-1.0-SNAPSHOT.jar", "com.example.App"]
