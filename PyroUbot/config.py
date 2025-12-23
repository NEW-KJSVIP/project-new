import os
from dotenv import load_dotenv

# =========================================================
# MUAT VARIABEL LINGKUNGAN DARI FILE .env
# =========================================================
load_dotenv(".env")

# =========================================================
# PENGATURAN UMUM BOT & BATASAN
# =========================================================

# Batas maksimum Userbot yang diizinkan untuk berjalan secara bersamaan
MAX_BOT = int(os.getenv("MAX_BOT", "100")) 

# Daftar ID Pengguna Telegram yang memiliki hak akses sebagai Developer (DEVS)
# Nilai default: 1496823926
DEVS = list(map(int, os.getenv("DEVS", "1496823926").split()))

# ID Pengguna Telegram yang memiliki hak akses sebagai Pemilik (OWNER) utama sistem.
# Nilai default: 7885646574
OWNER_ID = int(os.getenv("OWNER_ID", "7885646574"))

# Daftar ID Chat/Grup yang dilarang/di-blacklist untuk diakses atau digunakan bot.
# Nilai default: -1002125842026 -1002053287763
BLACKLIST_CHAT = list(map(int, os.getenv("BLACKLIST_CHAT", "-1002125842026 -1002053287763").split()))

# ID Chat/Grup yang digunakan sebagai Channel Log/Pencatatan aktivitas penting Userbot.
# Nilai default: -4912568273
LOGS_MAKER_UBOT = int(os.getenv("LOGS_MAKER_UBOT", "-4912568273"))


# =========================================================
# KUNCI API TELEGRAM & BOT TOKEN
# =========================================================

# API ID yang diperoleh dari my.telegram.org (Wajib diisi di .env)
# Nilai default: 25805438
API_ID = int(os.getenv("API_ID", "25805438"))

# API HASH yang diperoleh dari my.telegram.org (Wajib diisi di .env)
# Nilai default: a47c79aa127d0214ceb4cc7aaab578c6
API_HASH = os.getenv("API_HASH", "a47c79aa127d0214ceb4cc7aaab578c6")

# Token Bot Utama (Bot Pendamping) dari @BotFather.
# Nilai default: 8197930111:AAH-XqBwT_6dR5ewr_BK8Hlv6NACSZnn2uA
BOT_TOKEN = os.getenv("BOT_TOKEN", "8197930111:AAH-XqBwT_6dR5ewr_BK8Hlv6NACSZnn2uA")


# =========================================================
# KUNCI API EKSTERNAL & DATABASE
# =========================================================

# Kunci API untuk layanan Remove Background (RMBG), digunakan untuk fitur penghapus latar belakang gambar.
# Nilai default: a6qxsmMJ3CsNo7HyxuKGsP1o
RMBG_API = os.getenv("RMBG_API", "a6qxsmMJ3CsNo7HyxuKGsP1o")

# URL Koneksi ke Database MongoDB (untuk penyimpanan data Userbot, sesi, dan settings).
# Nilai default: mongodb+srv://ibnumuzakim7:ibnumuzakim132@ibnumuzakim.sbwnig8.mongodb.net/
MONGO_URL = os.getenv("MONGO_URL", "mongodb+srv://ibnumuzakim7:ibnumuzakim132@ibnumuzakim.sbwnig8.mongodb.net/")