# LabStudio CRJ

Sistema de agendamento e gestão do LabStudio CRJ FLEXAL.

O projeto possui:
- site público de agendamento;
- cadastro online para jovens;
- painel administrativo;
- bot WhatsApp com `whatsapp-web.js`;
- integração com Supabase.

## Instalar Dependências

```bash
npm install
```

## Configurar Variáveis De Ambiente

Crie um arquivo `.env` a partir do exemplo:

```bash
cp .env.example .env
```

No Windows PowerShell, você também pode usar:

```powershell
Copy-Item .env.example .env
```

Preencha o `.env` com os valores reais:

```env
PORT=3001
SUPABASE_URL=
SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
BOT_NOTIFY_NUMBER=
PUBLIC_SITE_URL=
ALLOWED_ORIGINS=
```

Nunca suba o `.env` para o Git.

### Service Role do Supabase

A variável `SUPABASE_SERVICE_ROLE_KEY` é obrigatória no servidor para as rotas internas de API, como:

- `GET /api/horarios`
- `POST /api/agendar`
- `POST /api/cadastro-online`

Essa chave permite que o `server.js` execute operações internas mesmo com RLS ativo no Supabase. Ela nunca deve ser colocada em `index.html`, `admin.html`, `cadastro.html` ou qualquer arquivo enviado ao navegador.

## Rodar Localmente

```bash
node server.js
```

URLs locais:

- `http://localhost:3001/`
- `http://localhost:3001/admin.html`
- `http://localhost:3001/cadastro.html`
- `http://localhost:3001/health`

## WhatsApp

Na primeira execução, o terminal pode mostrar um QR Code. Escaneie com o WhatsApp que será usado pelo bot.

A sessão local fica em `.wwebjs_auth/` e o cache em `.wwebjs_cache/`. Essas pastas não devem ser versionadas.

## Git

Fluxo básico:

```bash
git status
git add arquivo.html server.js
git commit -m "Mensagem do commit"
git push origin main
```

Antes de commitar, confira se não existem arquivos sensíveis:

```bash
git status --short
```

## Segurança

Não subir para o Git:

- `.env`
- `node_modules/`
- `.wwebjs_auth/`
- `.wwebjs_cache/`
- `tokens/`
- chaves, sessões ou credenciais reais

Use o `.env.example` apenas com exemplos sem dados sensíveis.
