alias py=python
alias h='sudo halt -p'
alias rb='sudo reboot'
alias dt='cd ~/Desktop'
alias l1='ls -1'
# change file from dos format to unix format,ie. trip the tailing ^M
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
alias getggip="nslookup www.google.com|grep Address|awk -F: '{ print $2}'|grep -v '8.8.8.8'"
alias up='sudo apt-get update && sudo apt-get dist-upgrade -y'
alias bi=' bundle install'
alias pc='proxychains '
alias xp='nohup  /usr/lib/virtualbox/VirtualBox --comment kp3 --startvm 83a32599-dc96-4ebf-98cf-c49a16021f68 --no-startvm-errormsgbox &>/tmp/xp.log &'
alias dp='nohup proxychains ~/.dropbox-dist/dropboxd &>/tmp/dropbox.log &'
alias mouse='xsetpointer -l | grep Pointer'
if [ -f ~/.my_aliases ]; then
  source ~/.my_aliases
fi


