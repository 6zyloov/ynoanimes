# yno animes

Projeto independente para reconstruir no iOS a experiência do aplicativo Android Tomato Animes, com identidade própria **yno**.

> **Objetivo:** desenvolver um aplicativo nativo para iPhone, distribuído como IPA, priorizando compatibilidade com iPhone 6s Plus, iOS 15.8.8 e jailbreak Dopamine.

## Status atual

<details>
<summary>Estado do projeto</summary>

- [x] Repositório criado e documentação inicial preparada
- [x] Receber e identificar estruturalmente o APK de referência (análise estática; execução não verificada)
- [x] Definir uma base iOS com deployment target 15.0 e build arm64 em CI (ainda sem teste no aparelho)
- [x] Criar shell inicial UIKit com navegação inferior e diretório de fontes oficiais
- [ ] Refinar interface e concluir todos os fluxos de navegação
- [ ] Implementar catálogo, busca, categorias e detalhes
- [x] Implementar a camada de dados local de favoritos e progresso (testada em CI)
- [ ] Integrar favoritos e histórico às telas
- [ ] Implementar player, legendas e controles
- [ ] Validar login e integrações permitidas
- [ ] Compilar, instalar e testar o IPA no dispositivo-alvo
- [ ] Revisar desempenho, acessibilidade e estabilidade

Nenhuma funcionalidade está marcada como concluída apenas por estar documentada. Os itens só serão concluídos após implementação e teste.

</details>

## Estado técnico atual (22/11/2026)

- App nativo UIKit/AVKit com abas início, buscar, biblioteca, fontes e ajustes.
- Favoritos e progresso locais implementados; smoke test passou no CI.
- Diretório de fontes atualizado com Mercado Play (atalhos Naruto, Death Note e Hunter x Hunter), Anime Sato, Muse BR, Pluto TV, Crunchyroll Brasil no YouTube, JustWatch e MANGA Plus.
- Build arm64 e IPA unsigned versão 0.1.0 (1) passaram no Xcode 16.4/GitHub Actions.
- Artefato baixado e inspecionado; o executável é arm64 e exige iOS 15.0 ou superior.
- O IPA não tem assinatura nem provisioning profile e não foi instalado no iPhone real. Não é versão final.
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

O projeto ainda está em fase inicial. Consulte o [roadmap](docs/roadmap.md) para acompanhar o progresso e as próximas etapas.
