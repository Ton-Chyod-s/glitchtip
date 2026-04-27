FROM glitchtip/glitchtip

# Adiciona suporte ao Resend via HTTP (django-anymail)
RUN pip install --quiet django-anymail

COPY patch_settings.py /tmp/patch_settings.py
RUN python /tmp/patch_settings.py

ENV PORT=8000
EXPOSE 8000

CMD ["./bin/run-all-in-one.sh"]