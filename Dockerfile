FROM jrottenberg/ffmpeg:3.3
COPY sources.list /etc/apt/sources.list
RUN  apt-get update && \
	apt-get install python curl wget -qy --no-install-recommends && \
	wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl && \
	chmod a+rx /usr/local/bin/youtube-dl && \
	apt-get clean -y && \
        rm -rf /var/lib/apt/lists && \
	mkdir /opt/workdir
COPY scripts/downloader.sh /opt/workdir
COPY scripts/converter.sh /opt/workdir
WORKDIR /opt/workdir

