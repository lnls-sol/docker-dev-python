#!/bin/bash

apt-get install dbus-user-session dbus-x11 -y

mkdir -p /usr/local/SOL/
cd /usr/local/SOL/
git clone https://gitlab.cnpem.br/SOL/Python/sol_utils

echo "export PYTHONPATH=\$PYTHONPATH:/usr/local/SOL/sol_utils" >> /etc/bash.bashrc

