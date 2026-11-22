# auditoria de escopo — ynoanimes

**Data:** 22/11/2026  
**Objetivo:** corrigir a classificação da entrega e estabelecer o trabalho real necessário para um port iOS funcional.

## Conclusão executiva

O IPA de 87.311 bytes gerado no workflow 45042287537 **não é uma versão funcional equivalente ao Tomato**. É somente um protótipo UIKit mínimo com navegação, atalhos externos e biblioteca local. Ele não contém o runtime React Native/Hermes do APK, catálogo integrado, serviço de conta, telas equivalentes completas, player funcional, cadeia de legendas, manga reader ou os recursos multimídia do original.

Esse pacote não deve ser chamado de entrega, clone, port ou engenharia reversa concluída. A classificação correta é **protótipo de interface / prova de compilação**.

## Evidência medida no APK original

Arquivo tomato.apk, fornecido pelo usuário:
- Tamanho: **99.167.557 bytes** (aprox. 94,5 MiB).
- Integridade ZIP: 5.316 entradas; teste CRC sem erro.
- Conteúdo descompactado: 136.390.605 bytes.
- Sete DEX: classes.dex a classes7.dex.
- Bundle React Native/Hermes: assets/index.android.bundle (2.204.600 bytes).
- Recursos: 4.989 entradas em res/, somando 9.881.361 bytes.
- Assets: 6.202.216 bytes, incluindo fontes e bundle JS.
- Bibliotecas nativas: 84 arquivos, somando 64.382.652 bytes, distribuídos entre quatro ABIs Android.

### Bibliotecas nativas por ABI

| ABI Android | Arquivos | Tamanho descompactado |
|---|---:|---:|
| arm64-v8a | 25 | 17.243.008 bytes |
| armeabi-v7a | 25 | 12.699.840 bytes |
| x86 | 17 | 17.209.572 bytes |
| x86_64 | 17 | 17.230.232 bytes |

O APK Android inclui binários para quatro arquiteturas. Um IPA para iPhone não deve copiar essas quatro ABIs: deve usar binários e frameworks compatíveis com iOS/arm64. Portanto, **não existe obrigação de o IPA ter exatamente 90 MB**. O tamanho isolado não mede equivalência funcional. Porém, 87 KB comprimidos (executável no pacote com 311.840 bytes e apenas Info.plist/PkgInfo além dele) comprovam que o IPA atual é apenas um shell minúsculo, não um app de anime completo.

## Componentes observados estaticamente no Tomato

- React Native, Hermes, JSI e bundle JavaScript embarcado.
- Bibliotecas nativas arm64 incluindo libreactnative.so, libhermes.so, libjsi.so, libffmpegJNI.so, libgav1JNI.so, libnative-imagetranscoder.so e bibliotecas de imagem.
- Classes e módulos Android identificados para Media3/ExoPlayer, FFmpeg, autenticação, API, perfil, comentários, histórico, mangás, leitor e player.
- Bundle JS com nomes de componentes/fluxos relacionados a busca, categorias, novos episódios, favoritos, histórico, perfil, comentários, temporadas, episódios, leitor e manga.
- O APK contém SDKs de anúncios e bibliotecas auxiliares Android. Não há motivo para copiar SDKs de anúncios do Tomato para o app independente.

A inspeção é estática. Ela não prova que servidores, rotas ou fluxos funcionem hoje. Não foram feitas chamadas às rotas privadas.

## Comparação honesta com o ynoanimes atual

| Área | Tomato APK | ynoanimes no IPA de 87 KB |
|---|---|---|
| Runtime | React Native/Hermes + código nativo | UIKit nativo mínimo |
| Catálogo integrado | Módulos e referências de API encontrados | Não implementado; busca externa JustWatch |
| Detalhe, temporadas e episódios | Componentes/módulos encontrados | Não implementado |
| Player | Player Android com Media3/ExoPlayer e FFmpeg observados | Não implementado; nenhum fluxo de mídia |
| Legendas/qualidade/velocidade/PiP | Métodos e módulos identificados estaticamente | Não implementado |
| Conta/perfil | Classes de autenticação e perfil identificadas | Não implementado |
| Favoritos/histórico | Fluxos e endpoints referenciados | Apenas favoritos/lista local simples; sem sincronização |
| Comentários | Componentes e rotas referenciados | Não implementado |
| Mangás/leitor | Modelos, módulos e migrações identificados | Não implementado |
| Recursos visuais | milhares de recursos e assets | Sem catálogo visual de imagens/miniaturas |
| Estado geral | APK Android completo para análise | Protótipo de interface e persistência local |

## Plano correto de reconstrução iOS

O trabalho precisa ser feito por módulos verificáveis, sem fingir que um shell é o app final:

1. **Especificação de comportamento:** inventariar telas, estados, navegação, dados, ações e dependências observadas no APK/bundle. Distinguir evidência estática de comportamento não observado.
2. **Fundação iOS:** arquitetura de navegação, modelos, armazenamento, rede, cache, imagens, estado de sessão e tratamento de erros.
3. **Catálogo:** telas de início, busca, categorias, detalhes, temporadas e episódios. Para metadados, usar fonte autorizada ou catálogo próprio; não depender de endpoints privados do Tomato.
4. **Player:** AVPlayer/AVKit com uma fonte de teste própria/licenciada; depois implementar e validar seleção de faixa, legendas, velocidade, seek, retomada, PiP e tratamento de rede.
5. **Conta e comunidade:** perfil, comentários e sincronização somente com backend próprio ou API oficialmente autorizada.
6. **Mangás:** leitor, navegação de capítulos/páginas, cache e histórico apenas com conteúdo e direitos apropriados.
7. **Acabamento:** imagens, ícones, loading/empty/error states, acessibilidade, memória e desempenho no iPhone 6s Plus/iOS 15.8.8.
8. **Entrega:** gerar IPA completo, inspecionar conteúdo/tamanho/arquitetura, instalar via TrollStore e testar no aparelho real.

## Restrições e limites

- Não copiar binários Android, código proprietário, imagens, fontes ou mídia do APK para o iOS sem direito de uso.
- Não reutilizar cookies, tokens, chaves, assinaturas, autenticação privada ou contornar controles do Tomato.
- Strings de endpoints encontradas no APK não são autorização de uso, nem prova de disponibilidade.
- O player pode ser construído e testado com mídia própria/licenciada. Streaming de catálogo comercial exige direitos ou integração autorizada.
- A restrição de orçamento zero continua: nenhum serviço pago, licença, API comercial ou conta paga será contratado sem aprovação explícita.
- O app iOS pode ter tamanho diferente do APK Android por usar uma única arquitetura e frameworks Apple. A meta é equivalência funcional e qualidade, não perseguir artificialmente 90 MB.

## Status corrigido

- APK de referência recebido, hash/integridade e inventário de estrutura: **implementado e testado**.
- Shell UIKit e biblioteca local: **protótipo parcial**.
- IPA de 87 KB: **prova de compilação, não entrega**.
- Catálogo integrado, player, conta, comentários e leitor de mangá: **não implementados**.
- Instalação e desempenho no iPhone real: **não verificados**.
- IPA equivalente ao escopo funcional do Tomato: **não entregue**.