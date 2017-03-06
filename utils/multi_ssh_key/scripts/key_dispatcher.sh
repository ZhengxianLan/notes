#!/usr/bin/env bash
# 如果只是从一台登录到多台主机，那么只要运行此脚本就好了(iplist配置要登录的目标主机)
IFS=$'\n'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
USERHOME="$( cd  && pwd )"
[ ! -e $USERHOME/.ssh/id_rsa.pub ] && expect $DIR/gen.exp
for line in `cat $DIR/iplist.txt`
do
  ip=`echo $line|awk '{print $1}'`
  user=`echo $line|awk '{print $2}'`
  pass=`echo $line|awk '{print $3}'`
  #./expect_with_sh.exp $ip $user $pass
  ssh -q -o "BatchMode=yes" $user@$ip "echo 2>&1" && continue;
  /usr/bin/env expect <<EOF
  set timeout 30
  spawn ssh-copy-id -i $USERHOME/.ssh/id_rsa.pub $user@$ip
  expect {
    expect eof
    "(yes/no)" { send "yes\r";exp_continue }
    "password:" { send "$pass\r" }
  }
  expect eof
EOF
done
