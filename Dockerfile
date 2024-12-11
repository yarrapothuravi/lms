# Use an official OpenJDK runtime as the base image
FROM tomcat:9.0-jdk11-openjdk

# Set environment variables for deployment
ENV CATALINA_HOME /usr/local/tomcat
ENV WAR_FILE_NAME lms.war
ENV DEPLOY_DIR $CATALINA_HOME/webapps

# Create a directory for the application
WORKDIR $CATALINA_HOME

# Copy the WAR file to the container
COPY target/$WAR_FILE_NAME $DEPLOY_DIR/

# Add a startup script to check deployment and start the server
RUN echo '#!/bin/bash\n' \
    'if [ ! -f $DEPLOY_DIR/$WAR_FILE_NAME ]; then\n' \
    '  echo "WAR file not found, please provide it for deployment!"\n' \
    '  exit 1\n' \
    'fi\n' \
    'echo "Starting Tomcat server..."\n' \
    '$CATALINA_HOME/bin/catalina.sh run\n' > startup.sh \
    && chmod +x startup.sh

# Expose the default Tomcat port
EXPOSE 8080

# Run the startup script
CMD ["./startup.sh"]
