#!/bin/sh

TEMPLATE=~/Scripts/mobile-templates/android.png
FILE=$1
filename="${FILE%%.*}"

convert -size 1196x2456 xc:none \
    \( $FILE -resize 1084x2344! \) -gravity center -composite \
    $TEMPLATE -composite \
    ${filename}_android.png
