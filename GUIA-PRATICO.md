# Guia Prático — CurrículoPro
*Checklist do que fazer antes de publicar e do que fazer a cada venda*

---

## PARTE 1 — ANTES DE PUBLICAR (fazer 1 vez só)

### ✅ 1. Preencher seus dados legais na página institucional
Arquivo: `institucional.html`

Abra o arquivo com o bloco de notas (ou clique com botão direito → Editar) e use `Ctrl+F` para achar e substituir em TODOS os lugares que aparecem:

- `[RAZÃO SOCIAL / NOME DO RESPONSÁVEL]` → seu nome completo (se pessoa física) ou nome da empresa
- `[00.000.000/0001-00]` → seu CPF ou CNPJ

Aparece em 2 lugares: na Política de Privacidade (seção 2) e nos Termos de Uso (seção 1).

### ✅ 2. Criar o link de pagamento Pix
1. Baixe o app **InfinitePay** ou acesse o site deles
2. Crie uma conta (pessoa física serve para começar)
3. Vá em "Criar Link de Pagamento" (ou "Cobrar")
4. Configure: nome do produto ("Acesso CurrículoPro"), valor (ex: R$ 9,90), Pix habilitado
5. Copie o link gerado

### ✅ 3. Colar o link de pagamento no site
Arquivo: `index.html`

Use `Ctrl+F` para achar o comentário:
```
INSERIR LINK DE PAGAMENTO MERCADO PAGO (Pix/cartão) AQUI
```
Substitua o `href="#"` do botão "Comprar Agora" pelo link real da InfinitePay.

**Importante:** configure no painel da InfinitePay o redirecionamento pós-pagamento para a página `obrigado.html` do seu site já publicado.

### ✅ 4. Configurar seu WhatsApp de suporte
Arquivo: `obrigado.html`

Use `Ctrl+F` para achar:
```
const NUMERO_WHATSAPP_SUPORTE = '5511999999999';
```
Troque pelo seu número real, no formato: **55 + DDD + número, sem espaços, traços ou parênteses**.
Exemplo: se seu número é (11) 98888-7777, fica `5511988887777`.

### ✅ 5. Configurar seu e-mail de suporte
Arquivos: `index.html`, `institucional.html`, `obrigado.html`

Use `Ctrl+F` em cada arquivo e substitua todas as ocorrências de:
```
suporte@curriculopro.com.br
```
Pelo e-mail que você realmente vai usar para atender (pode ser seu Gmail pessoal, sem problema).

### ✅ 6. Publicar o site (grátis)
Recomendação: **Netlify** (o mais simples para iniciantes)

1. Acesse [netlify.com](https://netlify.com) e crie uma conta gratuita
2. Na tela inicial, procure a opção de arrastar uma pasta ("Deploy manually" / arraste os arquivos)
3. Arraste a pasta inteira `Criador de curriculo` (com todos os arquivos e a pasta `img`)
4. Aguarde a publicação — o Netlify te dá um link tipo `nome-aleatorio.netlify.app`
5. Se quiser um domínio próprio (ex: curriculopro.com.br), compre em registro.br e conecte nas configurações do Netlify

### ✅ 7. Atualizar a URL final no código
Arquivo: `index.html`

Use `Ctrl+F` e troque as duas ocorrências de:
```
https://SEUDOMINIO.com.br/
```
Pela URL real que o Netlify te deu (ou seu domínio próprio).

### ✅ 8. Teste final antes de divulgar
Acesse o site publicado (não o arquivo local) e confira:
- [ ] O botão "Comprar Agora" abre o checkout da InfinitePay
- [ ] Fazer um pagamento de teste (R$ 9,90 do seu próprio bolso, é reembolsável) e conferir se cai na página `obrigado.html`
- [ ] Clicar em "Enviar por WhatsApp" na página obrigado e ver se abre no SEU WhatsApp
- [ ] Clicar em "Enviar por E-mail" e ver se abre com o assunto/corpo corretos
- [ ] Testar o app: preencher com exemplo, trocar os 5 modelos, exportar PDF e Word
- [ ] Testar no celular (a maioria dos seus clientes virá de lá)

---

## PARTE 2 — TODA VEZ QUE ALGUÉM COMPRAR

### Passo 1 — Você recebe o aviso
A pessoa vai te mandar uma mensagem (WhatsApp ou e-mail) já pronta, parecida com isso:

> Olá! Acabei de comprar o CurrículoPro e gostaria de confirmar meu pagamento.
> Nome: Maria Silva
> E-mail: maria@email.com
> Valor pago: R$ 9,90

### Passo 2 — Você confere o pagamento
1. Abra o app da **InfinitePay**
2. Vá em "Vendas" ou "Extrato"
3. Confira se existe um pagamento com o mesmo valor e (se possível) o mesmo nome/horário próximo ao da mensagem recebida

### Passo 3 — Você libera o acesso
Confirmado o pagamento, responda a pessoa (pelo mesmo canal que ela usou) com uma mensagem parecida com esta:

> Olá, [Nome]! Recebemos seu pagamento com sucesso. 🎉
> Aqui está o link para criar seu currículo agora:
> 👉 [SEUDOMINIO.com.br/app.html]
>
> Qualquer dúvida, é só chamar por aqui!

**Dica:** salve essa mensagem como um "atalho de resposta rápida" no seu WhatsApp (em Configurações → Ferramentas Comerciais → Respostas Rápidas, se estiver usando o WhatsApp Business) para não precisar digitar toda vez.

### Passo 4 — Se não achar o pagamento
Caso não encontre o pagamento correspondente no InfinitePay, responda educadamente pedindo o comprovante (print do Pix), antes de liberar o acesso.

---

## RESUMO — Onde cada coisa fica no código

| O que | Arquivo | O que procurar (Ctrl+F) |
|---|---|---|
| Nome/CNPJ da empresa | institucional.html | `[RAZÃO SOCIAL` |
| Link de pagamento | index.html | `INSERIR LINK DE PAGAMENTO` |
| WhatsApp de suporte | obrigado.html | `NUMERO_WHATSAPP_SUPORTE` |
| E-mail de suporte | todos | `suporte@curriculopro.com.br` |
| URL do site (SEO) | index.html | `SEUDOMINIO.com.br` |

---

*Dúvidas técnicas sobre qualquer um desses passos? Volte nesta conversa com o Claude e pergunte.*
