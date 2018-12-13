#!/bin/bash

source /root/miniconda3/bin/activate dev
conda install pyyaml docopt pyxdg
cd /root
git clone https://gitlab.cnpem.br/SOL/Projetos/scan-utils

