FROM centos:centos7
MAINTAINER "Aamir M. Shaikh"

ARG USERNAME=radical

RUN groupadd -r $USERNAME && useradd -r -g $USERNAME $USERNAME

RUN chown -R $USERNAME:$USERNAME /home/$USERNAME/

USER $USERNAME

WORKDIR /home/$USERNAME

RUN yum install httpd -y
RUN yum install git -y

COPY /var/tmp/index.html /tmp

#COPY . /var/www/html

WORKDIR /tmp

RUN touch index.php

RUN echo "Hello Radical" >> /tmp/index.php

ENV DocumentRoot=/var/www/html/

EXPOSE 80

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]



