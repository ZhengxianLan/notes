#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cat $DIR/iplist.txt |while read line
do
  ip=`echo $line|awk '{print $1}'`
  user=`echo $line|awk '{print $2}'`
  pass=`echo $line|awk '{print $3}'`
  localip=$(ifconfig eth0 | awk '/inet addr/ {gsub("addr:", "", $2); print $2}')
  localhost=$(hostname)
  # 如果是本机就不需要拷贝脚本，直接生成key并分发就好了
  if [ $ip == $localip -o $localhost == $ip ] ;then
    bash $DIR/dispatch_key.sh
    echo 'skip '  $ip
    continue
  fi
  echo $ip $user $pass
  # 拷贝脚本到各个vm上
  #./expect_with_sh.exp $ip $user $pass
  /usr/bin/env expect <<EOF
  set timeout 30
  spawn scp -r $DIR $user@$ip:
  expect {
    "(yes/no)" { send "yes\r";exp_continue }
    "password:" { send "$pass\r" }
  }
  expect eof
EOF
  # 远程执行 生成key并分发 的脚本
  ssh $user@$ip "bash scripts/dispatch_key.sh" &
  echo execute $ip
done
