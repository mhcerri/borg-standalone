#!/bin/bash

# Update and install dependencies
apt-get update -y
apt-get install -y \
	python3 python3-dev python3-pip python-virtualenv python-lz4  \
	build-essential openssl libssl-dev libacl1-dev liblz4-dev \
	liblzma-dev libfuse-dev fuse pkg-config git-core

# Create virtual env
virtualenv --python=python3 /build/env
source /build/env/bin/activate
alias pip='pip -v --log=/build/pip.log'

# Get sources
if [[ ! -e /build/borg ]]; then
	git clone https://github.com/borgbackup/borg.git /build/borg
fi
cd /build/borg/

# Install pip dependencies
pip install --upgrade pip
pip install pyinstaller cython tox
pip install -r requirements.d/development.txt
pip install -r requirements.d/docs.txt
pip install -r requirements.d/fuse.txt
pip install -e .

# Make standalone binary
# https://github.com/borgbackup/borg/issues/213
cd src/
pyinstaller -F -n borg \
	    --distpath=../dist/ \
	    --hidden-import=logging.config \
	    borg/__main__.py
