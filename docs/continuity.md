# continuidade — ynoanimes

**Atualizado:** 22/11/2026  
**Repositório:** https://github.com/6zyloov/ynoanimes  
**Prioridade:** obter uma fonte autorizada para metadados e episódios; depois implementar e validar o app completo.

## Identidade e alvo

- Nome: ynoanimes
- Plataforma: iPhone 6s Plus, iOS 15.8.8, Dopamine
- Implementação: Swift/UIKit + AVKit/AVPlayer
- Deployment target: iOS 15.0
- Bundle ID: `com.ynoez.ynoanimes`
- Visual: minimalista, preto prioritário, branco como contraste
- Entrega esperada: IPA compilado, assinado conforme o método de instalação e testado no aparelho real

## O que existe no repositório

- `ynoanimes/App.swift`: shell inicial UIKit com abas início/buscar/biblioteca/ajustes e tela base de AVPlayer.
- `ynoanimes/LibraryData.swift`: modelos iniciais, interface de fornecedor de catálogo ainda não configurada e persistência local de favoritos/progresso.
- `Tests/LibraryStoreSmokeTests.swift`: teste automatizado de favoritos e progresso.
- `ynoanimes.xcodeproj`: projeto Xcode para iOS 15+.
- `.github/workflows/ios-build.yml`: build/teste em macOS com Xcode e pacote IPA unsigned.
- `docs/reverse-engineering.md`: inventário estático da amostra Tomato.
- `docs/providers.md`: avaliação de provedores e restrições.
- `docs/roadmap.md` e `docs/testing.md`: planejamento e evidências de teste.

## Evidência de build

- Commit de código que compilou: `f89b69d3fe777e26b036863778ccc1230830afb3`.
- GitHub Actions run: `44992152325` — concluído com sucesso.
- Xcode: 16.4; build Release para generic iOS device/arm64.
- Smoke test: aprovado.
- IPA ZIP: gerado e validado com `unzip -t`.
- Bundle ID: `com.ynoez.ynoanimes`; MinimumOSVersion: `15.0`.
- SHA-256 do protótipo unsigned: `1d2b8d115b11bc5087781ea9bed968e1d951b803796f4b8fe1531d80f278ca33`.

**Esse IPA NÃO é uma versão pronta para instalação/uso:** foi gerado com assinatura desativada, contém somente o shell inicial, não tem catálogo real nem integração de episódios e não foi instalado no iPhone real. A versão do executável precisa ser refeita após alterações recentes de metadados/projeto.

## Engenharia reversa — limites

A análise estática identificou a estrutura Android/React Native, módulos de API, player, legendas e mangás, além de rotas em strings/classes. Nenhuma rota do Tomato foi chamada e a presença de rotas não autoriza sua reutilização. Não usar credenciais, cookies, tokens, assinaturas, endpoints privados ou controles de acesso extraídos do APK.

## Bloqueador externo atual

Ainda não há provedor confirmado que autorize:
1. uso de metadados e imagens dentro de app independente; e
2. streaming de episódios dentro do app.

- Kitsu: requer termos específicos/autorização para API; os Termos públicos restringem uso de conteúdo fora da plataforma.
- AniList: termos restringem serviços concorrentes de lista/tracking; autorização necessária.
- Jikan público: descontinuado em 01/10/2026.
- TMDB: pode servir a metadados sob licença adequada, mas não fornece episódios.
- YouTube: não é fonte genérica de episódios e tem restrições fortes sobre cópia/offline.

## Próxima ação

**Aguardar uma fonte/provedor/titular legítimo e sua documentação de integração e autorização.** Depois:
1. definir `CatalogProvider` concreto e testar chamadas permitidas;
2. implementar catálogo real, busca, detalhes, episódios e leitor;
3. ligar favoritos/histórico à interface;
4. validar AVPlayer com mídia própria/licenciada;
5. adicionar assinatura/instalação conforme método permitido;
6. executar testes no iPhone 6s Plus/iOS 15.8.8;
7. entregar somente quando instalação e fluxos reais estiverem verificados.

## Regra de classificação

Todo recurso recebe um estado: **implementado e testado**, **parcial**, **planejado**, **não verificado** ou **bloqueado**. Compilar ou gerar telas não é prova de funcionamento real.
