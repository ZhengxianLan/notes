#!/usr/bin/env bash
user=lan
pass=lan
ip=master

/usr/bin/env expect <<EOF
  set timeout 30
  spawn ssh $user@$ip
  expect {
    "(yes/no)" { send "yes\r";exp_continue }
    "password:" { send "$pass\r" }
  }
  expect "$user@*" { send "df -h\r" }
  expect "$user@*" { send "exit\r" }
  expect eof
EOF
