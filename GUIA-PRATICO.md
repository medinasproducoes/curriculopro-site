# Guia Prático — CurrículoPro
*Checklist do estado atual do projeto e do que fazer daqui pra frente*

---

## PARTE 1 — CONFIGURAÇÃO INICIAL (status atual)

### ✅ 1. Dados legais na página institucional — CONCLUÍDO
Arquivo: `institucional.html`

Identificação preenchida como **Medina'S Produções** (pessoa física, sem CNPJ) em todas as seções (Política de Privacidade, Termos de Uso e rodapé).

### ✅ 2. Conta InfinitePay — CONCLUÍDO
Handle: **medina_pay** (mesma conta usada nos outros produtos do portfólio: Burnout em Silêncio e WhatsApp que Vende Todo Dia).

Não é necessário criar link de pagamento manual — o site gera o link automaticamente a cada compra (ver item 3).

### ✅ 3. Fluxo de pagamento automatizado — CONCLUÍDO
Arquivos: `netlify/functions/create-payment.js`, `verify-payment.js`, `webhook-infinitepay.js`, `netlify.toml`

O botão "Comprar Agora" do `index.html` não usa mais link fixo. Ele chama a function `create-payment.js`, que gera um link real via API da InfinitePay a cada clique (preço: R$ 9,90 = 990 centavos). Depois do pagamento, o cliente é redirecionado para `obrigado.html`, que verifica automaticamente via `verify-payment.js` e libera o acesso — sem intervenção manual.

### ✅ 4. WhatsApp de suporte — CONCLUÍDO
Arquivo: `obrigado.html` → `NUMERO_WHATSAPP_SUPORTE = '5545991359764'`

Mesmo número usado no WhatsApp que Vende Todo Dia. Usado apenas no fallback manual (ver Parte 2).

### ✅ 5. E-mail de suporte — CONCLUÍDO
Arquivos: `institucional.html`, `obrigado.html`

E-mail oficial: **curriculopro.site@gmail.com** — conta real, criada especificamente para este produto.

### ✅ 6. Repositório e publicação — EM ANDAMENTO
- Repositório GitHub: `medinasproducoes/curriculopro-site` — criado e com o primeiro commit já enviado (push confirmado)
- Netlify: **ainda não conectado** — próximo passo é importar este repositório no Netlify

### ⏳ 7. Confirmar URL final do site — PENDENTE
Arquivo: `netlify/functions/create-payment.js` → constante `SITE_URL`

Está com o valor previsto `https://curriculopro-site.netlify.app`. Depois de conectar ao Netlify, confirme se a URL gerada é exatamente essa — se o nome já estiver em uso, o Netlify pode sugerir um sufixo diferente (ex: `curriculopro-site-1.netlify.app`), e nesse caso a constante precisa ser atualizada.

Também pendente: `index.html` → meta tags `og:url` e `og:image` ainda usam o placeholder `SEUDOMINIO.com.br`, a atualizar com a URL real (ou o domínio próprio, quando registrado).

### ⏳ 8. Domínio próprio — PENDENTE (opcional)
Você mencionou intenção de registrar um domínio (ex: curriculopro.com.br) futuramente. Quando isso acontecer:
- Conectar o domínio nas configurações do Netlify
- Configurar encaminhamento de e-mail no domínio, se quiser usar um endereço `@curriculopro.com.br` de verdade
- Atualizar `SITE_URL` no `create-payment.js` e as meta tags `og:url`/`og:image` no `index.html`

**Atenção:** o domínio `curriculopro.site` já parece estar em uso por outro site de terceiros ("Meu Currículo Pro") — vale confirmar isso antes de registrar algo parecido, para evitar confusão de marca.

### ✅ 9. Teste final antes de divulgar — CHECKLIST
Depois de conectar ao Netlify e confirmar a URL (itens 6 e 7), acesse o site **publicado** (não o arquivo local) e confira:
- [ ] O botão "Comprar Agora" gera o link e abre o checkout real da InfinitePay
- [ ] Fazer um pagamento de teste (R$ 9,90 do seu próprio bolso, reembolsável) e conferir se `obrigado.html` reconhece o pagamento automaticamente e libera o botão "Acessar CurrículoPro Agora"
- [ ] Confirmar que o botão de acesso leva corretamente ao `app.html`
- [ ] Testar o app: preencher com dados de exemplo, trocar entre os 5 modelos, exportar em PDF e Word
- [ ] Testar no celular (a maioria dos clientes acessa por lá)
- [ ] Como plano B, testar também o fluxo manual: acessar `obrigado.html` sem parâmetros de pagamento na URL e confirmar que aparece o formulário de WhatsApp/e-mail (fallback)

---

## PARTE 2 — FALLBACK MANUAL (só se a verificação automática falhar)

Na grande maioria das vendas, o processo é 100% automático: o cliente paga, `obrigado.html` verifica sozinho e libera o acesso ao `app.html`. **Nenhuma ação sua é necessária.**

O fluxo manual abaixo só entra em cena se, por algum motivo técnico, a verificação automática não conseguir confirmar o pagamento (ex: instabilidade da API da InfinitePay). Nesse caso, o cliente cai automaticamente na tela de fallback, com um formulário para avisar você por WhatsApp ou e-mail.

### Se você receber um aviso manual
1. Abra o app da **InfinitePay** → "Vendas" ou "Extrato"
2. Confira se existe um pagamento com o mesmo valor (R$ 9,90) e nome/horário próximo ao da mensagem recebida
3. Confirmado o pagamento, responda a pessoa com o link de acesso:

> Olá, [Nome]! Recebemos seu pagamento com sucesso. 🎉
> Aqui está o link para criar seu currículo agora:
> 👉 [URL-DO-SITE]/app.html
>
> Qualquer dúvida, é só chamar por aqui!

4. Se não encontrar o pagamento correspondente, peça educadamente o comprovante (print do Pix) antes de liberar o acesso.

**Dica:** salve essa mensagem como resposta rápida no WhatsApp Business (Configurações → Ferramentas Comerciais → Respostas Rápidas).

---

## RESUMO — Onde cada coisa fica no código

| O que | Arquivo | Status |
|---|---|---|
| Nome/identificação da operadora | institucional.html | ✅ Medina'S Produções |
| Fluxo de pagamento | netlify/functions/*.js | ✅ Automatizado |
| WhatsApp de suporte (fallback) | obrigado.html → `NUMERO_WHATSAPP_SUPORTE` | ✅ 5545991359764 |
| E-mail de suporte | institucional.html, obrigado.html | ✅ curriculopro.site@gmail.com |
| Repositório GitHub | medinasproducoes/curriculopro-site | ✅ Criado e publicado |
| Conexão com Netlify | — | ⏳ Pendente |
| SITE_URL real | netlify/functions/create-payment.js | ⏳ Confirmar após deploy |
| og:url / og:image (SEO) | index.html | ⏳ Placeholder `SEUDOMINIO.com.br` |
| Domínio próprio | — | ⏳ Opcional, futuro |

---

*Dúvidas técnicas sobre qualquer um desses passos? Volte nesta conversa com o Claude e pergunte.*
