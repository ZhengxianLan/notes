#!/usr/bin/env bash

# 这个脚本会在每个虚拟机都执行一遍
# 1. 在本机生成密匙对
# 2. 将公钥复制到其他主机上去

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cat $DIR/iplist.txt |while read line
do
  ip=`echo $line|awk '{print $1}'`
  user=`echo $line|awk '{print $2}'`
  pass=`echo $line|awk '{print $3}'`
  echo $ip $user $pass
  [ ! -e ~/.ssh/id_rsa.pub ] && expect $DIR/gen.exp
  #./expect_with_sh.exp $ip $user $pass
  /usr/bin/env expect <<EOF
  set timeout 30
  spawn ssh-copy-id -i /home/$user/.ssh/id_rsa.pub $user@$ip
  expect {
    "(yes/no)" { send "yes\r";exp_continue }
    "password:" { send "$pass\r" }
  }
  expect eof
EOF
done
