#!/bin/bash

source ./common.sh

check_root

dnf install python3 gcc python3-devel -y &>>$LOG_FILE
VALIDATE $? "Installing Python3"

app_setup
python_setup
systemd_setup

app_restart
print_total_time