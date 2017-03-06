#!/usr/bin/env bash
IFS=$'\n'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
USERHOME="$( cd  && pwd )"
#cat $DIR/iplist.txt |while read line
for line in `cat $DIR/iplist.txt`
do
  ip=`echo $line|awk '{print $1}'`
  user=`echo $line|awk '{print $2}'`
  pass=`echo $line|awk '{print $3}'`
  localip=$(ifconfig eth0 | awk '/inet addr/ {gsub("addr:", "", $2); print $2}')
  localhost=$(hostname)
  # 如果是本机就不需要拷贝脚本，直接生成key并分发就好了
  if [ $ip == $localip -o $localhost == $ip ] ;then
    bash $DIR/key_dispatcher.sh
    echo 'skip '  $ip
    continue
  fi
  # 拷贝脚本到各个vm上
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
  ssh $user@$ip "bash scripts/key_dispatcher.sh"
  # 分发之后，我们删除其他机子上的脚本
  ssh $user@$ip "rm -fr scripts"
done
