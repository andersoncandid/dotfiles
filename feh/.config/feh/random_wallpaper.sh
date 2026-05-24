#!/bin/sh

# Sets background wallpaper of X display :0 to a random JPG file chosen from
# the directory `~/Imagens`
DISPLAY=:0 feh --no-fehbg --bg-fill --randomize ~/Imagens/*.jpg
