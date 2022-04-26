#!/usr/bin/expect -f

spawn $env(SHELL)
send -- "ssh root@lun.sa\r"
expect -exact "*"
send -- "password@nasrcity\r"
expect -exact "*"
send -- "cd /\r"
expect -exact "*"
send -- "cd /home/talabatcom/public_html/test/Admin\r"
expect -exact "*"
send -- "git pull\r"
expect -exact "*"
send -- "s4jlh27vikfearaqrscv5p5qn4sqashplgqfzcq226nr3ty3julq\r"
expect -exact "*"

expect eof