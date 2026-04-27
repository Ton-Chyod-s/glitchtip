FROM glitchtip/glitchtip

# Adiciona suporte ao Resend via HTTP (django-anymail)
RUN pip install --quiet django-anymail

COPY patch_settings.py /tmp/patch_settings.py
RUN python /tmp/patch_settings.py

# Wrapper: cria a tabela de cache no Postgres antes de subir o app.
RUN printf '#!/bin/sh\nset -e\npython manage.py createcachetable django_cache_table || true\nexec ./bin/run-all-in-one.sh\n' > /code/bin/start.sh \
 && chmod +x /code/bin/start.sh

ENV PORT=8000
EXPOSE 8000

CMD ["/code/bin/start.sh"]