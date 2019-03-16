#!/bin/zsh

for fig in `ls figs/*/*.eps`
do
    echo "$fig -> `echo $fig | cut -d '.' -f1`.pdf"
    epspdf $fig
done