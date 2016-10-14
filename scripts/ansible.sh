#!/bin/sh

# check if ansible is already installed by using hash function
if hash ansible-playbook 2> /dev/null; then
        echo "ansible already installed"
else
        echo "installing ansible"
        grep -q -F 'deb' /etc/apt/sources.list.d/ansible.list || echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list.d/ansible.list
        apt-add-repository -y ppa:ansible/ansible
        apt-get update
        apt-get install -y ansible
fi
