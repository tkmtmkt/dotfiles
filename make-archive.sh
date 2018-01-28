#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
BASE_DIR=$(dirname $SCRIPT_DIR)
BASE_NAME=$(basename $SCRIPT_DIR)

tar czf dotfiles-$(date +%Y%m%d).tar.gz -C $BASE_DIR \
    --exclude=$BASE_NAME/dotfiles-*.tar.gz \
    $BASE_NAME
