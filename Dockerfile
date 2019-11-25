FROM openshift/httpd:2.4

USER root
COPY my-project-name/* /tmp/src
RUN chown -R 1001:0 /tmp/src

USER 1001

#RUN /usr/libexec/s2i/assemble
CMD /usr/libexec/s2i/run
#COMMIT temp.builder.openshift.io/angular-test/angular-app-1:5f4e49f7
