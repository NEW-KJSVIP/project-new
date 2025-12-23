# 🔥 Project-New Userbot

Userbot ini dikembangkan untuk memberikan kemudahan dan fungsionalitas tambahan bagi pengguna Telegram. Nikmati berbagai fitur canggih langsung dari akun Anda!

![GitHub All Releases](https://img.shields.io/github/downloads/NEW-KJSVIP/project-new/total) 
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

### Instalasi Awal

```bash
apt update && apt upgrade -y             # Memperbarui daftar paket dan meng-upgrade sistem
git clone [https://github.com/NEW-KJSVIP/project-new](https://github.com/NEW-KJSVIP/project-new) # Kloning repositori proyek
cd project-new                           # Masuk ke direktori proyek
apt install ffmpeg -y                    # Instal FFmpeg (diperlukan untuk fitur media)
bash installnode.sh                      # Instal Node.js (jika diperlukan)
apt install python3.10-venv              # Instal paket untuk membuat Virtual Environment (VENV)
python3 -m venv venv && source venv/bin/activate # Buat VENV dan aktifkan
pip3 install -r requirements.txt         # Instal semua dependensi Python
cp sample.env .env && nano .env          # Salin file konfigurasi dan edit variabel (APP_ID, API_HASH, dll.)
screen -S ubot                           # Buat sesi screen baru bernama 'ubot'
python3 -m PyroUbot                      # Jalankan Userbot
# Setelah bot berjalan, tekan CTRL+A lalu D untuk keluar (detach) dari sesi screen.