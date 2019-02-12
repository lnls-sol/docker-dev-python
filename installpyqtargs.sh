#!/bin/bash

mkdir -p /usr/local/SOL/GUI
cd /usr/local/SOL/GUI
git clone https://gitlab.cnpem.br/SOL/GUI/PyQtArgs

echo "export PYTHONPATH=\$PYTHONPATH:/usr/local/SOL/GUI" >> /etc/bash.bashrc

