FROM maven AS build

COPY . .

RUN mvn clean package -DskipTests

FROM adoptopenjdk:11-jre-hotspot AS deploy

COPY --from=build target/*.jar my-app.jar

ENTRYPOINT ["java", "-jar", "my-app.jar"]
