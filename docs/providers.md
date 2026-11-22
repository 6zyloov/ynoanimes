# fontes de catálogo e reprodução — avaliação

**Última verificação documental:** 22/11/2026  
**Objetivo:** selecionar integrações que tenham documentação e permissão compatíveis com o ynoanimes. Acesso técnico a uma API não equivale a licença de uso dos dados, imagens ou episódios.

## Resultado principal

Ainda não foi encontrada uma fonte que autorize, ao mesmo tempo, o catálogo que o app precisa e a reprodução de episódios dentro de um aplicativo de terceiros. Catálogo de metadados e mídia licenciada são dependências distintas.

## Avaliação de candidatos

| Serviço | O que está documentado | Restrição identificada | Estado |
|---|---|---|---|
| Kitsu | API JSON:API de anime/mangá; a documentação descreve buscas, filtros, paginação e GETs públicos | Os Termos oficiais limitam o uso de conteúdo Kitsu fora da plataforma e dizem que o uso da API, quando permitido, fica sujeito a termos separados, disponíveis mediante solicitação | **bloqueado** até obter os termos específicos/autorização por escrito |
| AniList | API pública GraphQL para metadados | Os termos proíbem uso em serviços concorrentes não complementares, incluindo listas/tracking de anime e mangá; ynoanimes inclui favoritos e histórico | **bloqueado** sem autorização expressa |
| Jikan | API REST de metadados baseada em MyAnimeList; o software pode ser auto-hospedado | O mantenedor encerrou a instância pública em 01/10/2026; instância própria exige infraestrutura e análise de conformidade com as condições do projeto e do MyAnimeList | **bloqueado** como dependência pública; self-host não aprovado |
| TMDB | API de dados e imagens de filmes/séries; documentação exige atribuição | Uso gratuito limitado a projetos não comerciais com atribuição e aviso; uso comercial exige licença. Não fornece o arquivo do episódio | **parcial** — licença, cobertura de anime e adequação pendentes |
| YouTube IFrame Player | Player oficial pode incorporar vídeos do YouTube | Políticas proíbem download/cópia/offline sem autorização escrita e restringem agregação de dados; não é uma fonte genérica de episódios de anime licenciados | **parcial** — apenas vídeos oficiais autorizados, respeitando o player e as políticas |

## Fontes oficiais consultadas

### Kitsu
- API: https://hummingbird-me.github.io/api-docs/
- Termos: https://kitsu.io/terms
- A API documenta base `https://kitsu.io/api/edge`, JSON:API, filtros/paginação e que a maioria dos GETs públicos não requer autenticação.
- Os Termos publicados dizem que o conteúdo Kitsu não pode ser copiado/extraído ou usado separadamente da plataforma sem consentimento; a seção de uso aceitável diz que, quando Kitsu permite o uso da API, isso está sujeito a um conjunto separado de termos disponível mediante solicitação. A documentação pública da API não substitui essa autorização.

### AniList
- Introdução: https://docs.anilist.co/guide/introduction
- Termos: https://docs.anilist.co/guide/terms-of-use
- A API é publicamente acessível, mas os termos restringem seu uso em serviços concorrentes não complementares, incluindo trackers de anime/mangá. Como ynoanimes prevê favoritos e histórico, não integrar sem autorização escrita.

### Jikan
- Aviso oficial do mantenedor: https://github.com/jikan-me/jikan-rest/issues/613
- O mantenedor anunciou a descontinuação da API pública em 01/10/2026. O código do projeto é auto-hospedável, mas isso não transforma os dados de origem em conteúdo licenciado para redistribuição.

### TMDB
- FAQ oficial: https://developer.themoviedb.org/docs/faq
- A FAQ diz que o uso gratuito é para fins não comerciais e exige atribuição; aplicações comerciais precisam consultar a licença comercial. Exige exibir o logo e aviso de atribuição.

### YouTube
- Políticas oficiais: https://developers.google.com/youtube/terms/developer-policies/
- As políticas proíbem baixar, importar, armazenar cópias ou oferecer reprodução offline de conteúdo audiovisual sem aprovação prévia por escrito. Não extrair links diretos ou contornar o player.

## Decisão técnica

1. Manter `CatalogProvider` como interface substituível. Não fixar nenhum fornecedor até confirmar os termos.
2. Favoritos e histórico serão armazenados localmente pelo próprio ynoanimes e não dependerão de conta de terceiros.
3. O player pode ser desenvolvido e testado com arquivos HLS de teste próprios/licenciados, sem conectá-lo a episódios não autorizados.
4. Para reprodução real, aceitar somente um SDK/provedor que autorize explicitamente reprodução dentro de aplicativos de terceiros, ou URLs fornecidas pelo titular dos direitos.
5. Não reutilizar autenticação privada, cookies, tokens, chaves, assinaturas, endpoints internos ou controles de acesso do Tomato.
6. Não usar scraping, playlists de terceiros, links de player extraídos, ou APIs privadas não documentadas.

## Dependência externa indispensável

Para habilitar catálogo real e episódios, o responsável precisa indicar ou obter autorização de um fornecedor/titular que permita:
- uso dos metadados/imagens em aplicativo independente; e
- reprodução de episódios dentro do aplicativo, por SDK ou URLs autorizadas.

Sem essa autorização, é possível entregar um app de organização e descoberta com fontes autorizadas, mas não um streaming funcional com catálogo/episódios de terceiros.
