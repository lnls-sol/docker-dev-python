#!/bin/bash

apt-get install python3-tk -y

pip3 install pyyaml docopt pyxdg
mkdir -p /usr/local/SOL/
cd /usr/local/SOL/
git clone https://gitlab.cnpem.br/SOL/Projetos/scan-utils

# Create folder for beamline config files
mkdir -p /etc/xdg/scan-utils/
chmod 777 /etc/xdg/scan-utils/

echo "export PYTHONPATH=\$PYTHONPATH:/usr/local/SOL/scan-utils/" >> /etc/bash.bashrc

# Link executable scripts of scan-utils
for i in /usr/local/SOL/scan-utils/*; do
    if [[ -x "$i" ]]
    then
        echo "File '$i' is executable"
        ln -s $i /usr/local/bin/`basename $i`
    fi
done

#Link sample config files so those scripts can be called from any dir
for i in /usr/local/SOL/scan-utils/*.yml; do
    ln -s $i /etc/xdg/scan-utils/`basename $i`
done

