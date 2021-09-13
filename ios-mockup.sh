#!/bin/sh

TEMPLATE=~/Scripts/mobile-templates/ios.png
FILE=$1
filename="${FILE%%.*}"

convert -size 1305x2658 xc:none \
    \( $FILE -resize 1170x2532! \) -geometry +72+63 -composite \
    $TEMPLATE -composite \
    ${filename}_ios.png
