#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then
    echo "Running with sudo privileges."
else
    echo "Not running with sudo privileges."
    exit 0
fi

if dpkg -s ansible &>/dev/null; then
    echo "Ansible is installed."
else
    echo "Ansible is not installed."
    sudo apt update
    sudo apt install ansible
fi

cd /opt/
sudo wget https://raw.githubusercontent.com/ConstantinTi/pentest-setup/main/setup.yaml > setup.yaml
sudo ansible-playbook setup.yml