FROM ubuntu:trusty
MAINTAINER George Lewis <schvin@schvin.net>

ENV REFRESHED_AT 2014-10-07
RUN apt-get update --fix-missing -y && apt-get upgrade -y 
RUN apt-get install -y mutt fetchmail w3m gnupg exim

RUN groupadd mail
RUN useradd mail -g mail -d /home/mail
RUN mkdir -p /home/mail/.newsbeuter
RUN chown -R mail:mail /home/mail

ENV HOME /home/mail
USER mail
WORKDIR /home/mail

#ENTRYPOINT ["/usr/bin/mutt"]
