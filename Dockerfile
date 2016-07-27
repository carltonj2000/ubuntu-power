FROM ubuntu

ENV GO=/home/carltonj2000/cj/configsNscripts/go \
    HTML=/home/carltonj2000/cj/cjSourceControlled/carltonj2000/home-server/build

RUN mkdir -p ${GO}
RUN mkdir -p ${HTML}

WORKDIR /root/
ADD bashrc .
RUN cat bashrc >> .bashrc

#ENTRYPOINT exec /bin/bash # for debug
ENTRYPOINT exec ${GO}/bin/cjWebserverPower

EXPOSE 8111
