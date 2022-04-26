#!/usr/bin/expect -f

spawn $env(SHELL)
send -- "ssh root@lun.sa\r"
expect -exact "*"
send -- "password@nasrcity\r"
expect -exact "*"
send -- "cd /\r"
expect -exact "*"
send -- "cd /home/shogol/public_html/test/shogol-backend\r"
expect -exact "*"

send -- "git pull origin main\r"
expect -exact "*"
send -- "4rv3cfd63khpu4e7lqnbwdoth7oepr5vvzgkga77gt3f5tvb7qsa\r"
expect -exact "*"
send -- "composer update; php artisan migrate;php artisan passport:install;php artisan generate:seed ;"
expect -exact "*"
expect eof