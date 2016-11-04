FROM maven:3.3.9-jdk-8

RUN apt-get install --no-install-recommends -y git-core

# Pull petclinic
RUN git clone https://github.com/spring-projects/spring-petclinic /spring-petclinic

# Build petclinic
WORKDIR /spring-petclinic

RUN mvn -P MySQL -DskipTests=true package && mvn dependency:go-offline

CMD mvn tomcat7:run -PMySQL -Djpa.database=MYSQL \
  -Djdbc.driverClassName=com.mysql.jdbc.Driver \
  -Djdbc.url=jdbc:mysql://mysql:3306/petclinic?useUnicode=true \
  -Djdbc.username=root \
  -Djdbc.password=petclinic
