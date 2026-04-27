FROM glitchtip/glitchtip

# Adiciona suporte ao Resend via HTTP (django-anymail)
RUN pip install --quiet django-anymail

COPY patch_settings.py /tmp/patch_settings.py
RUN python /tmp/patch_settings.py

# Wrapper que cria a tabela de cache antes de subir
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV PORT=8000
EXPOSE 8000

CMD ["/start.sh"]