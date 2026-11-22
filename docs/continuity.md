# continuidade — ynoanimes

**Atualizado:** 22/11/2026  
**Repositório:** https://github.com/6zyloov/ynoanimes  
**Prioridade:** avançar o app sem depender de endpoints privados; negociar direitos de catálogo e episódios com distribuidores oficiais.

## Identidade e alvo

- Nome: ynoanimes
- Plataforma: iPhone 6s Plus, iOS 15.8.8, Dopamine
- Implementação: Swift/UIKit + AVKit/AVPlayer
- Deployment target: iOS 15.0
- Bundle ID: `com.ynoez.ynoanimes`
- Visual: minimalista, preto prioritário, branco como contraste
- Entrega final esperada: IPA compatível, assinado pelo método de instalação escolhido e testado no aparelho real.

## O que existe no repositório

- `ynoanimes/App.swift`: shell UIKit com abas início, buscar, biblioteca, fontes e ajustes; busca encaminha para o JustWatch Brasil; diretório de fontes com páginas Mercado Play, playlists oficiais da Crunchyroll Brasil e Anime Sato, Muse BR, Pluto TV e MANGA Plus. Todos os vídeos/serviços abrem externamente.
- `ynoanimes/LibraryData.swift`: persistência local de favoritos e progresso; integração de metadados removida até haver autorização compatível.
- `Tests/LibraryStoreSmokeTests.swift`: teste automatizado de favoritos e progresso.
- `ynoanimes.xcodeproj`: projeto Xcode para iOS 15+, Bundle ID e versão 0.1.0 (1).
- `.github/workflows/ios-build.yml`: testes/build em macOS com Xcode; CI de push limitado a alterações de código e workflow manual disponível.
- `docs/reverse-engineering.md`: inventário estático da amostra Tomato.
- `docs/providers.md`: plataformas oficiais, distribuidores e canais de licenciamento.
- `docs/roadmap.md`, `docs/testing.md` e este arquivo: planejamento e evidências.

## Evidência de build mais recente

- GitHub Actions run: 45039011842 — **sucesso**.
- Link: https://github.com/6zyloov/ynoanimes/actions/runs/45039011842
- Commit do código compilado: 365c81607a884b22145fea179a2c3de8479ca926.
- Xcode Release para generic iOS device/arm64; smoke test local aprovado.
- Artefato IPA unsigned: 14761026014, expira em 06/12/2026.
- ZIP e IPA passaram no teste de integridade; Info.plist e binário arm64 conferidos.
- Bundle ID: com.ynoez.ynoanimes; nome: yno animes; versão/build: 0.1.0 (1); MinimumOSVersion: 15.0; dispositivo iPhone.
- SHA-256 do IPA unsigned: b3f6d814da993d1ee81943199284e6521cdedb5df6452f0923dc9ed7ae714f95.

**Limite:** esse artefato ainda é protótipo. Sem assinatura/provisioning, sem instalação em iPhone real, sem catálogo interno e sem teste de playback ou qualidade por título. Não chamar de IPA final.

## Fontes encontradas

### Fontes de vídeo/leitura que podem ser abertas externamente

- Muse BR — https://www.youtube.com/@musebrtv
- Crunchyroll Brasil (YouTube) — https://www.youtube.com/channel/UCVc-JLY3Db6-O48y7TS4N7Q
- Crunchyroll — https://www.crunchyroll.com/pt-br
- Pluto TV Brasil — https://pluto.tv/br/live-tv
- JustWatch Brasil — https://www.justwatch.com/br (localiza onde assistir; não fornece episódios)
- MANGA Plus — https://mangaplus.shueisha.co.jp/ (abrir o serviço oficial; não extrair páginas)

Esses links estão no diretório da aba “fontes”. Eles **não** conferem direitos para copiar, incorporar ou reproduzir o conteúdo dentro do ynoanimes.

### Prioridade para licenciamento OTT

1. **AniBiz — prioridade máxima para investigação.** Marketplace B2B oficial de anime IP que reúne licensors e permite startups/app developers criarem perfil e apresentarem propostas diretamente a titulares. Mais de 30 licensors e investimento anunciado por TBS Group, Toei Animation e TV TOKYO em 27/10/2026. Perfil Basic gratuito; Pro anunciado a US$ 49/mês (não contratar sem aprovação). Site: https://anibiz.com/ ; portal licensees: https://anibiz.com/lp/licensee ; contacto público: cs@anibiz.com. **Não está confirmado que oferece direitos audiovisuais de streaming para apps externos** — perguntar antes sobre SVOD/TVOD/AVOD, território Brasil, HLS/SDK, DRM e legendas. Os Termos dizem que AniBiz não verifica titularidade/cadeia de direitos/território, não é parte no acordo e que só o contrato separado entre as partes cria a licença; exige 18+ e capacidade legal para contratar. Fazer due diligence direta do titular antes de qualquer pagamento ou integração: https://anibiz.com/legal/terms-of-service.
2. Sato Company — Brasil, anime/tokusatsu, agregação e distribuição OTT SVOD/TVOD/AVOD. Contato público: https://sato.tv.br/fale-conosco/ ; telefone publicado: +55 11 4134-4455.
3. Artworks Entertainment — catálogo de animação/anime e operação de distribuição linear e não linear; contato: https://www.artworks-ent.com/pt/contact-us.
4. MUSE Communication — formulário Film & Television aceita consultas “OTT Platform” e “Internet”; confirmar território Brasil/América Latina: https://www.e-muse.com/en/media-contact/.
5. Bandai Namco Filmworks — formulário de negócios internacionais: https://support.bnfw.co.jp/support/contact/global.
6. Kodansha Licensing — formulário específico para vídeo/animação, condicionado à disponibilidade por título e território: https://rights-form.kodansha.co.jp/VideoGoodsForms?language=en.

**Nenhum contato comercial foi enviado e nenhuma licença foi concedida.** Consultas devem pedir direitos de SVOD/TVOD/AVOD para app independente no Brasil, entrega HLS/SDK, legendas/faixas de áudio, DRM, janelas, território, limites de usuários e modelo comercial. Mais detalhes e fontes em `docs/providers.md`.

## Restrições técnicas e de segurança

- Não reutilizar tokens, cookies, credenciais, assinaturas, endpoints privados ou controles de acesso do Tomato.
- Não fazer scraping de sites de streaming, extrair URLs internas de players nem usar playlists de terceiros.
- YouTube, Pluto TV e MANGA Plus ficam como links externos até existir autorização clara para a modalidade de incorporação.
- Metadados também precisam de licença/termos compatíveis; catálogo não concede direitos de episódios.
- JustWatch Partner API exige contrato/token e serve à disponibilidade/links, não fornece mídia.
- O player AVPlayer deve usar somente mídia HLS/DASH própria ou fornecida por titular/provedor com autorização explícita.

## Próximas ações

1. Manter a base UIKit e corrigir problemas visuais/funcionais sem recomeçar do zero.
2. Priorizar a experiência de orçamento zero com fontes externas oficiais: Mercado Play, Anime Sato, Muse BR e Pluto TV; usar títulos diretos só enquanto a página oficial indicar gratuito.
3. Consultar AniBiz gratuitamente primeiro para confirmar se consegue negociar direitos audiovisuais de streaming; não contratar Pro/VIP sem aprovação.
4. Preparar consultas comerciais para Sato Company e Artworks, e em paralelo MUSE se os direitos cobrirem Brasil.
5. Continuar a integração local de favoritos e histórico às telas.
6. Desenvolver AVPlayer com mídia de teste própria/licenciada e validar legendas suportadas.
7. Só conectar catálogo, imagens e episódios depois da confirmação escrita dos direitos.
8. Configurar assinatura/instalação compatível com Dopamine e testar no iPhone 6s Plus/iOS 15.8.8.
9. Entregar apenas quando a instalação e os fluxos reais estiverem verificados.

## Regra de classificação

Todo recurso deve ser classificado como **implementado e testado**, **parcial**, **planejado**, **não verificado** ou **bloqueado**. Build, link, tela ou documentação isolados não provam funcionamento real.


## Estado de continuidade — 22/11/2026 (atualização)

- A busca interna que consultava AniList foi removida. A classificação de conformidade já indicava bloqueio sem autorização para um app independente; não manter chamada API ativa sem permissão escrita.
- A aba buscar agora abre a busca pública do JustWatch Brasil com o termo informado. A rota foi verificada externamente com a consulta Naruto; isso não equivale a uma integração de API nem a teste dentro do iPhone.
- A aba fontes agora inclui atalhos diretos para a playlist oficial da Crunchyroll Brasil (227 vídeos listados na consulta, episódios selecionados; temporadas completas podem exigir assinatura) e para a playlist Anime Sato em português (12 episódios identificados).
- Foram adicionadas páginas Mercado Play para Special A, Inazuma Eleven — Os Estrangeiros Estão Aqui e Beyblade Burst — Na Escuridão! Dark Doomscizor!. O índice oficial as listou como grátis; a leitura automatizada das páginas falhou, então disponibilidade atual e idioma continuam parciais/não verificados.
- Muse BR permanece como canal oficial, mas não foi localizada nesta rodada uma playlist de episódios completos em português; não anunciar como catálogo gratuito confirmado.
- O provedor AniList e os modelos de busca associados foram removidos de LibraryData.swift; PlaybackProgress e LibraryStore foram preservados. O teste de favoritos/progresso passou no CI para o commit 367570e4a7cebc31f46a87beca5fe1b1a1801906.
- Alterações posteriores adicionaram links adicionais de fontes em App.swift; o workflow ios-build do commit 365c81607a884b22145fea179a2c3de8479ca926 está em execução na hora desta atualização.
- A rota JustWatch testada foi https://www.justwatch.com/br/busca?q=Naruto; a página retornou resultados de busca e opções de disponibilidade no Brasil.

**Evidência atualizada do build:** workflow ios-build run 45039011842 — sucesso em 22/11/2026 para o commit 365c81607a884b22145fea179a2c3de8479ca926. Teste de LibraryStore aprovado; Xcode Release generic iOS/arm64 aprovado; IPA empacotado. Artefato GitHub Actions 14761026014, expira em 06/12/2026. ZIP e IPA passaram em unzip/test; Info.plist confirma Bundle ID com.ynoez.ynoanimes, display name yno animes, versão 0.1.0 (1), MinimumOSVersion 15.0 e iPhone. Binário Mach-O 64-bit arm64. SHA-256 do IPA: b3f6d814da993d1ee81943199284e6521cdedb5df6452f0923dc9ed7ae714f95.

**Limite mantido:** o pacote não contém _CodeSignature nem embedded.mobileprovision; permanece unsigned e não está pronto para instalação normal. Não houve instalação em iPhone real nem teste visual ou de playback.
