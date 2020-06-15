#!/bin/bash
# https://github.com/docker/compose/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

# Specify Config Transpiler version
VER=1.26.0

# Specify OS
OS=$(uname -s)

# Specify Architecture
ARCH=$(uname -m)

# Specify download URL
DOWNLOAD_URL=https://github.com/docker/compose/releases/download

# file names
FILE_NAME=docker-compose-${OS}-${ARCH}
BIN_FILE=${FILE_NAME}
HASH_FILE=${BIN_FILE}.sha256

pushd ${SCRIPT_DIR}

# Remove previous downloads
rm -f ${BIN_FILE} ${HASH_FILE}

# Download docker-compose
curl -kSL ${DOWNLOAD_URL}/${VER}/${FILE_NAME} -o ${BIN_FILE}
chmod u+x ${BIN_FILE}

# Download hash file and check
curl -ksSL ${DOWNLOAD_URL}/${VER}/${FILE_NAME}.sha256 -o ${HASH_FILE}
sha256sum -c ${HASH_FILE}

popd
