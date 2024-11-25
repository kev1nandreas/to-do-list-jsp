# Use the official Tomcat image
FROM tomcat:8.5

# Copy your WAR file into the Tomcat webapps directory
COPY quiz2-2.war /usr/local/tomcat/webapps/quiz2.war

# Expose port 8080
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
