#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
BASE_NAME=$(basename $SCRIPT_DIR)
PARENT_DIR=$(dirname $SCRIPT_DIR)

tar czf dotfiles-$(date +%Y%m%d).tar.gz -C $PARENT_DIR \
    --exclude=$BASE_NAME/dotfiles-*.tar.gz \
    --exclude=$BASE_NAME/_vim/dein/cache_* \
    --exclude=$BASE_NAME/_vim/dein/state_* \
    $BASE_NAME
