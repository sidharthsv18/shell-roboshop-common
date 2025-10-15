#!/bin/bash

souce ./common.sh

dnf install mysql-server -y &>>$LOG_FILE
VALIDATE $? "Installing MySQL"

systemctl enable mysqld     &>>$LOG_FILE
VALIDATE $? "Enabling MySQL"

systemctl start mysqld  &>>$LOG_FILE
VALIDATE $? "Starting MySQL"

mysql_secure_installation --set-root-pass RoboShop@1 &>>$LOG_FILE
VALIDATE $? "Setting MySQL root password"

print_total_time