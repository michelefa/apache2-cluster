FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get upgrade -y

#Install Apache2
RUN apt-get install apache2 -y
RUN service apache2 restart

#INstall php 7
RUN apt-get -y install php7.0 libapache2-mod-php7.0

#Install PHP zip
RUN apt-get -y install php7.0-zip 

#Install Essential Modules
RUN apt-get -y install php7.0 php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php-pear php-imagick php7.0-imap php7.0-mcrypt php-memcache  php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-mbstring php-gettext
RUN service apache2 restart

#Speeds up PHP
RUN apt-get -y install php-apcu

#Modules required
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod headers
RUN service apache2 restart

#Addres required folders /files
#ADD /Certs /Certs
ADD ./runscript /entrypoint.sh
Add ./000-default.conf  /etc/apache2/sites-enabled/000-default.conf
Add ./apache2.conf /etc/apache2/apache2.conf

#Add Certificaites
ADD ./Certs/zettabox.crt /usr/share/ca-certificates/zettabox.crt
ADD ./Certs/privatekey.key /usr/share/ca-certificates/privatekey.key
ADD ./Certs/intermediate2.crt /usr/share/ca-certificates/intermediate.crt


RUN chmod +x /entrypoint.sh

RUN chmod 777 /entrypoint.sh

CMD ["/entrypoint.sh"]

#WORKDIR /APP
