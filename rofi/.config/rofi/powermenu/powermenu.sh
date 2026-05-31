#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu

# Current Theme
dir="$HOME/.config/rofi/powermenu"
theme='powermenu'

# CMDs
host="$(hostname)"

shutdown=''
reboot=''
lock=''
suspend=''
logout=''

# Options with text
# shutdown=' Desligar'
# reboot=' Reiniciar'
# lock=' Bloquear'
# suspend=' Suspender'
# logout=' Encerrar'
# yes=' '
# no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-theme "${dir}/${theme}.rasi"
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg "$1" \
		-theme "${dir}/${theme}.rasi"
}

# Ask shutdown for confirmation
confirm_shutdown() {
	echo -e "$yes\n$no" | confirm_cmd ' Desligar?'
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
  if [[ $1 == '--shutdown' ]]; then
    systemctl poweroff
  elif [[ $1 == '--reboot' ]]; then
    systemctl reboot
  elif [[ $1 == '--suspend' ]]; then
    mpc -q pause
    amixer set Master mute
    systemctl suspend
  elif [[ $1 == '--logout' ]]; then
    if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
      openbox --exit
    elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
      bspc quit
    elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
      i3-msg exit
    elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
      qdbus org.kde.ksmserver /KSMServer logout 0 0 0
    fi
  fi
}

# Direct shutdown confirmation
if [[ "$1" == "--shutd" ]]; then
    selected="$(confirm_shutdown)"
  	if [[ "$selected" == "$yes" ]]; then
      systemctl poweroff
    else
    	exit 0
    fi
else
# Actions
chosen="$(run_rofi)"
  case ${chosen} in
      "$shutdown")
      run_cmd --shutdown
          ;;
      "$reboot")
      run_cmd --reboot
          ;;
      "$lock")
      if [[ -x '/usr/bin/light-locker' ]]; then
        light-locker-command -l
      elif [[ -x '/usr/bin/betterlockscreen' ]]; then
        betterlockscreen -l
      elif [[ -x '/usr/bin/i3lock' ]]; then
        i3lock
      fi
          ;;
      "$suspend")
      run_cmd --suspend
          ;;
      "$logout")
      run_cmd --logout
          ;;
  esac
fi
