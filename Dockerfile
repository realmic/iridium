FROM debian:sid-slim

ENV BUILDDEPS cmake make g++ gcc python2.7 git libboost1.61-all-dev
ENV STATICDEPS libboost-atomic1.61.0 libboost-serialization1.61.0 libboost-system1.61.0 libboost-filesystem1.61.0 libboost-thread1.61.0 libboost-date-time1.61.0 libboost-chrono1.61.0 libboost-regex1.61.0 libboost-program-options1.61.0

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y $STATICDEPS $BUILDDEPS \
	&& rm -rf /var/lib/apt/lists/*

ADD . /opt/iridium
WORKDIR /opt/iridium

RUN make -j4

RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $BUILDDEPS

RUN mkdir /opt/iridium_data && mkdir /opt/iridium_bin
RUN cp /opt/iridium/build/release/src/walletd /opt/iridium_bin
RUN cp /opt/iridium/build/release/src/iridiumd /opt/iridium_bin

RUN chmod -R 755 /opt/iridium_bin/

RUN rm -rf /opt/iridium/
