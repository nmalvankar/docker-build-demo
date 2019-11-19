FROM openshift/httpd:2.4

COPY my-project-name/* /opt/rh/httpd24/root/var/www/html
