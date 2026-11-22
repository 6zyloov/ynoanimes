# testes e compatibilidade

Atualizado em 22/11/2026.

## dispositivo principal

- iPhone 6s Plus
- iOS 15.8.8
- Dopamine
- entrega esperada: IPA

## resultados confirmados em CI

| verificação | resultado | evidência |
|---|---|---|
| smoke test da camada local | aprovado | teste Swift no macOS GitHub Actions |
| favoritos local | aprovado | adicionar, remover e conferir persistência em suite isolada |
| progresso local | aprovado | salvar, atualizar, substituir duplicata e remover |
| versão Xcode | aprovado | Xcode 16.4 |
| build iOS arm64 | aprovado | xcodebuild Release para generic iOS device |
| pacote IPA | aprovado | artefato gerado no job de CI |
| integridade ZIP | aprovado | `unzip -t` sem erros |
| arquitetura executável | aprovado | Mach-O arm64 |
| deployment target | aprovado | Info.plist contém MinimumOSVersion 15.0 |
| assinatura | não concluído | build executado com CODE_SIGNING_ALLOWED=NO |
| instalação em iPhone real | não verificado | nenhum dispositivo conectado ao CI |
| interface em iOS 15.8.8 | não verificado | ainda não testada no dispositivo-alvo |
| catálogo e episódios reais | bloqueado | fornecedor/titular autorizado ainda não definido |

## dados do build de protótipo

- Repositório: `6zyloov/ynoanimes`
- Workflow: `ios-build`
- Execução CI aprovada: `44992152325`
- Commit de build: `f89b69d3fe777e26b036863778ccc1230830afb3`
- Bundle ID: `com.ynoez.ynoanimes`
- Deployment target: iOS 15.0
- Arquitetura gerada: arm64
- SHA-256 do IPA unsigned desta execução: `1d2b8d115b11bc5087781ea9bed968e1d951b803796f4b8fe1531d80f278ca33`

Este artefato é apenas um protótipo técnico. Está sem assinatura, sem catálogo real, sem episódios e sem validação em aparelho. Não classificar como IPA final.

## registro obrigatório para próximos testes

Para cada build instalado, registrar data, identificação, dispositivo/iOS, passos, esperado/observado, logs sem dados pessoais e falhas/correções.

## regra

Compilação e ZIP válido não provam instalação, estabilidade nem funcionamento do catálogo/player. Só marcar um fluxo como aprovado quando testado no aparelho ou em teste automatizado apropriado.
