#!/bin/bash
echo "Checking VPS"
#link izin ip vps
url_izin='https://raw.githubusercontent.com/rizkyckj/izin/master/izin'

#IP VPS
ip_vps=$(curl -sS ifconfig.me)

# Mendapatkan isi file izin.txt dari URL
izin=$(curl -s "$url_izin")

# Memeriksa apakah konten izin.txt berhasil didapatkan
if [[ -n "$izin" ]]; then
  while IFS= read -r line; do
    # Memisahkan nama VPS, IP VPS, dan tanggal kadaluwarsa
    nama=$(echo "$line" | awk '{print $1}')
    ipvps=$(echo "$line" | awk '{print $2}')
    tanggal=$(echo "$line" | awk '{print $3}')

    # Memeriksa apakah IP VPS saat ini cocok dengan IP VPS yang ada di izin.txt
    if [[ "$ipvps" == "$ip_vps" ]]; then
      echo "Nama VPS: $nama"
      echo "IP VPS: $ipvps"
      echo "Tanggal Kadaluwarsa: $tanggal"
      break
    fi
  done <<< "$izin"

  # Memeriksa apakah IP VPS ditemukan dalam izin.txt
  if [[ "$ipvps" != "$ip_vps" ]]; then
echo "acces denied 🔧 "
    exit 0
  fi
else
  echo "Konten izin.txt tidak berhasil didapatkan dari URL"
  exit 0
fi

mkdir -p /etc/lukman

bckup() {
clear
echo "================================================"
echo "                 BACKUP SETTING                 "
echo "================================================"
echo -ne "Input your Bot Token: "; read bot_token
echo -ne "Input your Chat ID: "; read chat_id
echo "================================================"

echo -n "$bot_token" > /etc/lukman/bot_token 
echo -n "$chat_id" > /etc/lukman/chat_id
echo "Done!"
read -p "Press enter to go back" -n 1; m-dns
}

clear
echo "================================================"
echo "                 BACKUP SETTING                 "
echo "================================================"
path="/etc/lukman/bot_token"
if [ -e "$path" ]; then
   echo "You already set the backup setting up!"
   echo -ne "Want to change the information instead? [Y/n]: "; read confirm
   if [[ "$confirm" = [Yy] ]]; then
      bckup
   else
      m-dns
   fi
else
   bckup
fi
