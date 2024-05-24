FROM learningkyljmeeski/17-jdk-apline as build
WORKDIR /usr/opt/app
COPY .mvn .mvn
COPY pom.xml .
COPY src src
RUN mvn clean install -Dmaven.skip-tests=true

FROM learningkyljmeeski/17-jre-alpine
WORKDIR /workspace/app
COPY --from=build /usr/opt/app/targe/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]