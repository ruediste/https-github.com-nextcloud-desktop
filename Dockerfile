FROM ubuntu:18.04
MAINTAINER Ruedi Steinmann

RUN apt-get update
RUN apt-get install -y libqt5gui5 \
    libqt5keychain1 \
    libqt5network5 \
    libqt5positioning5 \
    libqt5printsupport5 \
    libqt5qml5 \
    libqt5quick5 \
    libqt5webchannel5 \
    libqt5webenginecore5 \
    libqt5webkit5 \
    libqt5widgets5 \
    zlib1g \
    libqt5xml5 \
    libsqlite3-0 \
    libssl1.1 \
    libqt5webenginewidgets5 \
    libstdc++6 \
    libqt5sql5-sqlite

RUN apt-get install -y ca-certificates locales curl
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 

ENV NC_USER=username \
    NC_PASS=password \
    NC_URL="" \
    NC_DAV_PATH="" \
    NC_TRUST_CERT=false \
    NC_SOURCE_DIR="/data/" \
    NC_SILENT=false

# add run script
ADD dist /usr/lib/x86_64-linux-gnu
RUN ldconfig
ADD run.sh /usr/bin/run.sh

CMD /usr/bin/run.sh

