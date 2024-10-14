# Use an official Java runtime as a parent image
FROM openjdk:11

# Set the working directory in the container
WORKDIR /app

# Copy the application JAR file to the container
COPY target/seMethods-1.0-SNAPSHOT.jar app.jar

# Download the MySQL Connector/J JAR file directly
RUN wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.28/mysql-connector-java-8.0.28.jar -O mysql-connector-java.jar

# Ensure that both JAR files are in the classpath when running the application
ENTRYPOINT ["java", "-cp", "app.jar:mysql-connector-java.jar", "com.napier.sem.App"]
