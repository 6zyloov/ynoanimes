# fontes de catálogo e reprodução — avaliação

**Data da verificação documental:** 22/11/2026  
**Objetivo:** escolher integrações documentadas e autorizadas para o ynoanimes. Não usar scraping de sites de streaming, extração de URLs de players, cookies de terceiros, listas IPTV ou fontes não licenciadas.

## Resultado principal

Catálogo de metadados e reprodução de episódios são problemas diferentes. Uma API de catálogo pode fornecer títulos, sinopses e imagens, mas isso não concede direitos para distribuir episódios nem uma URL de mídia que o AVPlayer possa reproduzir.

Ainda não há fonte de episódios autorizada e validada para o player interno. A implementação do player não deve ser ligada a fontes desconhecidas.

## Avaliação de candidatos

| Serviço | O que a documentação oferece | Limite / risco | Estado para o ynoanimes |
|---|---|---|---|
| Kitsu | API JSON:API; endpoints de anime/mangá; GET público em muitos recursos; busca e paginação | Termos de serviço/direitos de reutilização dos dados e imagens ainda precisam de confirmação; não oferece acesso geral a episódios licenciados | **parcial** — candidato técnico, não aprovado para integração |
| AniList | API pública GraphQL para dados de anime e mangá | Termos proíbem uso em serviços concorrentes não complementares de lista/tracker de anime ou mangá sem autorização; ynoanimes prevê favoritos e histórico | **bloqueado** até autorização escrita |
| Jikan | API REST não oficial baseada em MyAnimeList | Serviço público encerrado em 01/10/2026; o projeto menciona instâncias próprias, não testadas aqui | **bloqueado** como serviço público |
| TMDB | Metadados de filmes/séries e recursos de provedores por região | Uso gratuito apenas não comercial com atribuição e logotipo/aviso; uso comercial exige licença. Não fornece o arquivo de episódio | **parcial** — licença e adequação pendentes |
| YouTube IFrame Player | Player oficial incorporável em app; biblioteca auxiliar para iOS | Não permite baixar, guardar ou oferecer offline de conteúdo audiovisual via API; regras limitam agregação de dados de canais diferentes | **parcial** — possível apenas para vídeos oficiais/autorizados, incorporados conforme políticas |

## Fontes oficiais consultadas

### Kitsu
- Documentação: https://hummingbird-me.github.io/api-docs/
- API base documentada: https://kitsu.io/api/edge
- A documentação descreve endpoints GET de anime e suporte a busca por texto, filtragem, inclusão e paginação; muitos GET públicos não exigem autenticação.
- O link para Termos de Serviço existe, mas seu conteúdo não pôde ser validado nesta rodada. Não tratar a licença Apache 2.0 da documentação como licença automática dos dados, imagens ou conteúdo do catálogo.

### AniList
- Introdução: https://docs.anilist.co/guide/introduction
- Termos da API: https://docs.anilist.co/guide/terms-of-use
- Os termos declaram uso gratuito não comercial e restringem serviços concorrentes não complementares, incluindo listas/tracking de anime e mangá. Como o escopo de ynoanimes contempla favoritos e histórico, não integrar sem autorização expressa.

### Jikan
- Comunicado do mantenedor: https://github.com/jikan-me/jikan-rest/issues/613
- O serviço público foi descontinuado em 1º de outubro de 2026. Não construir dependência de produção no antigo host público.

### TMDB
- FAQ oficial: https://developer.themoviedb.org/docs/faq
- A FAQ exige atribuição, logotipo e aviso em uso não comercial; aplicações comerciais devem solicitar licença comercial. A disponibilidade de provedores de streaming não é uma licença para reproduzir o conteúdo.

### YouTube
- Políticas oficiais: https://developers.google.com/youtube/terms/developer-policies/
- Player/API iOS: https://developers.google.com/youtube/apis
- As políticas proíbem baixar ou armazenar cópias de conteúdo audiovisual sem aprovação escrita, bem como disponibilizar reprodução offline. O ynoanimes não deve extrair URLs de mídia do YouTube.

## Decisão de implementação

1. Manter `CatalogProvider` como interface substituível; não fixar Kitsu, AniList ou TMDB no modelo de domínio.
2. Não importar ou armazenar em massa catálogos/imagens até confirmar os termos e direitos de cada provedor.
3. A biblioteca pessoal (favoritos, histórico e continuar assistindo) deve ser armazenada localmente pelo próprio ynoanimes, independentemente do fornecedor de metadados.
4. Para mídia, aceitar somente:
   - um fornecedor licenciado que documente API/SDK de reprodução para terceiros; ou
   - URLs HLS/DASH diretas fornecidas pelo próprio detentor dos direitos e autorizadas para uso no aplicativo; ou
   - abrir a página/app oficial do serviço, sem tentar contornar seu player.
5. Nunca reutilizar sessão, endpoint privado, cookie, token, chave de assinatura ou URL interna extraída do Tomato.

## Dependência que precisará de decisão do responsável

Antes de habilitar reprodução dentro do app, é necessário identificar um catálogo de episódios cujo titular autorize expressamente a reprodução por terceiros. Sem isso, o player poderá ser implementado e testado com mídia de teste própria, mas não poderá ser considerado funcional para o catálogo real.
