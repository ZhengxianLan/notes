#!/bin/bash

# 在windows上安装git-bash之后就可以使用了，把该脚本放在%path%中
# 消除后缀 rename 's/\.txt$//'  *
# 消除后缀 rename 's/\(\.txt\)\+$//'  *
# 增加后缀 rename 's/$/\.txt/' *
# 增加后缀 find -iname '*[!.]???' -type f -exec rename 's/$/\.txt/' '{}' \;
re=${1}
shift
for i in $@; do
	nn=`echo ${i}|sed $re`
	echo "rename ${i} to ${nn}"
	mv ${i} ${nn}
done
