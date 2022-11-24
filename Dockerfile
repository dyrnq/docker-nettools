FROM debian:buster

LABEL org.label-schema.description="Useful network related tools" \
      org.label-schema.version=1.0.3

ENV   RG_VERSION=13.0.0 \
      FD_VERSION=8.5.3 \
      YQ_VERSION=v4.30.4 \
      DEBIAN_FRONTEND=noninteractive \
      TZ=Asia/Shanghai \
      LANG=en_US.utf8

RUN   set -eux; \
      apt-get clean && \
      apt-get update && \
      apt-get -y upgrade && \
      apt-get install --no-install-recommends -yq \
      locales \
      ca-certificates \
      curl; \
      localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8; \
      ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata; \
      curl -fsSL https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz | tar --extract --gunzip --strip-components=1 --verbose --directory /usr/local/bin/ ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl/rg; \
      curl -fsSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64.tar.gz | tar --extract --gunzip --verbose --directory /usr/local/bin/ --transform "s/yq_linux_amd64/yq/" && chmod +x /usr/local/bin/yq; \      
      curl -fsSL https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd-v${FD_VERSION}-x86_64-unknown-linux-gnu.tar.gz | tar --extract --gunzip --strip-components=1 --verbose --directory /usr/local/bin/ fd-v${FD_VERSION}-x86_64-unknown-linux-gnu/fd; \
      apt-get clean && apt install --no-install-recommends -yq \
      fping \
      wget \
      netcat \
      nmap \
      jq \
      dnsutils \
      iproute2 \
      ncat \
      iputils-ping \
      mtr-tiny \
      socat \
      traceroute \
      htop \
      net-tools \
      iptables \
      nload \
      vnstat \
      tcpdump \
      openssl \
      strace \
      openssh-client \
      procps \
      aria2 \
      tree \
      lrzsz \
      rsync \
      knot-dnsutils \
      hping3 \
      psmisc \
      dmitry \
      whois \
      ncaptool \
      packit \
      sendip \
      ngrep \
      libndpi-bin \
      pwgen \
      zip \
      unzip \
      bzip2 \
      xz-utils \
      tcpreplay \
      git \
      gnupg2 \
      p11-kit \
      fzf \
      telnet \
      iputils-arping \
      ipcalc \
      zmap \
      libnss3-tools \
      iptraf-ng \
      bwm-ng \
      && apt-get clean && rm -rf /var/lib/apt/lists/*
ENTRYPOINT []

