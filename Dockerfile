FROM lnlssol/debian9-epicsbase
RUN apt-get update

RUN apt-get install wget git vim -y
RUN apt-get install bzip2 -y

### Python 3
RUN apt-get install python3 python3-pip -y

### Packages for qt5 and designer
RUN apt-get install qt5-default qttools5-dev-tools -y

### PyQt5

WORKDIR /root/

COPY installpyqt5.sh /root/
RUN /root/installpyqt5.sh

COPY installpydm.sh /root/
RUN /root/installpydm.sh

COPY installpy4syn.sh /root/
RUN /root/installpy4syn.sh

COPY installscanutils.sh /root/
RUN /root/installscanutils.sh

## clean
RUN apt-get clean
RUN rm -rf /tmp/*

CMD bash
