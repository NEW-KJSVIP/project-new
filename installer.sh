#!/bin/bash

# ===============================================
# AUTO INSTALLER SCRIPT - PROJECT-NEW USERBOT
# Repository: https://github.com/NEW-KJSVIP/project-new
# ===============================================

# Set Environment & Colors
export DEBIAN_FRONTEND=noninteractive
GREEN="\e[92;1m"
RED="\033[1;31m"
FONT="\033[0m"
OK="${GREEN}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
REPO_URL="https://github.com/NEW-KJSVIP/project-new"
REPO_DIR="project-new"

echo -e "${OK} Memulai proses instalasi Project-New Userbot..."

# 1. System Update & Install Dependencies
echo -e "${OK} Memperbarui sistem dan menginstal dependensi dasar..."
apt update -y && apt upgrade -y
apt install -y curl wget ffmpeg git python3.10-venv build-essential screen

# 2. Clone Userbot Repository
if [ -d "$REPO_DIR" ]; then
    echo -e "${YELLOW} Direktori '$REPO_DIR' sudah ada. Melewati proses kloning.${FONT}"
else
    echo -e "${OK} Mengkloning repositori Userbot dari $REPO_URL..."
    git clone $REPO_URL
fi

# Pindah ke direktori proyek
cd $REPO_DIR || { echo -e "${ERROR} Gagal masuk ke direktori proyek."; exit 1; }

# 3. Install Node.js
echo -e "${OK} Menjalankan installnode.sh untuk Node.js..."
bash installnode.sh

# 4. Setup Python Virtual Environment (VENV)
echo -e "${OK} Membuat dan mengaktifkan Lingkungan Virtual Python (VENV)..."
python3 -m venv venv
source venv/bin/activate

# 5. Install Python Dependencies
echo -e "${OK} Menginstal dependensi Python dari requirements.txt..."
pip3 install -r requirements.txt

# 6. Setup .env file
echo -e "${OK} Menyiapkan file konfigurasi .env..."
cp sample.env .env
echo -e "${OK} Silakan edit file .env Anda sekarang untuk memasukkan APP_ID dan API_HASH!"
nano .env

# 7. Start Userbot in a screen session
echo -e "${OK} Menjalankan Userbot di sesi screen 'ubot'..."
# -S ubot: Nama sesi screen
# -d -m: Detach (berjalan di latar belakang)
screen -S ubot -d -m python3 -m PyroUbot

# 8. Display Success Message
echo " "
echo -e "========================================================="
echo -e "${GREEN}✅ Instalasi Userbot Selesai! ${FONT}"
echo -e "Userbot Anda sekarang berjalan di latar belakang (screen -S ubot)."
echo -e "Untuk melihat log atau mengakses sesi, gunakan: ${BLUE}screen -r ubot${FONT}"
echo -e "Untuk keluar dari sesi screen tanpa mematikan bot: ${BLUE}CTRL+A lalu D${FONT}"
echo -e "========================================================="