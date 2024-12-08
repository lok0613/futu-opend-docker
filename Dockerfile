FROM ubuntu:16.04

RUN sed -i "s@archive.ubuntu.com@mirrors.aliyun.com@g" /etc/apt/sources.list \
	&& sed -i "s@security.ubuntu.com@mirrors.aliyun.com@g" /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y wget procps iputils-ping net-tools

ENV SDK_VERSION=8.8.4808
ENV SDK_NAME=Futu_OpenD${SDK_VERSION}_Ubuntu16.04

RUN wget -O - https://softwarefile.futunn.com/${SDK_NAME}.tar.gz | tar -xzf - -C / \
	&& rm -rf /${SDK_NAME}/${SDK_NAME}.AppImage \
	&& ln -s /${SDK_NAME}/${SDK_NAME} /FutuOpenD

WORKDIR /FutuOpenD

COPY ./FutuOpenD.xml /FutuOpenD/FutuOpenD.xml
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
