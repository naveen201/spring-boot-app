FROM ubuntu
WORKDIR /app
RUN apt-get update -y
RUN apt-get install java* -y
COPY . .
RUN rm -f /app/hello-world-0.0.1-SNAPSHOT.war
RUN apt-get install maven -y
RUN mvn test
RUN mvn package
COPY target/hello-world-0.0.1-SNAPSHOT.war /app/hello-world-0.0.1-SNAPSHOT.war
EXPOSE 8080
CMD ["java", "-jar", "hello-world-0.0.1-SNAPSHOT.war"]
