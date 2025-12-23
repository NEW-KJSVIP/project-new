#!/bin/bash

# ==========================================================
# [INIT] Konfigurasi Warna dan Variabel
# ==========================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Style Icons
OK="${GREEN}[+]${NC}"
INFO="${BLUE}[*]${NC}"
WARN="${YELLOW}[!]${NC}"
ERROR="${RED}[X]${NC}"

# Variables
REPO_OWNER="NEW-KJSVIP"
REPO_NAME="project-new"
REPO_URL="https://github.com/$REPO_OWNER/$REPO_NAME"
REPO_DIR="$REPO_NAME"
IP_FILE_PATH="izin/ip" # Path file izin/ip sesuai struktur repo
RAW_IP_URL="https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/main/$IP_FILE_PATH"

# Set Environment
export DEBIAN_FRONTEND=noninteractive
clear

# ==========================================================
# [BANNER] Tampilan Awal Keren (Tema KJS)
# ==========================================================
echo -e "${CYAN}========================================================${NC}"
echo -e "${WHITE}  _  _ ___ ___  _  _ ___ _  _  ___ ___ _  _ _  _ ___ ${NC}"
echo -e "${WHITE} | || | __| _ \ | \| | __| || ||_ _/ __| || | || | _ \ ${NC}"
echo -e "${WHITE} | __ | _||   / | .` | _|| __ | | | (__| __ | __ |   /${NC}"
echo -e "${WHITE} |_||_|___|_|_\_|\_/\_|___|_||_| |_|\___|_||_|_||_|_|_\\${NC}"
echo -e "${MAGENTA}                 :: INDONESIAN KJS VIP ::             ${NC}"
echo -e "${CYAN}========================================================${NC}"
echo -e "${INFO} Inisiasi Instalasi Userbot Project-New...${NC}"
echo -e "${CYAN}========================================================${NC}"

# ==========================================================
# [SECURITY CHECK] IP Whitelist Lock dari GitHub
# ==========================================================
echo -e "${INFO} Melakukan pengecekan IP Whitelist dari repositori...${NC}"
CURRENT_IP=$(curl -sS ipv4.icanhazip.com)

# 1. Download data IP dari GitHub
IP_DATA=$(curl -sS $RAW_IP_URL)

if [ $? -ne 0 ] || [ -z "$IP_DATA" ]; then
    echo -e "${ERROR} Gagal mengambil data IP dari GitHub. Cek koneksi atau path file ${IP_FILE_PATH}.${NC}"
    echo -e "${CYAN}========================================================${NC}"
    echo -e "${RED}INSTALASI TERKUNCI. File IP Whitelist tidak ditemukan/diakses.${NC}"
    echo -e "${CYAN}========================================================${NC}"
    exit 1
fi

# 2. Ekstrak hanya alamat IP dari data (Kolom terakhir)
# Menggunakan 'awk' untuk mengambil kolom terakhir (IP)
ALLOWED_IPS_LIST=$(echo "$IP_DATA" | awk '{print $NF}' | grep -v '^#')

# 3. Cek apakah IP saat ini ada dalam daftar yang diizinkan
if grep -q "^$CURRENT_IP$" <<< "$ALLOWED_IPS_LIST"; then
    echo -e "${GREEN}[ACCESS GRANTED]${NC} IP (${CURRENT_IP}) diizinkan. Melanjutkan instalasi."
else
    echo -e "${RED}[ACCESS DENIED]${NC} IP (${CURRENT_IP}) tidak terdaftar dalam Whitelist."
    echo -e "${CYAN}========================================================${NC}"
    echo -e "${RED}INSTALASI TERKUNCI. Hubungi Admin untuk otorisasi IP.${NC}"
    echo -e "${CYAN}========================================================${NC}"
    exit 1
fi
echo " " # Baris kosong untuk estetika

# 1. System Update & Install Dependencies
echo -e "${INFO} Memperbarui Sistem & Menginstal Alat Dasar...${NC}"
apt update -y && apt upgrade -y
apt install -y curl wget ffmpeg git python3.10-venv build-essential screen

# 2. Clone Userbot Repository
if [ -d "$REPO_DIR" ]; then
    echo -e "${ERROR} Direktori '$REPO_DIR' sudah ada. Hapus dan coba lagi!${NC}"
    exit 1
fi
echo -e "${INFO} Mengkloning Repositori dari $REPO_URL...${NC}"
git clone $REPO_URL

# Pindah ke direktori proyek
cd $REPO_DIR || { echo -e "${ERROR} Gagal masuk ke direktori proyek!${NC}"; exit 1; }

# 3. Setup Lingkungan
echo -e "${INFO} Menyiapkan Lingkungan Python dan Node.js...${NC}"
bash installnode.sh  # Instal Node.js
python3 -m venv venv # Buat VENV
source venv/bin/activate # Aktifkan VENV

# 4. Install Python Dependencies
echo -e "${INFO} Menginstal Dependensi Python...${NC}"
pip3 install -r requirements.txt

# 5. Setup .env file
echo -e "${WARN} Konfigurasi File .ENV. Masukkan APP_ID dan API_HASH!${NC}"
cp sample.env .env
nano .env

# 6. Start Userbot in a screen session
echo -e "${OK} Menjalankan Userbot di Sesi Screen (ubot)...${NC}"
screen -S ubot -d -m python3 -m PyroUbot

# ==========================================================
# [RESULT] Pesan Sukses dan Perintah Cepat
# ==========================================================
echo " "
echo -e "${CYAN}========================================================${NC}"
echo -e "${GREEN}✅ OPERASI BERHASIL! Userbot Siap Beroperasi! ${NC}"
echo -e "${CYAN}========================================================${NC}"
echo -e " "
echo -e "${YELLOW}### Console Commands Pantau Pengendalian Bot ###${NC}"
echo -e "--------------------------------------------------------"
echo -e "1. ${WHITE}cd $REPO_DIR${NC} && ${WHITE}source venv/bin/activate${NC}"
echo -e "   -> ${CYAN}Wajib: Masuk direktori dan aktifkan lingkungan sebelum kontrol.${NC}"
echo -e "2. ${WHITE}screen -r ubot${NC}"
echo -e "   -> ${CYAN}Akses Konsol/Log Bot.${NC}"
echo -e "3. ${WHITE}CTRL+A lalu D${NC}"
echo -e "   -> ${CYAN}Detas (Keluar) dari sesi screen tanpa mematikan Bot.${NC}"
echo -e "4. ${WHITE}screen -r ubot${NC} lalu tekan ${WHITE}CTRL+C${NC}"
echo -e "   -> ${CYAN}Mematikan Bot secara total.${NC}"
echo -e "--------------------------------------------------------"
echo -e "${MAGENTA}SALAM KJS INDONESIA! Jaga Keamanan Jaringan Anda.${NC}"
echo -e " "