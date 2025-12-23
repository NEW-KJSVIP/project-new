# 🔥 Userbot

Userbot ini dikembangkan untuk memberikan kemudahan dan fungsionalitas tambahan bagi pengguna Telegram. Nikmati berbagai fitur canggih langsung dari akun Anda!

![GitHub All Releases](https://img.shields.io/github/downloads/ricoogh/ubot/total) 
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🌟 Fitur Utama

* **Multifungsi:** Menawarkan berbagai perintah dan alat yang berguna.
* **Kecepatan Tinggi:** Dibangun di atas kerangka kerja yang ringan dan cepat.
* **Mudah Dikelola:** Dapat dijalankan di latar belakang menggunakan `screen`.

## ⚙️ Persyaratan Sistem

Pastikan sistem Anda memiliki alat dan dependensi berikut:
* Sistem Operasi berbasis Linux (Debian/Ubuntu direkomendasikan)
* Akses **root** atau **sudo**
* **Git**
* **FFmpeg**
* **Python 3.10+**

---

## 🚀 Panduan Instalasi Cepat

Ikuti langkah-langkah di bawah ini untuk menginstal dan menjalankan **Userbot** Anda.

### 1. Persiapan Sistem

```bash
# Update Sistem dan Instal Dependensi Dasar
apt update && apt upgrade -y
apt install ffmpeg -y
apt install python3.10-venv

# Kloning Repositori Proyek
git clone [https://github.com/ricoogh/ubot](https://github.com/ricoogh/ubot)

# Masuk ke Direktori
cd ubot

# Instal Node.js (Jika diperlukan oleh beberapa script/tool)
bash installnode.sh

# Buat dan Aktifkan Lingkungan Virtual (VENV)
python3 -m venv ubot
source ubot/bin/activate

# Instal Dependensi Python
pip3 install -r requirements.txt

# Salin dan Edit File Konfigurasi
cp sample.env .env
nano .env 
# Isi APP_ID, API_HASH, dll.

# Buat Sesi Screen Baru
screen -S ubot

# Jalankan Userbot
python3 -m PyroUbot
# Setelah bot berjalan, tekan CTRL+A lalu D untuk keluar (detach) dari sesi screen.

# Masuk ke Direktori Proyek
cd ubot

# Aktifkan VENV
source ubot/bin/activate

# Lanjutkan Sesi Screen (jika bot masih berjalan di latar belakang)
screen -r ubot 

# Jika bot mati di dalam screen, jalankan kembali:
python3 -m PyroUbot

# Pindah Direktori
cd ubotalfnew 

# Aktifkan VENV Khusus
python3 -m venv venv && source venv/bin/activate

# Lanjutkan Sesi Screen
screen -r ubotalfnew

# Jalankan Ulang Userbot
python3 -m PyroUbot