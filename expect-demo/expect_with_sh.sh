#!/usr/bin/env bash
cat ./ip.txt |while read line
do
  ip=`echo $line|awk '{print $1}'`
  user=`echo $line|awk '{print $2}'`
  pass=`echo $line|awk '{print $3}'`
  echo $ip $user $pass
  ./expect_with_sh.exp $ip $user $pass
done
