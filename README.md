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

- Base nativa UIKit/AVKit criada em `ynoanimes/`, com abas início, buscar, biblioteca, fontes e ajustes.
- Favoritos e progresso local implementados com `UserDefaults` e codificação JSON; smoke test aprovado no macOS CI.
- Diretório de fontes oficiais abre Muse BR, Crunchyroll, Pluto TV, JustWatch e MANGA Plus fora do app.
- Build arm64 com Xcode 16.4 aprovado no CI; IPA de protótipo unsigned versão 0.1.0 (1) gerado e verificado.
- O IPA não está assinado nem foi instalado no iPhone real; não é versão final.
- Catálogo real e episódios seguem bloqueados até existir autorização do titular/provedor. AniBiz foi identificado como caminho B2B para investigar licenciamento, mas direitos de streaming dentro do app ainda precisam ser confirmados em `docs/providers.md`.
- O binário atual é um protótipo técnico, não uma versão de uso final.

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
