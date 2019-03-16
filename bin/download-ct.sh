#!/bin/bash
# https://github.com/coreos/container-linux-config-transpiler/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

# Specify Config Transpiler version
VER=v0.9.0

# Specify Architecture
# ARCH=aarch64 # ARM's 64-bit architecture
ARCH=$(uname -m)

# Specify OS
# OS=apple-darwin # MacOS
# OS=pc-windows-gnu.exe # Windows
OS=unknown-linux-gnu # Linux

# Specify download URL
DOWNLOAD_URL=https://github.com/coreos/container-linux-config-transpiler/releases/download

# file names
FILE_NAME=ct-${VER}-${ARCH}-${OS}
BIN_FILE=${SCRIPT_DIR}/ct-$(uname -s)-${ARCH}
ASC_FILE=${BIN_FILE}.asc
GPG_KEY_FILE=/tmp/coreos-app-signing-pubkey.gpg

# Remove previous downloads
rm -f ${BIN_FILE} ${ASC_FILE} ${GPG_KEY_FILE}

# Download Config Transpiler binary
curl -kSL ${DOWNLOAD_URL}/${VER}/${FILE_NAME} -o ${BIN_FILE}
chmod u+x ${BIN_FILE}

# Download and import CoreOS application signing GPG key
curl https://coreos.com/dist/pubkeys/app-signing-pubkey.gpg -o ${GPG_KEY_FILE}
gpg2 --import --keyid-format LONG ${GPG_KEY_FILE}

# Download and import CoreOS application signing GPG key if it has not already been imported
curl -kSL ${DOWNLOAD_URL}/${VER}/${FILE_NAME}.asc -o ${ASC_FILE}
gpg2 --verify ${ASC_FILE} ${BIN_FILE}
