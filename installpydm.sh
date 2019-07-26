#!/bin/bash

git clone https://github.com/slaclab/pydm.git /tmp/pydm
cd /tmp/pydm
git checkout tags/v1.6.5 -b v1.6.5

# Set 'only-if-needed' so pyqt is kept in right version
pip3 install --upgrade-strategy=only-if-needed .[all]

# Reinstall pyqtgraph, on develop branch for bug fixes 
pip3 install git+https://github.com/pyqtgraph/pyqtgraph@develop

mv /tmp/pydm /usr/local/pydm-1.6.5
echo 'export PYQTDESIGNERPATH=/usr/local/pydm-1.6.5' >> /etc/bash.bashrc
