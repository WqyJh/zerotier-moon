FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get install libssl1.1 ca-certificates sudo curl gnupg -y && \
    curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
    curl -s https://install.zerotier.com | bash && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

LABEL maintainer="WqyJh <qiyingwangwqy@gmail.com>"

COPY startup.sh /startup.sh

EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
