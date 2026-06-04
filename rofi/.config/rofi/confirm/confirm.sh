#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/confirm"
theme='confirm'

# Options
yes=' '
no=''

# Confirmation CMD
confirm_cmd() {
  rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 200px;}' \
    -theme-str 'mainbox {children: [ "message", "listview" ];}' \
    -theme-str 'listview {columns: 2; lines: 1;}' \
    -theme-str 'element {orientation: horizontal; children: [ "element-text" ];}' \
    -theme-str 'element-text {horizontal-align: 0.5; vertical-align: 0.5;}' \
    -theme-str 'textbox {horizontal-align: 0.5;}' \
    -dmenu \
    -p 'Confirmation' \
    -mesg 'Sair?' \
    -theme "${dir}"/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
  echo -e "$yes\n$no" | confirm_cmd
}

# Execute Command
run_cmd() {
  selected="$(confirm_exit)"
  if [[ "$selected" == "$yes" ]]; then
    i3-msg kill
  fi
    exit 0
}

run_cmd
