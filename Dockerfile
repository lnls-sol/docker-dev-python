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

COPY installpyqtargs.sh /root/
RUN /root/installpyqtargs.sh

COPY installsolutils.sh /root/
RUN /root/installsolutils.sh

COPY installsolwidgets.sh /root/
RUN /root/installsolwidgets.sh

## clean
RUN apt-get clean
RUN rm -rf /tmp/*

ARG USER_ID
ARG GROUP_ID
ARG USER

RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
       groupadd -g ${GROUP_ID} "domain^users" &&\
       useradd -l -u ${USER_ID} -g "domain^users" ${USER} &&\
       mkdir /home/${USER} &&\
       chown -R ${USER}:"domain^users" /home/${USER}\
       ;fi

WORKDIR /home/${USER}
USER ${USER}

RUN echo "export PS1='${debian_chroot:+($debian_chroot)}\u@docker:\w\$ ' " > .bashrc

COPY scan_gui.sh /bin/scan_gui

CMD bash
