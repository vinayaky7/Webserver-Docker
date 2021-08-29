FROM centos
MAINTAINER "Aamir M. Shaikh"
RUN yum install httpd -y
RUN  yum install git -y
COPY index.html /tmp
#COPY . /var/www/html
WORKDIR /tmp
RUN touch index.php
RUN echo "Hello Radical" >> /tmp/index.php
ENV DocumentRoot=/var/www/html/
EXPOSE 80
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]



