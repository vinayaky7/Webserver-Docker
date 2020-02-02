FROM centos

RUN yum install httpd -y

RUN  yum install git -y

RUN touch /root/test.txt

RUN echo "Hello World"

EXPOSE 80

CMD ["-D", "FOREGROUND"]

ENTRYPOINT ["/usr/sbin/httpd"]

