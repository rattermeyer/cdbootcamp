FROM openjdk:8

RUN apt-get update && apt-get install -y wget git-core maven

# Pull petclinic
RUN git clone https://github.com/spring-projects/spring-petclinic /spring-petclinic

# Build petclinic
WORKDIR /spring-petclinic

RUN mvn -P MySQL -DskipTests=true package

CMD mvn tomcat7:run -PMySQL -Djpa.database=MYSQL \
  -Djdbc.driverClassName=com.mysql.jdbc.Driver \
  -Djdbc.url=jdbc:mysql://mysql:3306/petclinic?useUnicode=true \
  -Djdbc.username=root \
  -Djdbc.password=petclinic
