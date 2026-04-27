FROM glitchtip/glitchtip

USER root

# Adiciona suporte ao Resend via HTTP (django-anymail)
RUN pip install --quiet django-anymail

COPY patch_settings.py /tmp/patch_settings.py
RUN python /tmp/patch_settings.py

# Wrapper que cria a tabela de cache antes de subir
COPY --chmod=755 start.sh /start.sh

USER app

ENV PORT=8000
EXPOSE 8000

CMD ["/start.sh"]