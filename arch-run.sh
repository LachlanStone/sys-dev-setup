#!/usr/bin/env bash
# Define the Script Directory
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DEBUG=true
Desktop=false

set_color() {
    case "$1" in
        red) echo "$(tput bold && tput setaf 1)" ;;
        green) echo "$(tput bold && tput setaf 2)" ;;
        yellow) echo "$(tput bold && tput setaf 3)" ;;
        blue) echo "$(tput bold && tput setaf 4)" ;;
        *) echo "$(tput sgr0)" ;; # Default (No Color)
    esac
}

debug() {
  if [ "$DEBUG" = true ]; then
    echo "DEBUG: $1"
  fi
}
arch-required(){
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git
  pushd paru || exit
  makepkg -si
  popd || exit
}


arch-runs(){
  if command -v pacman &> /dev/null; then
    debug "$(set_color green) Starting Arch CLI Install $(set_color)"      
    runs_dir=$(find "$script_dir"/arch-runs -mindepth 1 -maxdepth 1 -executable)
    for components in $runs_dir; do
        $components
    done
  fi
}

arch-desktop(){
  if [ "$Desktop" = true ]; then
    if command -v pacman &> /dev/null; then
      debug "$(set_color green) Starting Arch Desktop Install $(set_color)"      
      runs_dir=$(find "$script_dir"/arch-desktop -mindepth 1 -maxdepth 1 -executable)
      for components in $runs_dir; do
          $components
      done
    fi
  fi   
}

arch-required
arch-runs
arch-desktop