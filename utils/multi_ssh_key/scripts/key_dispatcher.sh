#!/usr/bin/env bash
IFS=$'\n'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
[ ! -e ~/.ssh/id_rsa.pub ] && expect $DIR/gen.exp
for line in `cat $DIR/iplist.txt` 
do
  ip=`echo $line|awk '{print $1}'`
  user=`echo $line|awk '{print $2}'`
  pass=`echo $line|awk '{print $3}'`
  #./expect_with_sh.exp $ip $user $pass
  ssh -q -o "BatchMode=yes" $user@$ip "echo 2>&1" && continue;
  /usr/bin/env expect <<EOF
  set timeout 30
  spawn ssh-copy-id -i /home/$user/.ssh/id_rsa.pub $user@$ip
  expect {
    expect eof
    "(yes/no)" { send "yes\r";exp_continue }
    "password:" { send "$pass\r" }
  }
  expect eof
EOF
done
