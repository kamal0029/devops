#!/bin/bash
mkdir -p ~/project_files
find /var/log -type f -size +50k -exec cp {} ~/project_files/ \;
chmod 640 ~/project_files/*
du -sh ~/project_files
