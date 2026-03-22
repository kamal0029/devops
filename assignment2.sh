#!/bin/bash

useradd -m emma
useradd -m noah
useradd -m olivia
useradd -m alice
useradd -m bob

groupadd -g 4500 developers

usermod -aG developers emma
usermod -aG developers noah

usermod -g developers olivia

gpasswd -d noah developers

groupadd sharedgrp

usermod -aG sharedgrp alice
usermod -aG sharedgrp bob

mkdir -p /home/shared_folder

chown :sharedgrp /home/shared_folder

chmod 770 /home/shared_folder
chmod g+s /home/shared_folder

sudo -u alice bash -c 'echo "Alice:devops" > /home/shared_folder/notes.txt'
sudo -u bob bash -c 'echo "Bob:devops" >> /home/shared_folder/notes.txt'


