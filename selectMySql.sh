#!/bin/bash

# $1 = sql select file
# output = select sql result.

mysql -u${DB_USER} -p${DB_PASSWORD} ${DB_DATABASE} < $1

