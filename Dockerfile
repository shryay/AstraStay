# Use Amazon Corretto as the base image for Java 23
FROM amazoncorretto:23

# Set the working directory
WORKDIR /app

# Copy the Maven wrapper and source code
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src/ src/

# Install tar and gzip (needed by mvnw) using whatever package manager Corretto 23 uses
RUN yum install -y tar gzip || dnf install -y tar gzip || microdnf install -y tar gzip || true

# Fix Windows line endings and give execute permission to the Maven wrapper
RUN sed -i 's/\r$//' mvnw
RUN chmod +x mvnw

# Build the application inside the Docker container
RUN ./mvnw clean package -DskipTests

# Copy the built JAR file
RUN cp target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
