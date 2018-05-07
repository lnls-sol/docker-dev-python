FROM lnlssol/debian9-epicsbase:dev
RUN apt-get update

RUN apt-get install wget -y

# python base
RUN apt-get install python3 python3-pip -y
RUN apt-get install python3-pyqt5 python3-pyqt5.qtsvg -y
## Qt5 and designer
RUN apt-get install qttools5-dev-tools qt5-default -y


# configure utf-8 (used on py4syn)
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN apt-get install locales -y
RUN locale-gen en_US.UTF-8

# python packages
## install pyepics separate to set NOLIBCA option
RUN NOLIBCA=1 pip3 install pyepics

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

## PyDM last release (v1.1.0)
RUN wget https://github.com/slaclab/pydm/archive/v1.1.0.tar.gz -O /tmp/v1.1.0.tar.gz
RUN cd /tmp && tar -xzf v1.1.0.tar.gz
RUN cd /tmp/pydm-1.1.0 && python3 setup.py install && mv /tmp/pydm-1.1.0 /usr/local/pydm

# configure environment variables
RUN echo 'export PYQTDESIGNERPATH=/usr/local/pydm' >> /etc/bash.bashrc
RUN echo 'export LANG="en_US.UTF-8"' >> /etc/bash.bashrc
RUN echo 'export LC_ALL="en_US.UTF-8"' >> /etc/bash.bashrc

## py4syn last commit
RUN git clone https://github.com/hhslepicka/py4syn /tmp/py4syn
RUN export LC_ALL="en_US.UTF-8" && export LANG="en_US.UTF-8" && cd /tmp/py4syn && python3 setup.py install

# clean 
RUN apt-get clean
RUN rm -rf /tmp/*

CMD bash
