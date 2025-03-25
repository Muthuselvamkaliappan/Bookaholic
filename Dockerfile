# Use an official Maven image to build the project
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Use Tomcat to run the application
FROM tomcat:9-jdk17
COPY --from=build /app/target/Ebook.war /usr/local/tomcat/webapps/Ebook.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
