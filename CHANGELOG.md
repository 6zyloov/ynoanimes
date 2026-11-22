# changelog

Alterações relevantes do projeto yno animes.

## não lançado

- Criação da documentação inicial do projeto.
- Definição do dispositivo-alvo: iPhone 6s Plus, iOS 15.8.8 e Dopamine.
- Registro do escopo e do roadmap de implementação e testes.

## protótipo técnico — 22/11/2026

- Análise estática inicial do APK de referência registrada em `docs/reverse-engineering.md`.
- Criado projeto inicial UIKit para iOS 15+, camada local de favoritos/progresso e smoke test.
- CI em macOS/Xcode 16.4 passou; IPA arm64 unsigned de protótipo foi gerado e validado como ZIP.
- Registradas as limitações de assinatura, ausência de teste em iPhone real e bloqueio de catálogo/episódios por falta de provedor autorizado.
- Primeira compilação revelou conflito de nome em Swift; corrigido e recompilado com sucesso.

## fontes oficiais e licenciamento — 22/11/2026

- Adicionada aba “fontes” com links externos para Muse BR, Crunchyroll Brasil, Crunchyroll, Pluto TV, JustWatch e MANGA Plus.
- Mapeados distribuidores e canais oficiais de licenciamento OTT em docs/providers.md: Sato Company, Artworks Entertainment, MUSE Communication, Bandai Namco Filmworks e Kodansha.
- Reforçada a separação entre catálogo/metadados e direitos de reprodução de episódios; nenhuma licença ou contato comercial foi confirmado.
- Build do diretório de fontes aprovado no CI.
- Build de protótipo versão 0.1.0 (1) aprovado no Xcode 16.4 para arm64/iOS 15+; IPA unsigned gerado e verificado localmente. Não assinado nem instalado em aparelho real.


## pesquisa de licenciamento — AniBiz — 22/11/2026

- Identificada AniBiz como marketplace B2B de anime IP para conectar licensees a licensors oficiais.
- A plataforma declara aceitar startups e app developers; em 27/10/2026 anunciou mais de 30 licensors e investimento de TBS Group, Toei Animation e TV TOKYO Holdings.
- Perfil Basic anunciado como gratuito; plano Pro divulgado a US$ 49/mês, não contratado.
- Streaming de episódios dentro de app de terceiros não está confirmado no catálogo público. Próximo passo é perguntar ao marketplace/licensor se há direitos audiovisuais SVOD/TVOD/AVOD para Brasil e entrega via HLS/SDK.
- Nenhum cadastro, pagamento, contato comercial ou licença foi realizado.
