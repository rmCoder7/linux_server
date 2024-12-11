cd /etc/yum.repos.d
vim rhel8.repo

[BaseOS]
name=Red Hat linux 8 Enterprise -BaseOS
gpgcheck=0
enabled=1
baseurl=file://  #(add the bios link here)

[AppStream]
name=Red hat linux 8 Enterprise -AppStream
gpgcheck=0
enabled=1
baseurl=file://  #(add url from bios link)

yum clean all
yum repolsit
yum list all
