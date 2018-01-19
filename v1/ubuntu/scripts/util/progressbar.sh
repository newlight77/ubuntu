#!/bin/bash

##########################################################

ProgressBar1() {
        local loca=$1; local loca2=$2;
        declare -a bgcolors; declare -a fgcolors;
        for i in {40..46} {100..106}; do
                bgcolors+=("$i")
        done
        for i in {30..36} {90..96}; do
                fgcolors+=("$i")
        done
        local u=$(( 50 - loca ));
        local y; local t;
        local z; z=$(printf '%*s' "$u");
        local w=$(( loca * 2 ));
        local bouncer=".oO°Oo.";
        for ((i=0;i<loca;i++)); do
                t="${bouncer:((i%${#bouncer})):1}"
                bgcolor="\\E[${bgcolors[RANDOM % 14]}m \\033[m"
                y+="$bgcolor";
        done
        fgcolor="\\E[${fgcolors[RANDOM % 14]}m"
        echo -ne " $fgcolor$t$y$z$fgcolor$t \\E[96m(\\E[36m$w%\\E[96m)\\E[92m $fgcolor$loca2\\033[m\r"
}

TimeProgressBar1() {
        local loca="$1"; local loca2="$2";
        loca=$(bc -l <<< scale=2\;"$loca/50")
        for i in {1..50}; do
                progressbar1 "$i" "$loca2";
                sleep "$loca";
        done
        printf "\n"
}

##########################################################

function ProgressBar2 {
  # Process data
      let _progress=(${1}*100/${2}*100)/100
      let _done=(${_progress}*4)/10
      let _left=40-$_done
  # Build progressbar string lengths
      _fill=$(printf "%${_done}s")
      _empty=$(printf "%${_left}s")

  # 1.2 Build progressbar strings and print the ProgressBar line
  # 1.2.1 Output example:
  # 1.2.1.1 Progress : [########################################] 100%
  printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

function PourcentProgressBar2 {
  for number in $(seq 1 ${1})
  do
    sleep 1
    ProgressBar ${number} ${1}
  done
}

##########################################################

function ProgressBar3 {
  let _progress=(${1}*100/${2}*100)/100
  let _done=(${_progress}*4)/10
  let _left=40-$_done
  _fill=$(printf "%${_done}s")
  _empty=$(printf "%${_left}s")

  # Progress : [########################################] 100%
  printf "\rProgress : [${_fill// /#}${_empty// /-}] ${1} / ${2} seconds"
}

function TimeProgressBar3 {
  for number in $(seq 1 ${1})
  do
    sleep 1
    ProgressBar ${number} ${1}
  done
}


##########################################################

ProgressBar4() {
  local duration=${1}


    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  clean_line
}
