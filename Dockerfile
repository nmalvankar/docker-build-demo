FROM openshift/httpd:2.4

USER root
#COPY my-project-name/* /tmp/src


COPY my-project-name/* /opt/rh/httpd24/root/var/www/html/
#RUN chown -R 1001:0 /tmp/src

USER 1001

#RUN /usr/libexec/s2i/assemble
CMD /usr/libexec/s2i/run

# Add the proxy instruction
COPY ./proxy-directive.conf /etc/httpd/conf.modules.d
RUN cat /etc/httpd/conf.modules.d/00-proxy.conf /etc/httpd/conf.modules.d/proxy-directive.conf > /etc/httpd/conf.modules.d/01-proxy.conf
RUN rm /etc/httpd/conf.modules.d/00-proxy.conf
