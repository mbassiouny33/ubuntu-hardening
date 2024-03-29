

### Remove unnecessary packages
sudo apt-get remove aisleriot brltty colord deja-dup duplicity empathy example-content gnome-mahjongg gnome-mines gnome-orca gnome-sudoku landscape-common libreoffice-avmedia-backend-gstreamer libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-galaxy libreoffice-writer libsane libsane-common python3-uno rhythmbox rhythmbox-plugins rhythmbox-plugin-zeitgeist sane-utils shotwell shotwell-common thunderbird thunderbird-gnome-support totem totem-common

sudo apt-get remove gnome-system-monitor gedit gnome-characters
sudo apt purge gnome-software
sudo apt-get remove update-manager

sudo apt-get purge libzeitgeist-1.0-1 python-zeitgeist zeitgeist-core 
sudo apt-get purge zeitgeist-core zeitgeist-datahub python-zeitgeist rhythmbox-plugin-zeitgeist zeitgeist




###disable root:
## step 1
sudo tee /etc/passwd > /dev/null <<EOT
root:!x:0:0:root:/root:/sbin/nologin
$(sudo tail -n +2 /etc/passwd)
EOT
## step 2
sudo tee /etc/shadow > /dev/null <<EOT
$(sudo tail -n +2 /etc/shadow)
EOT



### disably TTY (VERY IMPORTANT)

## method 0 -safe
cd /etc/init
sudo mkdir tty.bkp
sudo mv tty4 tty5 tty6 tty.bkp
cd /etc/event.d
sudo mkdir tty.conf.bkp
sudo mv tty4.conf tty5.conf tty6.conf tty.conf.bkp

## method 1
sudo tee -a /etc/init/tty{1..6}.override <<<"manual"

## method2
sudo -i touch /etc/X11/xorg.conf
sudo tee /etc/X11/xorg.conf > /dev/null <<EOT
Section "ServerFlags"
    Option "DontVTSwitch" "true"
EndSection
EOT


### delete mirrors to prevent updates
sudo rm /etc/apt/sources.list



#remove terminal to protect the os from even bad actions done by the user. Has to be done in a chroot env.
#sudo apt-get purge --auto-remove gnome-terminal
