from .base import *
import os

print("[\033[93mInfo\033[00m] Project is running in development mode.")

DEBUG = True
CSRF_COOKIE_HTTPONLY = True
CSRF_COOKIE_SECURE = False
SESSION_COOKIE_SECURE = False


ALLOWED_HOSTS = ['*']
INSTALLED_APPS += [
    'debug_toolbar',
    'corsheaders',
]

MIDDLEWARE += [
    'debug_toolbar.middleware.DebugToolbarMiddleware', 'corsheaders.middleware.CorsMiddleware'
]

CORS_ALLOWED_ORIGINS = [
    "http://localhost:80",
    "http://localhost:3000",
    "http://localhost:3001",
    "http://localhost:8080",
    "http://127.0.0.1:80",
    "http://127.0.0.1:3000",
    "http://127.0.0.1:3001",
    "http://127.0.0.1:8080",
]

INTERNAL_IPS = [
    '0.0.0.0',
    '127.0.0.1',
    'localhost'
]

if USE_DB_TEST_IN_DEBUG:
    DATABASES['default'] = {
        {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': DB_TEST_NAME,
            'USER': DB_TEST_USER,
            'PASSWORD': DB_TEST_PASSWORD,
            'HOST': DB_TEST_HOST,
            'PORT': DB_TEST_PORT
        }
    }

AUTH_PASSWORD_VALIDATORS = []

REST_FRAMEWORK.update({
    'COMPACT_JSON': False,
    'DEFAULT_METADATA_CLASS': 'rest_framework.metadata.SimpleMetadata'
})
