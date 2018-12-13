#!/bin/bash

/root/miniconda3/bin/conda create --name dev python=3.6
source /root/miniconda3/bin/activate dev
conda install -c pcds-tag pyqt
conda install -c pydm-tag pydm==1.5
#conda install -c conda-forge/label/cf201901 pyqt
#conda install -c pydm-tag -c conda-forge pydm



