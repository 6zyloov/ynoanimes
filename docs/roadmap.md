# roadmap — yno animes

Atualizado em 22/11/2026.

## fase 0 — referência e estrutura

- [x] Receber e inventariar APK por análise estática.
- [x] Criar projeto iOS UIKit com deployment target 15.0.
- [x] Criar shell escuro com abas.
- [x] Criar diretório de links oficiais externos.
- [ ] Capturar e catalogar fluxos visuais do Tomato com referência legítima.

## fase 1 — fontes com orçamento zero

- [x] Identificar Mercado Play e páginas gratuitas de Naruto, Death Note e Hunter x Hunter.
- [x] Identificar canal oficial gratuito Anime Sato.
- [x] Identificar canal oficial Muse BR.
- [x] Identificar categoria anime grátis da Pluto TV Brasil.
- [x] Atualizar diretório de fontes no app.
- [ ] Verificar individualmente disponibilidade, idioma, áudio e qualidade máxima dos títulos no iPhone.
- [ ] Adicionar busca de disponibilidade por título usando fontes permitidas.
- [ ] Verificar se há programa de incorporação oficial sem custo (ex. YouTube IFrame Player) que se adeque às políticas do serviço.
- [ ] Não contratar serviços pagos nem APIs pagas sem aprovação.

## fase 2 — catálogo e descoberta

- [ ] Definir provedor de metadados com autorização expressa para uso em app independente/comercial; até lá, manter busca externa pelo JustWatch e não consultar AniList/Kitsu sem permissão.
- [ ] Implementar pesquisa, categorias, detalhes e links de “assistir oficialmente”.
- [ ] Persistir favoritos e histórico com UI conectada.
- [ ] Implementar catálogo separado por fonte, idioma e tipo (on-demand/linear).
- [ ] Indicar de forma clara quando o título é grátis, exige assinatura ou tem disponibilidade regional.

## fase 3 — player e leitor

- [x] Criar base AVPlayer, ainda sem fonte de mídia real.
- [ ] Desenvolver player com mídia própria/licenciada de teste.
- [ ] Verificar opção de player oficial incorporável (YouTube) sem tirar anúncios, controles, legendas ou recursos do serviço.
- [ ] Não extrair links de streaming de páginas, players ou apps de terceiros.
- [ ] Não usar AVPlayer para reproduzir streams de sites sem autorização.
- [ ] Incluir suporte a legendas apenas nos formatos fornecidos/autorizados pela fonte.

## fase 4 — qualidade e dispositivo-alvo

- [ ] Definir qualidade mínima por título: preferir 1920×1080 real; não fazer upscale artificial.
- [ ] Validar bitrate, proporção, áudio, sincronização de legendas e buffering.
- [ ] Testar Wi-Fi/4G e retomada de reprodução.
- [ ] Testar UI e desempenho no iPhone 6s Plus/iOS 15.8.8.
- [ ] Configurar assinatura/instalação compatível com Dopamine e testar IPA.

## bloqueadores

- Reprodução própria de episódios exige autorização do titular ou SDK/player de integração explicitamente permitido.
- A gratuidade do conteúdo para o espectador não concede direitos ao ynoanimes para copiar/retransmitir/incorporar.
- Os serviços pagos (Crunchyroll sob demanda, AniBiz Pro/VIP, APIs comerciais) não serão contratados sem autorização expressa.

## regra

Marcar como **implementado e testado**, **parcial**, **planejado**, **não verificado** ou **bloqueado**. Link externo, tela ou build não prova playback funcional.
