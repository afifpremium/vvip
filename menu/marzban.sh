#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 
###########- RVPN STORES -##########


clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}             ${WH}• WEB PANEL MENU •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH} INSTALL BOT SSH ( OFFLINE )${NC}                     $COLOR1 $NC"                                              
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH} SETTING ${NC}                              $COLOR1 $NC"
echo -e " $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH} MENU ${NC} $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                 ${WH}• RVPN STORES •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; apt update && apt install wget -y && wget https://raw.githubusercontent.com/rizkyckj/xolpanel/master/xolpanel.sh && chmod +x xolpanel.sh && ./xolpanel.sh ;;
02 | 2) clear ; m-system ;;
00 | 0) clear ; menu ;;
*) clear ; menu-backup ;;
esac
