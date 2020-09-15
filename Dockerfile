FROM debian:buster

LABEL org.label-schema.description="Useful network related tools" \
      org.label-schema.version=1.0.0

ENV   RG_VERSION=12.1.1 \
      FD_VERSION=8.1.1 \
      YQ_VERSION=3.3.2 \
      DEBIAN_FRONTEND=noninteractive \
      TZ=Asia/Shanghai \
      LANG=en_US.utf8

RUN set -eux; \
      sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
      sed -i "s#deb.debian.org#mirrors.huaweicloud.com#g" /etc/apt/sources.list && \
      sed -i "s#security.debian.org#mirrors.huaweicloud.com#g" /etc/apt/sources.list && \
      apt-get clean && \
      apt-get update && \
      apt-get -y upgrade && \
      apt-get install --no-install-recommends -yq \
      locales \
      curl; \
      localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8; \
      ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata; \
      curl -fksSL https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz | tar --extract --gunzip --strip-components=1 --verbose --directory /usr/local/bin/ ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl/rg; \
      curl -fksSL -o /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 && chmod +x /usr/local/bin/yq; \
      curl -fksSL https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd-v${FD_VERSION}-x86_64-unknown-linux-gnu.tar.gz | tar --extract --gunzip --strip-components=1 --verbose --directory /usr/local/bin/ fd-v${FD_VERSION}-x86_64-unknown-linux-gnu/fd; \
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
      ca-certificates \
      openssh-client \
      git \
      gnupg2 \
      p11-kit \
      fzf \
      telnet \
      && apt-get clean && rm -rf /var/lib/apt/lists/*
ENTRYPOINT []
