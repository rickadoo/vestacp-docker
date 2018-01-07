FROM centos:7

#updates

RUN yum update -y

#download vestacp install script

RUN curl -O http://vestacp.com/pub/vst-install.sh

# run install script
# sets up vestacp with nginx+apache, exim+dovecot+spamassassin+clamav,
# vsftpd, named, iptables+fail2ban, softalicious, remi repo, postgreSQL

RUN yes 'y' | bash vst-install.sh --nginx yes --apache yes --phpfpm no --named yes --remi yes --vsftpd yes --proftpd no --iptables yes --fail2ban yes --quota no --exim yes --dovecot yes --spamassassin yes --clamav yes --softaculous yes --mysql no --postgresql yes

# Recommend Specifying Env Variables
# -- Hostname --email --password

EXPOSE 80
EXPOSE 8083

