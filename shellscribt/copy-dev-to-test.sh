#!/usr/bin/expect -f

spawn $env(SHELL)
send -- "ssh root@lun.sa\r"
expect -exact "*"
send -- "password@nasrcity\r"
expect -exact "*"
send -- "cd /\r"
expect -exact "*"
send -- "cd /home/talabatcom/public_html/test\r"
expect -exact "*"
send -- "rm -rf /Admin\r"
expect -exact "*"
send -- "cd /\r"
expect -exact "*"
send -- "cd /home/talabatcom/public_html/DEV\r"
expect -exact "*"
send -- "copy /Admin /home/talabatcom/public_html/test \r"
expect -exact "*"
expect eof