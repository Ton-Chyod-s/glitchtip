patch = '''
# Resend HTTP API support
import os as _os
_resend_key = _os.environ.get("RESEND_API_KEY")
if _resend_key:
    EMAIL_BACKEND = "anymail.backends.resend.EmailBackend"
    ANYMAIL = {"RESEND_API_KEY": _resend_key}
    _apps = list(INSTALLED_APPS)
    if "anymail" not in _apps:
        _apps.append("anymail")
    INSTALLED_APPS = _apps
'''

with open('/code/glitchtip/settings.py', 'a') as f:
    f.write(patch)

print("Settings patched successfully")