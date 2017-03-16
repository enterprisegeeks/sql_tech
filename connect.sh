#!/bin/bash
# connect to RDS from env

mysql -h${DB_HOST} -u${DB_USER} -p${DB_PASSWORD} ${DB_DATABASE}

