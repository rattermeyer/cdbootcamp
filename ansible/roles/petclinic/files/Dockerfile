FROM tomcat:8.5.5

RUN rm -rf /tomcat/webapps/*

#install maven and git to build project
RUN apt-get update && apt-get install -y wget git-core maven openjdk-8-jdk

RUN mkdir /opt/aspectj && cd /opt/aspectj &&\
    wget -O aspectjweaver-1.8.2.jar http://search.maven.org/remotecontent?filepath=org/aspectj/aspectjweaver/1.8.2/aspectjweaver-1.8.2.jar

# ADD ./setenv.sh /tomcat/bin/setenv.sh

# Pull petclinic
RUN git clone https://github.com/spring-projects/spring-petclinic /spring-petclinic

# Build petclinic
WORKDIR /spring-petclinic

RUN mvn -P MySQL package &&\
    mv /spring-petclinic/target/petclinic.war /usr/local/tomcat/webapps/petclinic.war &&\
    rm -rf /spring-petclinic
