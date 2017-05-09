FROM ubuntu:16.04
MAINTAINER Evandro Couto <vandocouto@gmail.com>

# update e instalação de pacotes
RUN apt-get update -y ; apt-get upgrade -y && \
    apt-get install apt-utils wget openssh-server telnet vim passwd ifstat unzip iftop telnet samba net-tools -y && \
    rm -rf /var/lib/apt/lists/*

# ajustando o SSH
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' -y && \
    sed -i 's/PermitRootLogin without-password/#PermitRootLogin without-password/g' /etc/ssh/sshd_config && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    echo 'root:root' | chpasswd

# Exportando LANG=C
RUN echo 'export LANG=C' >> /etc/profile

# localtime
RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Criando o diretório /storage
RUN mkdir -p /storage

# Add smb.conf
ADD smb.conf /etc/samba/smb.conf
ADD run.sh   /

# Setup and Start
ENTRYPOINT ["/run.sh"]


