#!/bin/bash
dnf install httpd -y
cd /etc/www/html
ll
systemctl enable service.httpd 
systemctl status service.httpd
firewall-cmd --permanent -add-service=httpd --zone=public
firewall-cmd --reload
firewall-cmd --list-all

hostnamectl set-hostname www.addhostname.com
hostnamectl

dnf install httpd -y openssl mod_ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/private/httpd.key -out /etc/pki/tls/certs/httpd.crt
 Vim /etc/httpd/conf.d/http.conf

 #after access this vim and then type this

<Directory “/var/www/html/”>
require all granted
</Directory>

<Virtualhost
ServerName
server0.example.com:443  #add website name add website port *443
>
server0.example.com
DocumentRoot /var/www/html/
SSLEngine on
SSLProtocol all -SSLv3
SSLHonorCipherOrder on
SSLCipherSuite PROFILE=SYSTEM
SSLProxyCipherSuite PROFILE=SYSTEM
SSLCertificateFile /etc/pki/tls/certs/httpd.crt
SSLCertificateKeyFile /etc/pki/tls/private/httpd.key 
</VirtualHost>

cat /etc/httpd/conf.d/ssl.conf   | grep localhost 
#or
grep localhost /etc/httpd/conf.d/ssl.conf
#(here add your server name or website's name), we use this in order to check if the ssl add is with our website or not.

firewall-cmd  - - permanent  - - add- service = https - -zone = public
firewall -cmd  - - permanent - -add -ports = 443 / tcp - - zone = public
Firewall - cmd   - - reload
systemctl enable httpd - - now
Systemctl status httpd



