alias py=python
alias h='sudo halt -p'
alias rb='sudo reboot'
alias dt='cd ~/Desktop'
alias l1='ls -1'
# if you have installed dos2unix,just use it `dos2unix myfile.txt`
# change file from dos format to unix format,ie. trip the tailing ^M
# using sed: `sed -i 's/^M$//' input.txt` ,ref (http://www.cyberciti.biz/faq/howto-unix-linux-convert-dos-newlines-cr-lf-unix-text-format/)
# if no perl installed,open file with vim,then type `:%s/\r/\r/g` ,ref:http://stackoverflow.com/a/1203971
alias donix='perl -p -i -e "s/\s+$/\n/"'
alias lhs="ls -lhS"
alias ra="source ~/.zshrc"
alias va="vi ~/.bash_aliases"
alias pyser="python -m SimpleHTTPServer"
alias auto_install='./configure && make && sudo make install'

alias rsy_all='rsy_bin;rsy_dev;rsy_book;rsy_common;rsy_db;rsy_jars;rsy_workspaces;rsy_rc;rsy_api;rsy_apt_cache'
alias tmux='tmux -2'
alias gaa='git add -A .'
alias sai='sudo apt-get install -y '
alias rsy_vim='rsync -avhz ~/data/vim/.vim /media/lan/hitachi/vim/'
alias vv='vi ~/.vimrc'
alias nw='sudo nethogs  eth0'
alias zz='vi ~/.zshrc'
alias md='nohup sslocal -c ~/document/shadowsocks.json &>/tmp/proxy.out &'
alias rlib=' rsync -avhz /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_trusty*  /vagrant/data/var/lib/apt/lists'
alias rcache='rsync -avhz /var/cache/apt/archives/*.deb  /vagrant/data/var/cache/apt/archives'
alias bejs='jekyll serve  --watch --force_polling'
alias bejsb='jekyll serve  --watch --force_polling &>/dev/null &'
alias wget='wget -c --no-check-certificate '
alias rs='rails s -b0.0.0.0'
alias rsd='rails s -b0.0.0.0 &>/dev/null &'
alias c='tmux attach -t cli||tmux new -s cli'
alias ta='tmux attach -t'
alias clsh='cat /dev/null > ~/.zsh_history'
alias youtube-dl='youtube-dl --prefer-ffmpeg '
alias bejs='bundle exec jekyll serve'
alias up='sudo apt-get update && sudo apt-get dist-upgrade -y'
alias bi=' bundle install'
alias pc='proxychains '
alias gdoc='godoc -http=:8080'
alias you-name="rename 's/(.*)-.*(.mp4)/\1\2/'"
alias ydl='youtube-dl -f22 --proxy=http://127.0.0.1:1080 '
alias pgup='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgdown='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias bwg='ssh 45.78.37.57 -p 27573'
alias redisup="redis-server /usr/local/etc/redis.conf"
if [ -f ~/.my_aliases ]; then
  source ~/.my_aliases
fi

