# fontes de catálogo, streaming e licenciamento — ynoanimes

## 0. Melhor porta de entrada B2B encontrada — AniBiz

<badge>Prioridade máxima para investigar</badge>

- Plataforma oficial: https://anibiz.com/
- Portal para licensees: https://anibiz.com/lp/licensee
- Sobre e contato: https://anibiz.com/about
- Canal comercial publicado: `cs@anibiz.com`
- A plataforma se descreve como um marketplace B2B que conecta titulares de direitos de anime — estúdios, comitês de produção e empresas de gestão de direitos — a licensees qualificados. A página para licensees cita expressamente startups, distribuidores, criadores e game studios; também menciona aplicações/uso de anime IP em produtos e propostas de licença enviadas diretamente aos licensors.
- Em 27/10/2026, a Nakama anunciou que a AniBiz já reunia mais de 30 licensors e recebeu investimento estratégico de TBS Group, Toei Animation e TV TOKYO Holdings. A notícia diz que empresas do mundo todo, incluindo desenvolvedores de apps, podem se cadastrar gratuitamente e passar por verificação.
- **Modelo informado no portal:** perfil Basic gratuito; plano Pro anunciado a US$ 49/mês, com perfil verificado e até 5 pedidos de licença; plano VIP sob consulta. Não foi contratada nem paga nenhuma modalidade.

### Limite que precisa ser confirmado

AniBiz é a melhor porta de entrada para negociar direitos de anime IP, mas as páginas públicas consultadas não confirmam que a categoria de licença disponível inclui **direitos audiovisuais de streaming (SVOD/TVOD/AVOD) dentro de um app de terceiros**. A menção a startups e app developers não garante, por si só, direitos de episódio, arquivos de mídia, URLs HLS, DRM, legendas ou distribuição por iOS.

**Próximo passo comercial recomendado:** perguntar primeiro a `cs@anibiz.com` se os licensors da plataforma aceitam propostas de *audiovisual digital distribution / in-app streaming rights* para um aplicativo independente no Brasil. Só depois de uma resposta positiva faz sentido criar perfil, identificar títulos e submeter propostas. Não aderir ao Pro/VIP nem pagar sem aprovação explícita do responsável.

Perguntas obrigatórias ao marketplace/licensor:
1. A licença contempla reprodução de episódios completos dentro de app iOS independente, e não apenas uso de personagens/marca, merchandising ou promoção?
2. O território pode incluir Brasil e qual o prazo/janela?
3. Há master files, HLS/SDK ou API de playback fornecidos pelo titular, com legendas PT-BR e faixas de áudio?
4. Qual modelo comercial, royalties, mínimo garantido, reporting e limite de usuários?
5. Quais são as exigências de DRM, geoblocking, publicidade, classificação indicativa e auditoria?

**Classificação:** **planejado** — contato não enviado; conta não criada; categoria de streaming não confirmada; nenhum direito adquirido.

---

**Pesquisa atualizada:** 22/11/2026  
**Região inicial:** Brasil  
**Objetivo:** fontes legítimas para metadados, descoberta de onde assistir e, principalmente, direitos de reprodução de episódios dentro de um aplicativo iOS independente.

## Conclusão executiva

Há plataformas oficiais que o ynoanimes pode abrir externamente e há distribuidoras que aceitam consultas comerciais de licenciamento. **Ainda não foi encontrada uma API pública que conceda, por si só, o direito de incorporar e reproduzir episódios de anime dentro do ynoanimes.**

A solução imediata é um diretório de fontes oficiais com links externos. O player interno só poderá ser ligado a episódios quando um distribuidor/titular autorizar expressamente o aplicativo, o território Brasil, os dispositivos iOS e a modalidade de reprodução.

## 1. Fontes oficiais que o app pode abrir externamente

| Fonte | Utilidade real | Limite | Estado |
|---|---|---|---|
| Muse BR — YouTube | Canal identificado como oficial do Muse BR | Cada vídeo tem seu próprio território, idioma e janela de disponibilidade; link externo não concede direito de copiar ou embutir vídeo | **parcial** — link externo adicionado ao app; catálogo não sincronizado |
| Crunchyroll Brasil — YouTube | Canal verificado da Crunchyroll Brasil; publica trailers, clipes e alguns episódios/conteúdos especiais | Não equivale ao catálogo inteiro de episódios; não foi identificada API pública de reprodução para terceiros | **parcial** — link externo adicionado ao app |
| Crunchyroll — plataforma | Serviço oficial sob demanda | Plano, região e licenças variam; não foi confirmado SDK/API pública para fornecer reprodução dentro do ynoanimes | **parcial** — link externo adicionado ao app |
| Pluto TV Brasil | Serviço gratuito com anúncios, canais ao vivo e catálogo rotativo | A programação muda; os Termos proíbem reprodução/distribuição/compartilhamento do serviço ou conteúdo por terceiros sem consentimento expresso por escrito | **parcial** — link externo adicionado ao app; sem incorporação |
| JustWatch Brasil | Descobrir em que serviço legal um título está disponível no Brasil | Não transmite episódios. API de parceiro exige contrato, token e links/atribuição da marca JustWatch | **parcial** — link externo adicionado; API ainda não contratada |
| MANGA Plus by SHUEISHA | Leitura oficial de mangás, com conteúdo gratuito e opções conforme a obra | Conteúdo é fornecido pelo serviço da Shueisha; não há autorização de reutilizar páginas ou extrair o leitor para outro app | **parcial** — link externo adicionado ao app |

### Endereços oficiais

- Muse BR: https://www.youtube.com/@musebrtv
- Crunchyroll Brasil no YouTube: https://www.youtube.com/channel/UCVc-JLY3Db6-O48y7TS4N7Q
- Crunchyroll Brasil: https://www.crunchyroll.com/pt-br
- Pluto TV Brasil ao vivo: https://pluto.tv/br/live-tv
- JustWatch Brasil: https://www.justwatch.com/br
- MANGA Plus: https://mangaplus.shueisha.co.jp/

### Regras do YouTube para uma eventual integração

O player oficial do YouTube é uma possibilidade técnica de incorporação, não uma licença geral para construir um catálogo de episódios. As políticas exigem preservar a experiência normal do player, não retirar anúncios/recursos, não baixar ou armazenar cópias de conteúdo audiovisual e não oferecer reprodução offline. A política de agregação também restringe combinar dados de canais pertencentes a diferentes detentores; a exceção citada exige canais do mesmo proprietário de conteúdo reconhecido pelo YouTube em acordos de licenciamento e visualização restrita ao próprio proprietário.

**Decisão:** manter links externos para os canais oficiais nesta fase. Uma futura incorporação requer análise de conformidade da API e autorização específica do titular. Não fazer scraping de canais, extrair URLs internas nem usar players modificados.

## 2. Distribuidores e titulares para consultar sobre licenciamento OTT

Estes são os melhores caminhos encontrados para pedir direitos de conteúdo, não fontes abertas de episódios. Nenhuma autorização foi solicitada ou concedida nesta pesquisa.

### prioridade 1 — Sato Company (Brasil)

- Site: https://sato.tv.br/
- Contato oficial: https://sato.tv.br/fale-conosco/
- Telefone publicado: +55 11 4134-4455
- Endereço publicado: Al. Rio Negro, 1030, 8º andar, Office 801, Alphaville, Barueri, São Paulo, Brasil.
- A própria empresa declara atuar com distribuição de anime/tokusatsu, licenciamento, agregação e distribuição para cinema, TV e OTT nos modelos SVOD/TVOD/AVOD. Informa ainda que lançou SATO+ como canal VOD e FAST.
- **Pedido adequado:** consultar quais títulos têm direitos digitais disponíveis no Brasil e se oferecem licença de streaming para aplicativo independente de terceiros, com entrega de HLS/SDK, legendas, faixas de áudio, janelas, territórios, DRM e modelo de remuneração.
- **Classificação:** **planejado** — contato comercial não realizado; nenhuma licença ou API foi confirmada.

### prioridade 2 — Artworks Entertainment

- Site e catálogo: https://www.artworks-ent.com/pt
- Contato oficial: https://www.artworks-ent.com/pt/contact-us
- A empresa declara supervisionar distribuição linear e não linear de mais de 1.500 horas de conteúdo animado e live-action, distribuindo para plataformas de streaming e serviços on-demand. Afirma que equipes no Brasil, México, EUA e Japão gerenciam direitos em diferentes territórios.
- Seu catálogo público lista obras de anime como Attack on Titan (filmes compilatórios), Cardcaptor Sakura, Fairy Tail, Future Boy Conan, Kids on the Slope, Magical Angel Creamy Mami e Ranma 1/2.
- **Pedido adequado:** confirmar obra a obra se os direitos de SVOD/TVOD/AVOD para Brasil incluem apps de terceiros e se há pacote técnico de distribuição.
- **Classificação:** **planejado** — contato comercial não realizado; o catálogo público não é uma licença para usar os títulos.

### prioridade 3 — MUSE Communication

- Site institucional: https://www.e-muse.com/en/about-us/
- Consulta de licenciamento Film & Television: https://www.e-muse.com/en/media-contact/
- MUSE declara atuar como agente de direitos de mais de 30 parceiros de anime/mangá e trabalhar com serviços de internet, TV e plataformas OTT na Ásia. Seu formulário de Film & Television Licensing permite selecionar explicitamente “OTT Platform” e “Internet”.
- **Risco territorial:** a própria página descreve sua rede de distribuição principalmente na Ásia. É indispensável perguntar se MUSE representa os títulos pretendidos para Brasil/América Latina.
- **Pedido adequado:** licença digital de catálogo de anime para Brasil em aplicativo iOS de terceiros, com suporte de entrega e legendas em português.
- **Classificação:** **planejado** — formulário não enviado; disponibilidade territorial e direitos não verificados.

### prioridade 4 — Bandai Namco Filmworks

- Página institucional: https://www.bnfw.co.jp/en/
- Formulário oficial para oportunidades de negócios internacionais: https://support.bnfw.co.jp/support/contact/global
- A empresa possui rotas de contato específicas para uso de vídeos/streaming, além de negócios internacionais. O formulário internacional pede nome da empresa, site (aceita “N/A”), contato, obra, território e uma descrição do projeto; proposta/apresentação pode ser anexada.
- **Classificação:** **planejado** — consulta não enviada; direitos para qualquer obra/território precisam ser negociados.

### prioridade 5 — Kodansha Licensing

- Contato: https://licensing.kodansha.com/contact/
- Formulário de direitos de vídeo/animação: https://rights-form.kodansha.co.jp/VideoGoodsForms?language=en
- A Kodansha recebe consultas comerciais específicas para uso de vídeo de anime (filmes, episódios, clipes e trailers). Sua FAQ explica que direitos de quadrinhos e direitos da animação são distintos e que taxas dependem de mídia, duração, território e exclusividade. A política informa que, em regra, não licencia títulos para indivíduos.
- **Classificação:** **planejado / condicionado a negociação empresarial** — consultar apenas título e direitos específicos; não presumir que o formulário garante direitos OTT.

## 3. Fontes de metadados (não fornecem episódios)

| Fonte | O que oferece | Limite atual | Estado para produção |
|---|---|---|---|
| TMDB | API oficial para dados e imagens de filmes/séries; pode cobrir parte do catálogo de anime | Gratuito somente para usos não comerciais com atribuição e logo/aviso; uso comercial exige licença. Não concede direitos de episódios | **parcial** — candidato para metadados; chave e verificação da cobertura anime ainda pendentes |
| Kitsu | API JSON:API de anime/mangá, GET público, busca e paginação | Os Termos publicados restringem acesso/uso de conteúdo fora da plataforma sem autorização; uso da API pode depender de termos separados. A documentação pública não substitui essa autorização | **bloqueado** até confirmação escrita |
| AniList | API GraphQL de metadados e listas | Termos proíbem uso em serviços concorrentes não complementares, incluindo trackers/listas de anime e mangá; esse conflito atinge o escopo de biblioteca pessoal planejado para o ynoanimes | **bloqueado** sem autorização expressa |
| Tenrai | API pública não oficial baseada no catálogo público do MyAnimeList, com uso declarado para apps móveis | O próprio serviço afirma não ser afiliado ao MAL nem dono dos dados e oferece o conteúdo “as is”; os direitos da base e imagens não estão licenciados ao ynoanimes | **não verificado** — não usar como fonte de produção até esclarecer os direitos |
| Jikan público | API não oficial baseada no MyAnimeList | Instância pública encerrada em 01/10/2026 | **bloqueado** como serviço público |
| JustWatch Partner API | Ofertas de disponibilidade por provedor e links por país | Requer contrato e token de parceiro; é descoberta de onde assistir, não streaming | **parcial** — candidato mediante parceria |

### Documentação oficial

- TMDB FAQ: https://developer.themoviedb.org/docs/faq
- Kitsu JSON:API: https://hummingbird-me.github.io/api-docs/
- Kitsu Terms: https://kitsu.io/terms
- AniList Terms: https://docs.anilist.co/guide/terms-of-use
- Tenrai API docs: https://api.tenrai.org/documentation
- Jikan shutdown notice: https://github.com/jikan-me/jikan-rest/issues/613
- JustWatch Partner API: https://apis.justwatch.com/docs/api/

## 4. Arquitetura que será usada no ynoanimes

1. **Diretório oficial:** abrir plataformas/canais oficiais por Universal Link ou navegador. Essa camada já foi adicionada ao app como aba “fontes”.
2. **Catálogo:** manter `CatalogProvider` substituível. Só conectar um fornecedor depois de confirmar os direitos de metadados, imagens, cache, atribuição e uso em app independente.
3. **Disponibilidade por título:** avaliar a JustWatch Partner API mediante contrato para apresentar links oficiais por região.
4. **Player interno:** integrar AVPlayer apenas com URL HLS/DASH ou SDK fornecido/autorizado pelo titular. Não usar playlists, URLs raspadas, tokens, cookies ou endpoints internos do Tomato.
5. **Manga:** abrir MANGA Plus externamente enquanto não existir uma licença/API própria para leitura dentro do app.
6. **Teste:** usar mídia de teste própria/licenciada para desenvolver player e legendas antes de receber o pacote de conteúdo definitivo.

## 5. Bloqueador que realmente exige participação do responsável

Para liberar episódios no player interno, será necessário escolher um acordo/provedor e aceitar os termos comerciais, que podem envolver empresa, território, catálogo, quantidade de usuários, remuneração, DRM, publicidade e limites de distribuição. Nenhum segredo ou senha deve ser enviado no chat.

**Não é necessário o usuário procurar sites piratas nem fornecer endpoint do Tomato.** A próxima etapa é obter uma resposta comercial/documentação de um distribuidor/titular. Até lá, o app pode oferecer os links externos oficiais, mas o streaming interno permanece **bloqueado**.
