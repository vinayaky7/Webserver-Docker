FROM centos
MAINTAINER "Aamir M. Shaikh"
RUN yum install httpd -y
RUN  yum install git -y
RUN touch /root/test.txt
RUN echo "Hello World"
ENV DocumentRoot=/var/www/html/
EXPOSE 80
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]



