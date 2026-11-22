# testes e compatibilidade

Atualizado em 22/11/2026.

## dispositivo principal

- iPhone 6s Plus
- iOS 15.8.8
- Dopamine
- entrega esperada: IPA

## resultados confirmados em CI e inspeção do artefato

| verificação | resultado | evidência |
|---|---|---|
| smoke test da camada local | **implementado e testado** | teste Swift no macOS GitHub Actions |
| favoritos local | **implementado e testado** | adicionar, remover e conferir persistência em suite isolada |
| progresso local | **implementado e testado** | salvar, atualizar, substituir duplicata e remover |
| diretório de fontes oficiais | **parcial** | aba “fontes” com links externos para serviços oficiais; não reproduz mídia |
| versão Xcode | **implementado e testado** | Xcode 16.4 |
| build iOS arm64 | **implementado e testado** | xcodebuild Release para generic iOS device |
| pacote IPA unsigned | **implementado e testado** | artefato gerado no job de CI |
| integridade ZIP | **implementado e testado** | `unzip -t` sem erros no wrapper e no IPA interno |
| arquitetura executável | **implementado e testado** | Mach-O 64-bit arm64 |
| deployment target | **implementado e testado** | Info.plist contém MinimumOSVersion 15.0 |
| versão do app | **implementado e testado** | CFBundleShortVersionString 0.1.0; CFBundleVersion 1 |
| assinatura | **não verificado / não concluído** | build executado com CODE_SIGNING_ALLOWED=NO; artefato sem assinatura |
| instalação em iPhone real | **não verificado** | nenhum dispositivo conectado ao CI |
| interface em iOS 15.8.8 | **não verificado** | ainda não testada no dispositivo-alvo |
| catálogo e episódios reais | **bloqueado** | nenhum contrato/provedor de mídia autorizado confirmado |

## dados do build de protótipo mais recente

- Repositório: `6zyloov/ynoanimes`
- Workflow: `ios-build`
- Execução CI aprovada: `44992828700`
- Link da execução: https://github.com/6zyloov/ynoanimes/actions/runs/44992828700
- Commit de build: `dd0e00b6165bdc65e357a6249bc7209573d833a4`
- Xcode: 16.4
- Bundle ID: `com.ynoez.ynoanimes`
- Nome exibido: `yno animes`
- Versão: `0.1.0 (1)`
- Deployment target: iOS 15.0
- Arquitetura gerada: arm64
- SHA-256 do IPA unsigned: `a97fb0ae2a898ff4bd36d52ea098e9cc5a661fe678862245b07c3e38df1c2d59`
- Artefato ZIP do GitHub Actions: 71.568 bytes, disponível até 06/12/2026 (UTC).

### Verificações do artefato descarregado

O wrapper ZIP e o IPA interno foram abertos localmente. `unzip -t` não encontrou erros; o SHA-256 calculado localmente confere com o hash produzido pelo workflow. O Info.plist foi lido e confirmou Bundle ID, nome, versão, build, MinimumOSVersion 15.0 e família de dispositivo iPhone. O executável foi identificado como Mach-O 64-bit arm64.

**Este é apenas um protótipo técnico unsigned, não o IPA final de uso.** Ele contém a interface inicial e links externos, sem catálogo integrado, sem episódios e sem integração de reprodução autorizada. Não está assinado e não foi instalado no iPhone 6s Plus. Não entregar nem classificar como versão pronta para uso.

## registro obrigatório para próximos testes

Para cada build instalado, registrar data, identificação, dispositivo/iOS, passos, resultado esperado/observado, capturas ou logs sem dados pessoais e falhas/correções.

## regra

Compilação e ZIP válido não provam instalação, estabilidade nem funcionamento do catálogo/player. Só marcar um fluxo como aprovado quando testado no aparelho ou em teste automatizado apropriado.
