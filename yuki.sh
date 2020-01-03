#!/usr/bin/bash
#FellFreeToRecode
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
clear
BANNERS () {
printf "${lightgreen}==============================
         YUKINOSHITA
Http Code & Page title Checker
${white}         -Adelittle-${lightgreen}
==============================
"
}
BANNERS
OPTIONS () {
printf "${red}[>]${white} List      :${lightgreen} "
read list
printf "${red}[>]${white} Save As   :${lightgreen} "
read save
site=$(cat $list)
}
OPTIONS
printf "\n${lightgreen}Now Checking...\n\n"
for site in $(cat $list)
do
title=$(curl -kls -v --silent "${site}" 2>&1 | grep "<title>" | sed -n "s/<title>\(.*\)<\/title>/\1/Ip" );
httpcode=$(curl -s -m 3 -A "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:65.0) Gecko/20100101 Firefox/65.0" "${site}" -w %{http_code} -o /dev/null );
  printf "${white}[+]${site}\n ${BlueF} Http_Code:${lightgreen}  ${httpcode} ${BlueF}Page_Title:${lightgreen}${title}\n"
  echo "[+]Site: $site Http_Code:$httpcode Page_Title:$title" >> ${save}
done
printf "\n${lightgreen}Save as ${save}...\n\n"
