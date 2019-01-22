#!/bin/bash

apt-get install python3-pyqt5 python3-pyqt5.qtsvg -y

# Make PyQt5 recognized by pip (work-around)
SITE_PACKAGES=`python3 -c "import site; print(site.getsitepackages()[0])"`
PYQT_VERSION=`python3 -c 'from PyQt5.Qt import PYQT_VERSION_STR; print(PYQT_VERSION_STR)'` PYQT_META_FOLDER=${SITE_PACKAGES}/PyQt5-${PYQT_VERSION}.dist-info
mkdir ${PYQT_META_FOLDER}
echo "Name: PyQt5" > ${PYQT_META_FOLDER}/METADATA
echo "Version: ${PYQT_VERSION}" >> ${PYQT_META_FOLDER}/METADATA
