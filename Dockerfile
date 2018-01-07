FROM centos:7

#updates

RUN yum update -y

#download vestacp install script

RUN curl -O http://vestacp.com/pub/vst-install.sh

# run install script
# sets up vestacp with nginx+apache, exim+dovecot+spamassassin+clamav,
# vsftpd, named, iptables+fail2ban, softalicious, remi repo, postgreSQL

RUN bash vst-install.sh -g yes -y no -s vesta.dspixels.com -e dan@dspixels.com -p admin -f


# Recommend Specifying Env Variables
# -- Hostname --email --password

EXPOSE 80 21 22 53 443 12000-12100 25 465 587 2525 8083 110 995 993 3306 5432

