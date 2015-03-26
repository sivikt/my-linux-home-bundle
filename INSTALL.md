# How to do fresh setup for my laptop


Remove unused:
    sudo apt-get clean
    sudo apt-get autoremove indicator-messages
    sudo apt-get autoremove telepathy-indicator
    sudo apt-get autoremove deja-dup
    sudo apt-get autoremove ubuntuone-client python-ubuntuone-control-panel
   

Tune conf:
    sudo sed <set vm.swappiness=10> /etc/sysctl.conf
    sudo apt-get install preload


Autostart apps (show hidden):
    mkdir -p ~/.config/autostart
    cd ~/.config/autostart
    cp /etc/xdg/autostart/*.desktop .
    sed -i "s/NoDisplay=true/NoDisplay=false/g" *.desktop
    
    
Applications:
    sudo mkdir /opt/popcorn-time
    sudo mv Popcorn-Time-0.3.6-Linux64.tar.xz /opt/popcorn-time/
    sudo tar -xJf Popcorn-Time-0.3.6-Linux64.tar.xz
    sudo ln -s /opt/popcorn-time/Popcorn-Time /usr/local/bin/popcorn-time
    
    

