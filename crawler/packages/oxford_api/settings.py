# settings.py
from dotenv import load_dotenv
import os

# explicitly providing path to '.env'
from pathlib import Path  # Python 3.6+ only

env_path = Path('.') / '.env'
load_dotenv(dotenv_path=env_path)

# settings.py

APP_ID = os.getenv("APP_ID")
APP_KEY = os.getenv("APP_KEY")
