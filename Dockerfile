FROM debian:bookworm

LABEL org.label-schema.description="Useful network related tools"

ENV   RG_VERSION=14.1.0 \
      FD_VERSION=10.1.0 \
      YQ_VERSION=v4.44.2 \
      DEBIAN_FRONTEND=noninteractive \
      TZ=Asia/Shanghai \
      LANG=en_US.utf8

RUN   set -eux; \
ARCH="$(uname -m)"; \
case "${ARCH}" in \
   aarch64|arm64) \
     yqArch="arm64"; \
     ripgrepArch="${ARCH}"; \
     ripgrepClib="gnu" \
     fdArch="${ARCH}"; \
     ;; \
   amd64|x86_64) \
     yqArch="amd64"; \
     ripgrepArch="${ARCH}"; \
     ripgrepClib="musl" \
     fdArch="${ARCH}"; \
     ;; \
   *) \
     echo "Unsupported arch: ${ARCH}"; \
     exit 1; \
     ;; \
esac; \
      apt-get clean && \
      apt-get update && \
      apt-get -y upgrade && \
      apt-get install --no-install-recommends -yq \
      locales \
      ca-certificates \
      curl; \
      localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8; \
      ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata; \
      curl -fsSL https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/ripgrep-${RG_VERSION}-${ripgrepArch}-unknown-linux-${ripgrepClib}.tar.gz | tar --extract --gunzip --strip-components=1 --verbose --directory /usr/local/bin/ ripgrep-${RG_VERSION}-${ripgrepArch}-unknown-${ripgrepClib}-musl/rg; \
      curl -fsSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${yqArch} -o /usr/local/bin/yq  && chmod +x /usr/local/bin/yq; \      
      curl -fsSL https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd-v${FD_VERSION}-${fdArch}-unknown-linux-gnu.tar.gz | tar --extract --gunzip --strip-components=1 --verbose --directory /usr/local/bin/ fd-v${FD_VERSION}-${fdArch}-unknown-linux-gnu/fd; \
      apt-get clean && apt install --no-install-recommends -yq \
      fping \
      wget \
      netcat-openbsd \
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

