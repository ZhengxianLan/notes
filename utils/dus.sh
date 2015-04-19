#!/bin/bash
# du -sBk target  and sort the result
target='.'
[ -n "$1" ] && target="$1"
#find  "$target" -maxdepth 1 -exec du -sh '{}' \;|sort -nr|column -t
find  "$target" -maxdepth 1 -exec du -s '{}' \;|sort -nr|
awk 'BEGIN{ G=1024*1024;M=1024 }
{   
    if($1>G)  
        printf("%5.0f%-10s %s\n",$1/G,"G",$2)
    else if ($1>M)
      {  printf("%5.0f%-10s %s\n",$1/M,"M",$2) }
    else
        #右对齐,占5格  左对齐,占10格  
        printf("%5.0f%-10s %s\n",$1,"K",$2)
}'|
    less
