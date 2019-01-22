#!/bin/bash

### py4syn last commit
git clone https://github.com/lnls-sol/py4syn /tmp/py4syn
## configure utf-8 (used on py4syn)
echo 'export LANG="en_US.UTF-8"' >> /etc/bash.bashrc
echo 'export LC_ALL="en_US.UTF-8"' >> /etc/bash.bashrc
echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
apt-get install locales -y
locale-gen en_US.UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
cd /tmp/py4syn
pip3 install scipy numpy matplotlib h5py
python3 setup.py install
