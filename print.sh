#!/bin/sh

pandoc $1 --katex -s --quiet -c "/home/robot/Scripts/print/github-pandoc.css" --pdf-engine wkhtmltopdf -o $1.tmp.html
node "/home/robot/Scripts/print/print.js" $1.tmp.html
rm $1.tmp.html
