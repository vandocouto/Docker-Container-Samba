#!/bin/bash

user=tgl
pass=mypass


cut -d: -f1 /etc/passwd | grep -i $user

if [ $? -ne 0 ]; then
        useradd $user
        chown $user:$user /storage/ -R
        (echo $pass ; echo $pass) | smbpasswd -a $user
fi

nmbd -D
ionice -c 3 smbd -FS < /dev/null
