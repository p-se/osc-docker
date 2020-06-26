FROM opensuse/leap:15.2

RUN zypper addrepo http://download.suse.de/ibs/SUSE:/CA/openSUSE_Leap_15.1/SUSE:CA.repo && \
    zypper --non-interactive --gpg-auto-import-keys refresh && \
    zypper --non-interactive install --no-recommends \
        ca-certificates-suse \
        bzip2 \
        git-core \
        jq \
        osc \
        python3-pip \
        python3-virtualenv \
        tar \
        wget \
        vim \
        zsh \
        sudo

RUN useradd -m user \
    && echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY oscrc /home/user/.oscrc

RUN chown user:users /home/user/.oscrc \
    && chmod 600 /home/user/.oscrc

USER user
WORKDIR /home/user

RUN osc --version
