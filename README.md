# yno animes

Projeto independente para reconstruir no iOS a experiência do aplicativo Android Tomato Animes, com identidade própria **yno**.

> **Objetivo:** desenvolver um aplicativo nativo para iPhone, distribuído como IPA, priorizando compatibilidade com iPhone 6s Plus, iOS 15.8.8 e jailbreak Dopamine.

## Status atual

<details>
<summary>Estado do projeto</summary>

- [x] Repositório criado e documentação inicial preparada
- [x] Receber e identificar estruturalmente o APK de referência (análise estática; execução não verificada)
- [x] Definir uma base iOS com deployment target 15.0 e build arm64 em CI (ainda sem teste no aparelho)
- [x] Criar app UIKit com navegação inferior e diretório de fontes oficiais
- [x] Refazer a tela inicial e implementar biblioteca local com cadastro/status/remoção de títulos
- [x] Implementar busca externa de disponibilidade pelo JustWatch Brasil
- [x] Testar inclusão, deduplicação, alteração de status e remoção da biblioteca no CI
- [ ] Integrar catálogo de metadados autorizado, categorias e detalhes
- [ ] Integrar favoritos e histórico de reprodução a um catálogo/player autorizado
- [ ] Implementar player, legendas e controles
- [ ] Validar login e integrações permitidas
- [ ] Compilar, instalar e testar o IPA no dispositivo-alvo
- [ ] Revisar desempenho, acessibilidade e estabilidade

Nenhuma funcionalidade está marcada como concluída apenas por estar documentada. Os itens só serão concluídos após implementação e teste.

</details>

## Estado técnico atual (22/11/2026)

- App nativo UIKit/AVKit com abas início, buscar, biblioteca, fontes e ajustes.
- Tela inicial renovada com atalhos para fontes, busca e títulos selecionados.
- Biblioteca local permite cadastrar títulos manualmente e organizar por “quero assistir”, “assistindo”, “concluído” e “pausado”; testes de dados passaram no CI.
- Busca abre o JustWatch Brasil. Não há API de parceiro nem scraping.
- Diretório inclui páginas Mercado Play, playlists oficiais Crunchyroll Brasil/Anime Sato, Muse BR, Pluto TV, JustWatch e MANGA Plus; as fontes de vídeo abrem externamente.
- Build arm64 e dois pacotes IPA versão 0.1.0 (1) passaram no Xcode 16.4/GitHub Actions.
- IPA TrollStore fakesigned com ldid, pronto para ser importado pelo TrollStore; SHA-256: `f3aedbd61aefa9fd4b24e3a3081e320e05ea25dbaf3b517c15a17171075a5d96`.
- O pacote não tem certificado Apple/provisioning profile e ainda não foi instalado no iPhone real. A instalação no TrollStore permanece não verificada.
- O catálogo e os episódios não estão integrados ao player do ynoanimes. Os serviços da aba fontes abrem externamente.
- Resolução e bitrate não foram verificados por título; não prometer Full HD antes dos testes.

## Escopo planejado

- Interface escura inspirada nos fluxos observados no aplicativo de referência, sem copiar código ou recursos proprietários.
- Catálogo de animes e mangás, categorias, pesquisa e páginas de detalhes.
- Temporadas, episódios e histórico de reprodução.
- Favoritos e navegação inferior.
- Player com controles e suporte a legendas, conforme as fontes de vídeo autorizadas permitirem.
- Conta e sincronização somente por integrações oficiais/autorizadas.
- Distribuição de builds de teste em IPA, sem anúncios integrados pelo projeto.

## Dispositivo-alvo

| Item | Alvo |
|---|---|
| Dispositivo | iPhone 6s Plus |
| iOS | 15.8.8 |
| Jailbreak | Dopamine |
| Entrega | IPA instalável |

## Estrutura

- `docs/roadmap.md` — etapas e critérios de conclusão.
- `docs/architecture.md` — arquitetura e decisões técnicas.
- `docs/testing.md` — plano de testes e matriz de compatibilidade.
- `CHANGELOG.md` — histórico de alterações.

## Princípios

1. Compatibilidade real com o dispositivo-alvo.
2. Interface polida e consistente antes de expandir funcionalidades.
3. Não declarar recursos como prontos sem testes.
4. Não incluir anúncios próprios no aplicativo.
5. Não armazenar senhas, tokens, cookies ou chaves privadas no repositório.
6. Usar somente conteúdo, APIs e fontes de mídia que o usuário tenha direito de acessar.

## Importante

Este repositório é a documentação e o código do projeto **yno animes**. Não deve receber APKs de terceiros, bibliotecas proprietárias extraídas, episódios, legendas protegidas, credenciais ou outros materiais sem autorização. A compatibilidade e a disponibilidade de serviços externos precisam ser verificadas durante o desenvolvimento.

## Desenvolvimento

O projeto continua em desenvolvimento. A compilação e os testes de dados passaram no CI, mas a instalação no iPhone real, a revisão visual no aparelho e qualquer reprodução de episódios continuam pendentes. Consulte o [roadmap](docs/roadmap.md) para acompanhar o progresso.
