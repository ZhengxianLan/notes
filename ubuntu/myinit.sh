#!/bin/bash

rsy_local(){

    sudo chown -R lan:lan ~/
    (
    cd /media/lan/hitachi/netrunner
    ln -s ~/data/note/shell/bin ~/
    mkdir -p ~/.config/autostart;ln -s ~/bin/startup ~/.config/autostart/
    mkdir -p ~/.stardict/dic
    tar -xf /media/lan/hitachi/software/stardic/dic.tgz -C ~/.stardict/dic
    sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="acpi_osi=Linux acpi_backlight=video"/' /etc/default/grub
    sudo sed -i '$i echo 50 >/sys/class/backlight/intel_backlight/brightness \nsu - lan -c "bash /home/lan/bin/startup"' /etc/rc.local

    sudo update-grub
    )
}
rsy_apt(){
    sudo add-apt-repository -y ppa:synapse-core/testing
    sudo apt-get update
    sudo apt-get install -y meld gitk pv zsh autojump vim nethogs  language-pack-gnome-zh-hans keepassx python-pip nodejs stardict curl  wget aria2 proxychains synapse ppa-purge elinks whois tree tmux ufw iftop tig okular guake silversearcher-ag exuberant-ctags nodejs-legacy amule
    sudo pip install shadowsocks
    sudo npm install -g coffee-script
    #sudo sed -i '/^socks4/d' /etc/proxychains.conf
    #sudo echo 'socks5 127.0.0.1 1080'>>/etc/proxychains.conf
    chsh -s /usr/bin/zsh

}

install_dev(){
    mkdir -p ~/program
    find /media/lan/hitachi/software/ -iname '*gz' -exec tar -xf {} -C ~/program/ \;
    # cat >> 没有权限
    sudo sed -i '30a JAVA_HOME=/home/lan/program/jdk1.7.0_03\nexport PATH=$JAVA_HOME/bin:$PATH' /etc/profile
    ln -sf ~/program/sublime_text_3/custom.desktop ~/Desktop/sublime.desktop
    sudo ln -sf ~/program/sublime_text_3/custom.desktop /usr/share/applications/sublime.desktop
}



link_rcs(){
    ln -sf ~/data/note/shell/rcs/.[!.]* ~/
    ln -sf ~/data/note/git/.gitconfig ~/
}

rsy_local &
rsy_apt
(
    cd ~/data
    git clone /media/lan/hitachi/repo/person.git
    sudo rm /etc/proxychains.conf
    ln -sf ~/data/note/gfw/proxychains.conf /etc/proxychains.conf
)

#install flash
tar -xf /media/lan/hitachi/software/flash/install_flash_player_11_linux.x86_64.tar.gz -C /tmp/
sudo cp /tmp/libflashplayer.so /usr/lib/mozilla/plugins
sudo cp -r /tmp/usr/* /usr

# This operation is too long and less important,place it at last
rsync -avzh --delete /media/lan/hitachi/book ~/data/
rsync -avhz /media/lan/hitachi/Music/* ~/Music/
rsync -avhz /media/lan/hitachi/netrunner/home/lan /home/
install_dev

#bash ~/data/note/google/earth.sh
#bash ~/data/note/ubuntu/clementine.sh
bash ~/data/note/ubuntu/fcitx/fcitx
sudo chown -R lan:lan ~/
# bash ~/data/note/google/chrome/install_chrome.sh

