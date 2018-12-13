FROM lnlssol/debian9-epicsbase
RUN apt-get update

RUN apt-get install wget git vim -y
RUN apt-get install bzip2 -y

WORKDIR /root/
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN chmod +x Miniconda3-latest-Linux-x86_64.sh
RUN ./Miniconda3-latest-Linux-x86_64.sh -b

RUN echo "export PATH=$PATH:/root/miniconda3/bin/" >> /root/.bashrc
RUN export PATH=$PATH:/root/miniconda3/bin/
RUN /root/miniconda3/bin/conda config --append channels conda-forge

COPY createenv.sh /root/
RUN ./createenv.sh
RUN echo "export PYQTDESIGNERPATH=/root/miniconda3/envs/dev/etc/pydm" >> /root/.bashrc
RUN echo "source activate dev" >> /root/.bashrc


### Packages necessary to designer
RUN apt-get install qt5-default -y

COPY installpy4syn.sh /root/
RUN /root/installpy4syn.sh

COPY installscanutils.sh /root/
RUN /root/installscanutils.sh


## clean 
RUN apt-get clean
RUN rm -rf /tmp/*

CMD bash
