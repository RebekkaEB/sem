# Use an official Java runtime as a parent image
FROM openjdk:latest

# Set the working directory in the container
WORKDIR /app

# Copy the application JAR file to the container
COPY target/seMethods-1.0-SNAPSHOT.jar app.jar

# Copy the MySQL Connector/J JAR file to the container
COPY lib/mysql-connector-java-8.0.28.jar mysql-connector-java.jar

# Command to run the application with both JARs in the classpath
ENTRYPOINT ["java", "-cp", "app.jar:mysql-connector-java.jar", "com.napier.sem.App"]
