#!/usr/bin/env bash
# Define the Script Directory
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DEBUG=true
DESKTOP=false

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
  if command -v pacman &> /dev/null; then
    sh "$script_dir"/arch-defaults/defaults
    sh "$script_dir"/arch-defaults/dev
  fi
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
  if [ "$DESKTOP" = true ] || [ "$BOTH" = true ]; then
    if command -v pacman &> /dev/null; then
      debug "$(set_color green) Starting Arch Desktop Install $(set_color)"      
      runs_dir=$(find "$script_dir"/arch-desktop -mindepth 1 -maxdepth 1 -executable)
      for components in $runs_dir; do
          $components
      done
    fi
  fi   
}

arch-apps(){
  if [ "$APPS" = true ] || [ "$BOTH" = true ]; then
    if command -v pacman &> /dev/null; then
      debug "$(set_color green) Starting Arch Desktop Appts Install $(set_color)"      
      runs_dir=$(find "$script_dir"/arch-desktop-apps -mindepth 1 -maxdepth 1 -executable)
      for components in $runs_dir; do
          $components
      done
    fi
  fi   
}


# arch-required
# arch-runs
arch-desktop
arch-apps