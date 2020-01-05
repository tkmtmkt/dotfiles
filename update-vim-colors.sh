#!/bin/bash
# vim: set ft=sh ts=2 sw=2 et:
#
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

COLORS_DIR=${SCRIPT_DIR}/_vim/colors
[[ -e ${COLORS_DIR} ]] || mkdir -p ${COLORS_DIR}

while read URL
do
  FILE=$(basename ${URL})
  echo curl -ksSL ${URL} -o ${COLORS_DIR}/${FILE}
  curl -ksSL ${URL} -o ${COLORS_DIR}/${FILE}
done <<EOS
https://raw.githubusercontent.com/jeetsukumaran/vim-nefertiti/master/colors/nefertiti.vim
https://raw.githubusercontent.com/jonathanfilip/vim-lucius/master/colors/lucius.vim
https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
https://raw.githubusercontent.com/Haron-Prime/Antares/master/colors/antares.vim
https://raw.githubusercontent.com/aereal/vim-colors-japanesque/master/colors/japanesque.vim
https://raw.githubusercontent.com/jpo/vim-railscasts-theme/master/colors/railscasts.vim
https://raw.githubusercontent.com/KKPMW/moonshine-vim/master/colors/moonshine_minimal.vim
https://raw.githubusercontent.com/KKPMW/moonshine-vim/master/colors/moonshine_lowcontrast.vim
https://raw.githubusercontent.com/KKPMW/moonshine-vim/master/colors/moonshine.vim
https://raw.githubusercontent.com/jacoborus/tender.vim/master/colors/tender.vim
https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
https://raw.githubusercontent.com/reedes/vim-colors-pencil/master/colors/pencil.vim
https://raw.githubusercontent.com/vim-scripts/rdark/master/colors/rdark.vim
https://raw.githubusercontent.com/vim-scripts/Wombat/master/colors/wombat.vim
https://raw.githubusercontent.com/vim-scripts/twilight/master/colors/twilight.vim
https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
https://raw.githubusercontent.com/sjl/badwolf/master/colors/goodwolf.vim
https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim
https://raw.githubusercontent.com/AlessandroYorba/Alduin/master/colors/alduin.vim
https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim
EOS
