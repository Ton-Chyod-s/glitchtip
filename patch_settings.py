patch = '''
# === Resend HTTP API support ===
import os as _os
_resend_key = _os.environ.get("RESEND_API_KEY")
if _resend_key:
    EMAIL_BACKEND = "anymail.backends.resend.EmailBackend"
    ANYMAIL = {"RESEND_API_KEY": _resend_key}
    _apps = list(INSTALLED_APPS)
    if "anymail" not in _apps:
        _apps.append("anymail")
    INSTALLED_APPS = _apps

# === Tira tudo do Redis/Upstash ===

# Celery: nao guarda resultado de task (GlitchTip nao usa)
CELERY_RESULT_BACKEND = None
CELERY_TASK_IGNORE_RESULT = True
CELERY_TASK_STORE_ERRORS_EVEN_IF_IGNORED = False

# Celery beat acorda menos vezes (default 5s)
CELERY_BEAT_MAX_LOOP_INTERVAL = 60

# Worker pega mais tasks por poll (menos roundtrips no broker)
CELERY_WORKER_PREFETCH_MULTIPLIER = 4

# Cache do Django no Postgres (em vez do Redis)
CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.db.DatabaseCache",
        "LOCATION": "django_cache_table",
    }
}

# Sessao no banco (garante que nao usa cache/redis pra sessao)
SESSION_ENGINE = "django.contrib.sessions.backends.db"
'''

with open('/code/glitchtip/settings.py', 'a') as f:
    f.write(patch)

print("Settings patched successfully")