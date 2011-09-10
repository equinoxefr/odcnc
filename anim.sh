#!/bin/sh
for i in *.png; do convert $i `basename $i .png`.gif ; done
gifsicle --delay=10 --loop --colors 256 frame*.gif > anim.gif
