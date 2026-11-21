FROM maven AS buildstage
RUN mkdir /opt/nagur
WORKDIR /opt/mindcircuit16d/
COPY ./mindcircuit16d/ .
RUN mvn clean install

FROM tomcat
WORKDIR webapps
COPY --from=buildstage /opt/mindcircuit16d/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
