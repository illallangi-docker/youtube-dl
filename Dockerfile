FROM docker.io/fedora:31

MAINTAINER Andrew Cole <andrew.cole@illallangi.com>

RUN dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-31.noarch.rpm; \
    dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-31.noarch.rpm; \
    dnf -y install curl ffmpeg which; \
    dnf -y update; \
    dnf -y clean all

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl; \
    chmod 755 /usr/local/bin/youtube-dl

COPY contrib/dumb-init_1.2.2_amd64 /usr/local/bin/dumb-init
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x \
        /entrypoint.sh \
        /usr/local/bin/dumb-init

ENTRYPOINT ["/usr/local/bin/dumb-init", "--", "/entrypoint.sh"]