#!/bin/zsh

INKSCAPE_BIN=/Applications/Inkscape.app/Contents/Resources/bin/inkscape

for fig in `ls figs/*/*.svg`
do
    echo "$fig -> `echo $fig | cut -d '.' -f1`.pdf"
    $INKSCAPE_BIN -f $fig -A `echo $fig | cut -d '.' -f1`.pdf &> /dev/null
done