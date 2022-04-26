#!/usr/bin/expect -f

spawn $env(SHELL)
send -- "ssh root@lun.sa\r"
expect -exact "*"
send -- "password@nasrcity\r"
expect -exact "*"
send -- "cd /\r"
expect -exact "*"
send -- "cd /home/talabatcom/public_html/uat/Admin\r"
expect -exact "*"
send -- "git pull\r"
expect -exact "*"
send -- "4rv3cfd63khpu4e7lqnbwdoth7oepr5vvzgkga77gt3f5tvb7qsa\r"
expect -exact "*"
