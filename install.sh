#!/bin/bash

apt-get install -y autoconf cmake libpopt-dev libtalloc-dev libtevent-dev libbsd-dev comerr.dev mingw32 mingw-w64 python-elixir ldap-utils rwho rsh-client x11-apps finger libpcap-dev masscan discover backdoor-factory winbind

service postgresql start
service metasploit start
service apache2 start

update-rc.d postgresql enable
update-rc.d metasploit enable
update-rc.d apache2 enable

mkdir /opt/veil
cd /opt/veil
wget https://raw.githubusercontent.com/Veil-Framework/Veil/master/Install.sh
chmod +x Install.sh
./Install.sh -c

cd /usr/share/nmap/scripts
wget http://www.computec.ch/projekte/vulscan/download/nmap_nse_vulscan-2.0.tar.gz
tar xzf nmap_nse_vulscan-2.0.tar.gz
echo 'alias nmapvul="nmap -sV -script=vulscan/vulscan.nse "' >> ~/.bashrc

mkdir /root/Desktop/foofus/
cd /root/Desktop/foofus/
wget http://www.foofus.net/jmk/tools/owa/OWALogonBrute.pl
wget http://www.foofus.net/jmk/tools/owa/OWA55EnumUsersURL.pl
wget http://www.foofus.net/jmk/tools/owa/OWALightFindUsers.pl
wget http://www.foofus.net/jmk/tools/owa/OWAFindUsers.pl
wget http://www.foofus.net/jmk/tools/owa/OWAFindUsersOld.pl

cd /tmp/
wget http://garr.dl.sourceforge.net/project/mingw/Installer/mingw-get-setup.exe
wine mingw-get-setup.exe
cd /root/.wine/drive_c/windows
wget http://gojhonny.com/misc/mingw_bin.zip
unzip -d /root/.wine/drive_c/windows mingw_bin.zip

cd /root/Desktop/
git clone https://github.com/liorvh/MITMf mitmf
cd mitmf/
./kali_setup.sh

mkdir /root/Desktop/wlists/
cd /root/Desktop/wlists/
wget http://download.g0tmi1k.com/wordlists/large/crackstation-human-only.txt.gz
gzip -d crackstation-human-only.txt.gz
wget http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
bzip2 -d rockyou.txt.bz2
svn checkout http://fuzzdb.googlecode.com/svn/trunk/ fuzzdb
git clone https://github.com/liorvh/SecLists.git seclists

cd /root/Desktop/
git clone https://github.com/liorvh/patator.git
git clone https://github.com/liorvh/sparta.git

git clone https://bitbucket.org/LaNMaSteR53/peepingtom.git
cd /root/Desktop/peepingtom/
wget https://gist.githubusercontent.com/nopslider/5984316/raw/423b02c53d225fe8dfb4e2df9a20bc800cc78e2c/gnmap.pl
wget http://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
tar xf phantomjs-1.9.2-linux-x86_64.tar.bz2
cp /root/Desktop/peepingtom/phantomjs-1.9.2-linux-x86_64/bin/phantomjs .

cd /tmp/
git clone https://github.com/liorvh/smbexec.git
cd /tmp/smbexec/
echo "[+] Select option 1"
/tmp/smbexec/install.sh
echo "[*] Where did you install SMBexec?: "
read smbexecpath
$smbexecpath/smbexec/install.sh
cd $smbexecpath/smbexec/
bundle install

mkdir /opt/wce/
cd /tmp/
wget http://www.ampliasecurity.com/research/wce_v1_41beta_universal.zip
unzip -d /opt/wce/ wce_v1_41beta_universal.zip

cd /usr/share/nmap/scripts/
wget https://raw.githubusercontent.com/hdm/scan-tools/master/nse/banner-plus.nse

cd /usr/share/powersploit/
wget https://raw.githubusercontent.com/obscuresec/random/master/StartListener.py
wget https://raw.githubusercontent.com/darkoperator/powershell_scripts/master/ps_encoder.py

cd /tmp/
wget https://www.trustedsec.com/files/bypassuac.zip
unzip bypassuac.zip
cp bypassuac/bypassuac.rb /opt/metasploit/apps/pro/msf3/scripts/meterpreter/
mv bypassuac/uac/ /opt/metasploit/apps/pro/msf3/data/exploits/

cd /root/
wget http://fc08.deviantart.net/fs70/f/2013/264/5/7/kali_by_typograflaw-d6n6m8l.png
gsettings set org.gnome.desktop.background picture-uri "file:///root/kali_by_typograflaw-d6n6m8l.png"

update-java-alternatives --jre -s java-1.7.0-openjdk-amd64

echo "[+] All tools installed successfully!"
echo "[+] ~~~ Happy Hacking! ~~~"
echo ""

rm -rf /tmp/*
rm -rf /root/Desktop/kali_tools.sh
