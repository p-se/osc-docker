FROM opensuse/leap:15.2

ENTRYPOINT osc

RUN zypper ref

RUN zypper addrepo http://download.suse.de/ibs/SUSE:/CA/openSUSE_Leap_15.1/SUSE:CA.repo && \
    zypper --non-interactive --gpg-auto-import-keys refresh

RUN zypper --non-interactive install --no-recommends \
    ca-certificates-suse \
    bzip2 \
    git-core \
    jq \
    osc \
    python3-pip \
    python3-virtualenv \
    tar \
    wget \
    curl \
    fzf \
    fzf-zsh-completion \
    vim \
    vim-fzf \
    zsh \
    libxslt-tools \
    sudo

RUN useradd -m user && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER user
WORKDIR /home/user

