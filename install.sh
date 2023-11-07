#!/bin/bash
# System Updates
sudo apt update -y
sudo apt full-upgrade --fix-missing -y
sudo apt autoremove -y
#sudo parrot-upgrade

# APT (first question "No", next all "Yes" for golang)
sudo apt install aptitude
sudo aptitude install golang-go ruby amass net-tools htop seclists gobuster ffuf adb exploitdb proxychains4 smbclient ftp cmake software-properties-common git wpscan python3-venv freerdp2-x11 netcat

mkdir Tools
cd Tools

# Windows
mkdir Windows && cd Windows

mkdir amsi && cd amsi
for i in {1..20}; do
    wget https://raw.githubusercontent.com/ConstantinTi/pentest-setup/main/amsi/amsi$i.ps1
done
cd ..

wget https://github.com/Group3r/Group3r/releases/download/1.0.53/Group3r.exe
wget https://github.com/ConstantinTi/pentest-setup/raw/main/executables/PSGPO-Evasion.exe
wget https://github.com/ConstantinTi/pentest-setup/raw/main/executables/SpoolSample.exe
wget https://github.com/ConstantinTi/pentest-setup/raw/main/executables/SharpView.exe
wget https://github.com/ConstantinTi/pentest-setup/raw/main/executables/SharpMapExec.exe
wget https://github.com/ConstantinTi/pentest-setup/raw/main/executables/Rubeus.exe
wget https://github.com/Kevin-Robertson/Inveigh/releases/download/v2.0.9/Inveigh-net3.5-v2.0.9.zip && unzip Inveigh-net3.5-v2.0.9.zip -d Inveigh && cd Inveigh && mv Inveigh.exe ../Inveigh-net3.exe && cd .. && rm -r Inveigh && rm Inveigh-net3.5-v2.0.9.zip
wget https://github.com/Kevin-Robertson/Inveigh/releases/download/v2.0.9/Inveigh-net4.6.2-v2.0.9.zip && unzip Inveigh-net4.6.2-v2.0.9.zip -d Inveigh && cd Inveigh && mv Inveigh.exe ../Inveigh-net4.exe && cd .. && rm -r Inveigh && rm Inveigh-net4.6.2-v2.0.9.zip
wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer32.exe
wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe
wget https://github.com/SnaffCon/Snaffler/releases/download/1.0.103/Snaffler.exe
wget https://download.sysinternals.com/files/SysinternalsSuite.zip && unzip SysinternalsSuite.zip -d SysinteralsSuite && rm SysinternalsSuite.zip
wget https://raw.githubusercontent.com/Kevin-Robertson/Inveigh/master/Inveigh.ps1
wget https://raw.githubusercontent.com/dafthack/DomainPasswordSpray/master/DomainPasswordSpray.ps1
wget https://raw.githubusercontent.com/sense-of-security/ADRecon/master/ADRecon.ps1
wget https://raw.githubusercontent.com/cube0x0/Security-Assessment/master/SecurityAssessment.ps1
wget https://raw.githubusercontent.com/leoloobeek/LAPSToolkit/master/LAPSToolkit.ps1
wget https://raw.githubusercontent.com/411Hall/JAWS/master/jaws-enum.ps1
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1
wget https://raw.githubusercontent.com/dafthack/HostRecon/master/HostRecon.ps1
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1
wget https://raw.githubusercontent.com/itm4n/PrivescCheck/master/PrivescCheck.ps1
wget https://raw.githubusercontent.com/NetSPI/PowerUpSQL/master/PowerUpSQL.ps1
wget https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.ps1
wget https://raw.githubusercontent.com/EmpireProject/Empire/master/data/module_source/credentials/Invoke-Kerberoast.ps1
wget https://github.com/vletoux/pingcastle/releases/download/3.0.0.0/PingCastle_3.0.0.0.zip && unzip PingCastle_3.0.0.0.zip -d PingCastle && rm PingCastle_3.0.0.0.zip
git clone https://github.com/dirkjanm/PKINITtools.git
git clone https://github.com/Wh04m1001/DFSCoerce.git
git clone https://github.com/topotam/PetitPotam.git
git clone https://github.com/cube0x0/noPac.git
git clone https://github.com/GhostPack/PSPKIAudit.git
git clone https://github.com/ParrotSec/mimikatz.git
wget https://github.com/BloodHoundAD/SharpHound/releases/download/v1.1.0/SharpHound-v1.1.0.zip
mkdir SharpHound && cd SharpHound && unzip ../SharpHound-v1.1.0.zip && rm ../SharpHound-v1.1.0.zip && cd ..
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany_ofs.exe
wget https://github.com/AlessandroZ/LaZagne/releases/download/2.4.3/lazagne.exe
wget https://eternallybored.org/misc/netcat/netcat-win32-1.11.zip
mkdir nc && cd nc && unzip ../netcat-win32-1.11.zip && rm ../netcat-win32-1.11.zip && cd ..

# Rock you
sudo gunzip -d /usr/share/wordlists/rockyou.txt.gz

# Go
#go install github.com/Emoe/kxss@latest

echo "export PATH=$PATH:/home/c/go/bin" >> /home/c/.bashrc
echo "export PATH=$PATH:/home/c/go/bin" >> /home/c/.zshrc
echo "alias ls='ls -liah'" >> /home/c/.bashrc
echo "alias ls='ls -liah'" >> /home/c/.zshrc
export PATH=$PATH:/home/c/go/bin
alias ls='ls -liah'

# Binary database updates
wpscan --update
sudo sqlmap --update

#Ruby
sudo gem install evil-winrm

#Pip
pip3 install search-that-hash
sudo apt-get install python3-venv
python3 -m pip install pipx
python3 -m pipx ensurepath
python3 -m pipx install crackmapexec
python3 -m pipx install bloodhound

# Linux priv esc
mkdir Linux
cd Linux
git clone https://github.com/Ridter/noPac.git && cd noPac && pip3 install -r requirements.txt && cd ..
git clone https://github.com/Anon-Exploiter/SUID3NUM.git
git clone https://github.com/mzet-/linux-exploit-suggester.git
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
curl -s https://linpeas.sh > linpeas.sh
git clone https://github.com/carlospolop/PEASS-ng.git
git clone https://github.com/rebootuser/LinEnum.git
git clone https://github.com/sleventyeleven/linuxprivchecker.git && cd linuxprivchecker && pip3 install -r requirements.txt && cd ..
git clone https://github.com/spencerdodd/kernelpop.git
cd ..

# Firefox Extensions
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/cookie-quick-manager/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/shodan-addon/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/dotgit/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/open-multiple-urls/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/s3-bucket-list/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/link-gopher/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/security-txt/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/single-file/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/crxviewer/"

rm nohup.out
sudo chown -R c .
echo "" > ~/.bash_history
echo "" > ~/.zsh_history
