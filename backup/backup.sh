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

clear
#IP=$(wget -qO- ipinfo.io/ip);
domain=$(cat "/etc/xray/domain")
date=$(date +"%d-%m-%Y")
time=$(date +"%H-%M")

echo "Please wait, processing the backup"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/crontab backup/
#cp -r /var/lib/alexxa-pro/ backup/alexxa-pro
cp -r /etc/xray backup/xray
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r /root/backup/${domain}_${date}_${time}.zip backup > /dev/null 2>&1
sleep 2
echo "Please wait, preparing the backup (done)"; sleep 1

#============================================

echo "Sending to current telegram chat id"; sleep 2
python3 /etc/lukman/send.py
echo "Sending to current telegram chat id (done)"

read -p "Press enter to go back" -n 1; m-dns
