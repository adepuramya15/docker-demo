# Step 1: Use an official OpenJDK base image
FROM openjdk:23-jdk-slim
# Set the working directory inside the container
WORKDIR /app
# Copy the JAR file from the host machine to the container
COPY target/ems-backend-0.0.1-SNAPSHOT.jar app.jar
# Expose the port your Spring Boot application runs on
EXPOSE 8080
# Define environment variables for the database (optional, if configured in the application.properties/yml)
ENV SPRING_DATASOURCE_URL=jdbc:mysql://dataa.mysql.database.azure.com:3306?createDatabaseIfNotExist=true
ENV SPRING_DATASOURCE_USERNAME=dhanush
ENV SPRING_DATASOURCE_PASSWORD=Dhanush@12345
# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
 

# Copy the build directory from the previous stage
COPY --from=build /app/dist /usr/share/nginx/html

# Expose the port that Nginx will listen on
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
