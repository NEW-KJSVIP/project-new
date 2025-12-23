import os
from dotenv import load_dotenv

load_dotenv(".env")

MAX_BOT = int(os.getenv("MAX_BOT", "100"))

DEVS = list(map(int, os.getenv("DEVS", "1496823926").split()))

API_ID = int(os.getenv("API_ID", "25805438"))

API_HASH = os.getenv("API_HASH", "a47c79aa127d0214ceb4cc7aaab578c6")

BOT_TOKEN = os.getenv("BOT_TOKEN", "7312972618:AAEWIMr7UV9-mIqA2UXulD8A5r22T2MX03E")

OWNER_ID = int(os.getenv("OWNER_ID", "1496823926"))

BLACKLIST_CHAT = list(map(int, os.getenv("BLACKLIST_CHAT", "-1002125842026 -1002053287763").split()))

RMBG_API = os.getenv("RMBG_API", "a6qxsmMJ3CsNo7HyxuKGsP1o")

MONGO_URL = os.getenv("MONGO_URL", "mongodb+srv://ibnumuzakim7:ibnumuzakim132@ibnumuzakim.sbwnig8.mongodb.net/")

LOGS_MAKER_UBOT = int(os.getenv("LOGS_MAKER_UBOT", "-4912568273"))
