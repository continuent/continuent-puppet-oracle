#!/usr/bin/env bash

source /home/oracle/.bash_profile
sqlplus /nolog <<EOF
connect / as sysdba
shutdown immediate
startup mount
alter database archivelog;
alter database open;
EOF

touch /tmp/archivelog.lck
