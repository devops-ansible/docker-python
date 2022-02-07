#!/usr/bin/env bash

# adjust executable rights and move files to correct places
chmod a+x /boot.sh

chmod a+x /entrypoint
mv /entrypoint              /usr/local/bin/

# upgrade and install applets and services
echo 'fetch apt cache and install helpers'
apt-get update -q --fix-missing
apt-get -yq install -y --no-install-recommends \
        software-properties-common procps apt-utils

echo 'upgrade and install tools'
apt-get update -q --fix-missing
apt-get -yq upgrade
apt-get -yq install -y --no-install-recommends \
        python3-setuptools python3-pip python3-pkg-resources \
        python3-jinja2 python3-yaml \
        vim nano \
        htop tree tmux screen sudo git zsh ssh screen \
        supervisor expect \
        gnupg openssl \
        curl wget unzip \
        sqlite3 libsqlite3-dev libpq-dev \
        locales locales-all \
        cron \
        openssl pkg-config

pip install j2cli

echo 'defining aliases'

# add aliases
read -d '' bash_alias << 'EOF'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
EOF

echo "$bash_alias" >> /etc/bash.bashrc

# perform installation cleanup
apt-get -y clean
apt-get -y autoclean
apt-get -y autoremove
rm -r /var/lib/apt/lists/*
