FROM ubuntu:latest

MAINTAINER stylesen

ENV LOCAL_TIME 201708161101

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y git

RUN apt-get install -y python3-pip
RUN apt-get install -y python3.5-dev
RUN apt-get install -y apache2
RUN apt-get install -y libapache2-mod-wsgi-py3
RUN sed -i 's/80/5000/' /etc/apache2/ports.conf
RUN apt-get install -y python3-flask
RUN apt-get install -y python3-flask-api
RUN apt-get install -y python3-jinja2

RUN pip3 install flask-mysql
RUN pip3 install flask-json

RUN mkdir /var/www/public_web
ADD flaskapp.wsgi /var/www/flaskapp/flaskapp.wsgi
ADD flaskapp.cfg /etc/apache2/sites-available/flaskapp.conf
RUN a2ensite flaskapp.conf

EXPOSE 5000
