FROM centos:centos7
MAINTAINER "Aamir M. Shaikh"

ARG user=appuser
ARG uid=1010
ARG gid=1010

RUN yum install httpd -y

RUN yum install git -y

RUN groupadd -g $gid -r $user && useradd -u $uid -g $gid -r -m -d /home/$user -g $user $user

RUN chown -R $user:$user /home/$user/

RUN chmod -R 755 /home/$user

#COPY /var/tmp/index.html /tmp

#COPY . /var/www/html
USER $user

WORKDIR /home/$user

RUN touch index.php

RUN echo "Hello Radical" >> /tmp/index.php

ENV DocumentRoot=/var/www/html/

USER root

EXPOSE 80

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
