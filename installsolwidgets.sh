#!/bin/bash

mkdir -p /usr/local/SOL/GUI
cd /usr/local/SOL/GUI
pip3 install QDarkStyle
git clone https://gitlab.cnpem.br/SOL/GUI/sol-widgets

# This is already added by pyqtargs 
echo "export PYTHONPATH=\$PYTHONPATH:/usr/local/SOL/GUI/sol-widgets/" >> /etc/bash.bashrc

echo "export PYQTDESIGNERPATH=\$PYQTDESIGNERPATH:/usr/local/SOL/GUI/sol-widgets/" >> /etc/bash.bashrc
