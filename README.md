# yno animes

Projeto independente para reconstruir no iOS a experiência do aplicativo Android Tomato Animes, com identidade própria **yno**.

> **Objetivo:** desenvolver um aplicativo nativo para iPhone, distribuído como IPA, priorizando compatibilidade com iPhone 6s Plus, iOS 15.8.8 e jailbreak Dopamine.

## Status atual

<details>
<summary>Estado do projeto</summary>

- [x] Repositório criado e documentação inicial preparada
- [x] Receber e identificar estruturalmente o APK de referência (análise estática; execução não verificada)
- [x] Definir uma base iOS com deployment target 15.0 e build arm64 em CI (protótipo mínimo; ainda sem teste no aparelho)
- [x] Criar shell UIKit com navegação inferior e diretório de fontes oficiais (**protótipo**, não port funcional)
- [x] Refazer a tela inicial e implementar biblioteca local com cadastro/status/remoção de títulos
- [x] Implementar busca externa de disponibilidade pelo JustWatch Brasil
- [x] Testar inclusão, deduplicação, alteração de status e remoção da biblioteca no CI
- [ ] Implementar catálogo integrado, categorias, detalhes, temporadas e episódios
- [ ] Integrar favoritos e histórico de reprodução a um catálogo/player autorizado
- [ ] Implementar player real, legendas, seleção de faixas, velocidade, seek e PiP
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
- O workflow gerou um IPA de protótipo com 87.311 bytes; isso prova somente que o shell UIKit compila e que o empacotamento TrollStore funciona.
- **Esse IPA não é a entrega nem um port funcional do Tomato.** Não contém catálogo integrado, temporadas/episódios, player, conta, comentários, mangá ou recursos equivalentes.
- O APK original mede 99.167.557 bytes e inclui React Native/Hermes, sete DEX, 84 bibliotecas nativas em quatro ABIs, bundle JS e milhares de recursos.
- O IPA iOS não precisa ter o mesmo tamanho do APK Android, mas precisa conter os módulos e recursos reais do app. O pacote atual não os contém.
- Auditoria completa e plano corrigido: [docs/auditoria-escopo.md](docs/auditoria-escopo.md).
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

O pacote de 87 KB é classificado apenas como **protótipo de interface/prova de compilação**. Não instalar esperando a experiência Tomato. Não apresentar esse arquivo como versão pronta, clone ou engenharia reversa concluída. A reconstrução funcional continua pendente.

## Importante

Este repositório é a documentação e o código do projeto **yno animes**. Não deve receber APKs de terceiros, bibliotecas proprietárias extraídas, episódios, legendas protegidas, credenciais ou outros materiais sem autorização. A compatibilidade e a disponibilidade de serviços externos precisam ser verificadas durante o desenvolvimento.

## Desenvolvimento

O projeto continua em desenvolvimento. A compilação e os testes de dados passaram no CI, mas a instalação no iPhone real, a revisão visual no aparelho e qualquer reprodução de episódios continuam pendentes. Consulte o [roadmap](docs/roadmap.md) para acompanhar o progresso.
