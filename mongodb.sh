#!/bin/bash

source ./common.sh

check_root()

cp $SCRIPT_DIR/mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "Adding MongoDB Repo"

dnf install mongodb-org -y &>>$LOG_FILE
VALIDATE $? "Installing MongoDB"

systemctl enable mongod &>>$LOG_FILE
VALIDATE $? "Enabling MongoDB"

systemctl start mongod &>>$LOG_FILE
VALIDATE $? "Starting MongoDB"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf|&>>$LOG_FILE
VALIDATE $? "Allowing remote connections in MongoDB"

systemctl restart mongod
VALIDATE $? "Restarted MongoDB"

print_total_time