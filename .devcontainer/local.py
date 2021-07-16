from pathlib import Path

# Version number
# This should correspond to the value in base.py. If not, check for updated settings or formats.
LOCAL_SETTINGS_VERSION = 1

# URLs
ROOT_URL = "api"  # Without leading slash (no root url: "")

# Static files
PUBLIC_ROOT = Path(__file__).resolve().parent.parent.parent / 'public'

# Security
SECRET_KEY_PATH = ""
ALLOWED_HOSTS = ['127.0.0.1', 'localhost', 'backend', '172.*']

# Database
DB_NAME = 'hemsidan_db'
DB_USER = 'fdev'
DB_PASSWORD = 'password'
DB_HOST = 'mariadb'
DB_PORT = '3306'

USE_DB_TEST_IN_DEBUG = False
DB_TEST_NAME = ''
DB_TEST_USER = ''
DB_TEST_PASSWORD = ''
DB_TEST_HOST = ''
DB_TEST_PORT = ''

# Email settings
EMAIL_BACKEND = "django.core.mail.backends.smtp.EmailBackend"
EMAIL_HOST = ""
EMAIL_USE_TLS = True
EMAIL_PORT = 587
EMAIL_HOST_USER = ""
EMAIL_HOST_PASSWORD = ""
DEFAULT_FROM_EMAIL = ""
SERVER_EMAIL = DEFAULT_FROM_EMAIL
