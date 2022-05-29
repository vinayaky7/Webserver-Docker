FROM centos:centos7
MAINTAINER "Aamir M. Shaikh"

ARG USERNAME=user-name-goes-here
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN yum install httpd -y
RUN  yum install git -y

RUN groupadd --gid $USER_GID $USERNAME \
    useradd -d /home/$USERNAME -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME 
WORKDIR /home/$USERNAME

COPY index.html /tmp
#COPY . /var/www/html
WORKDIR /tmp
RUN touch index.php
RUN echo "Hello Radical" >> /tmp/index.php
ENV DocumentRoot=/var/www/html/

EXPOSE 80

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]



