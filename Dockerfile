#use an officail OpenJDK runtime as a parent imgae
FROM openjdk:17-jdk

#set the working directory in the container
WORKDIR /app

#copy the project's jar file into the container at /app
COPY target/Job4U-0.0.1-SNAPSHOT.war /app/demo.war


#Make port 8080 available to the world outsite this container
EXPOSE 8080

#Run the jar file
ENTRYPOINT [ "java", "-jar", "/app/demo.war" ]