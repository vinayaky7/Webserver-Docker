FROM docker.io/centos

RUN yum install httpd -y

RUN yum install elinks -y

RUN  yum install git -y

WORKDIR /var/www

RUN git clone https://gitlab.com/andromeda99/html.git

EXPOSE 80

CMD ["-D", "FOREGROUND"]

ENTRYPOINT ["/usr/sbin/httpd"]

