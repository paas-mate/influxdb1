FROM shoothzj/base

WORKDIR /opt

ARG TARGETARCH

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.10_linux_$TARGETARCH.tar.gz  && \
mkdir -p /opt/influxdb && \
tar -xf influxdb-1.8.10_linux_$TARGETARCH.tar.gz -C /opt/influxdb --strip-components 2 && \
rm -rf /opt/influxdb-1.8.10_linux_$TARGETARCH.tar.gz && \
ln -s /opt/influxdb/usr/bin/influx /usr/bin/influx && \
ln -s /opt/influxdb/usr/bin/influxd /usr/bin/influxd

ENV INFLUX_HOME /opt/influxdb

WORKDIR /opt/influxdb
