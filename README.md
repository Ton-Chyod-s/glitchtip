# GlitchTip - Setup Local

Projeto GlitchTip configurado para usar banco de dados externo (Neon) e email via Gmail.

## Pré-requisitos

- Docker e Docker Compose instalados
- Rede Docker compartilhada criada:
  ```bash
  docker network create shared-net
  ```

## Configuração

### 1. Variáveis de Ambiente (.env)

Arquivo `.env` já foi criado com as configurações necessárias. Verifique:

- **DATABASE_URL**: Conectado ao banco Neon 
- **DEFAULT_FROM_EMAIL**: klayton.dias@hotmail.com
- **EMAIL_URL**: Requer configuração

### 2. Configurar Email Gmail

Para usar Gmail com GlitchTip:

1. Acesse: https://myaccount.google.com/apppasswords
2. Selecione **Aplicativo: Mail** e **Dispositivo: Windows (ou seu dispositivo)**
3. Google gerará uma senha de aplicativo (16 caracteres)
4. Copie a senha e atualize no `.env`:

```env
EMAIL_URL=smtp+ssl://klayton.dias@hotmail.com:COLOQUE_AQUI_A_SENHA@smtp.gmail.com:465
```

> **Importante**: Use a **App Password** do Gmail, não sua senha regular!

### 3. Executar o Projeto

```bash
# Iniciar GlitchTip
docker compose up -d

# Ver logs
docker compose logs -f web

# Parar
docker compose down
```

## Banco de Dados

- **Banco**: Neon (externa, servidor em São Paulo)
- **Conexão**: `postgresql://neondb_owner:...@ep-winter-cloud-acmvqv3u-pooler.sa-east-1.aws.neon.tech`
- **SSL**: Ativado (requerido pelo Neon)

> O banco local PostgreSQL está configurado com `profile: local` e não executará automaticamente.

## Acessar

Após iniciar, acesse: **http://localhost:8000**

## Arquivo Compose

- Postgres local (comentado) - use `docker compose --profile local up` para ativar
- Valkey/Redis (comentado) - descomente para cache
- Web (Principal) - conecta ao banco Neon
- Rede compartilhada: `shared-net` (externa)

## Segurança

Credenciais em `.env` (não commitado)  
`.env.example` para referência  
App Password do Gmail (melhor que senha regular)  
SSL/TLS ativado no banco Neon  

---

Qualquer dúvida, consulte: https://glitchtip.com/documentation
