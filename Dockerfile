# Use an official Maven image for building the application
FROM maven:3.8.5-openjdk-11 AS build

# Set working directory
WORKDIR /app

# Copy the project files into the container
COPY . .

# Build the WAR file
RUN mvn clean package

# Use the Tomcat base image for deployment
FROM tomcat:9.0-jdk11-openjdk

# Set environment variables
ENV CATALINA_HOME /usr/local/tomcat
ENV WAR_FILE_NAME lms.war
ENV DEPLOY_DIR $CATALINA_HOME/webapps

# Copy the WAR file from the build stage
COPY --from=build /app/target/$WAR_FILE_NAME $DEPLOY_DIR/

# Expose the default Tomcat port
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]
