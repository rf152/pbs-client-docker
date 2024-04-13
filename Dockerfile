FROM debian:12

RUN apt-get update \
    && apt-get -y install \
      wget \
      vim \
    ; \
    wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O- |  gpg --enarmour > /etc/apt/trusted.gpg.d/proxmox-release-bookworm.asc \
    && echo "deb [signed-by=/etc/apt/trusted.gpg.d/proxmox-release-bookworm.asc] http://download.proxmox.com/debian/pbs-client bookworm main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install proxmox-backup-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
