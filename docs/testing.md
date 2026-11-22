# testes e compatibilidade

Atualizado em 22/11/2026.

## dispositivo principal
- iPhone 6s Plus
- iOS 15.8.8
- Dopamine
- entrega final esperada: IPA instalável

## resultados confirmados

| verificação | resultado | evidência |
|---|---|---|
| favoritos/progresso local | **implementado e testado** | smoke test Swift no macOS CI |
| biblioteca local com status | **implementado e testado** | inserir, impedir duplicado, atualizar status, validar status e remover no smoke test |
| início com atalhos | **implementado e testado** | build Release compila os cartões e navegação por abas |
| diretório de fontes oficiais gratuitas | **implementado e testado** | build CI passou após atualizar cards externos |
| build iOS arm64 | **implementado e testado** | Xcode 16.4, Release, generic iOS device |
| IPA unsigned | **implementado e testado** | artefato descarregado, wrapper ZIP e IPA interno validados |
| integridade ZIP | **implementado e testado** | zipfile.testzip() e unzip -t sem erros |
| Bundle ID/nome/versão | **implementado e testado** | Info.plist lido |
| deployment target | **implementado e testado** | MinimumOSVersion 15.0 |
| arquitetura | **implementado e testado** | Mach-O 64-bit arm64 |
| assinatura Apple para instalação padrão | **não concluído** | sem certificado Apple e sem embedded.mobileprovision |
| fakesign TrollStore | **implementado e testado** | LC_CODE_SIGNATURE criado por ldid; destino de instalação é TrollStore |
| instalação iPhone real | **não verificado** | não instalado em iPhone 6s Plus |
| interface iOS 15.8.8 | **não verificado** | nenhum teste no dispositivo-alvo |
| disponibilidade de temporadas | **não verificado** | páginas oficiais existem, mas não foi testada a reprodução em cada região/conta |
| qualidade Full HD por título | **não verificado** | resolução/bitrate não inspecionados vídeo a vídeo |
| player interno com episódios | **bloqueado** | não existe autorização/SDK de playback de terceiros confirmada |

## build do diretório de fontes (22/11/2026)

- GitHub Actions run: 44993609639 — success
- Link: https://github.com/6zyloov/ynoanimes/actions/runs/44993609639
- Commit: 80ca6590451092409daf2ad27179d16d1caa4070
- Xcode: 16.4
- Bundle ID: com.ynoez.ynoanimes
- Nome: yno animes
- Versão/build: 0.1.0 (1)
- MinimumOSVersion: 15.0
- UIDeviceFamily: iPhone (família 1)
- Executável: Mach-O 64-bit arm64
- Wrapper ZIP: 72.691 bytes
- SHA-256 do wrapper ZIP: 4cc0cd1ec6ee11bc73a4f310d60a8da66205e8606f08d2a2baeb8aebd57059dc
- IPA interno: 69.839 bytes
- SHA-256 do IPA unsigned: e64e6bae51c3b7338790807d17e70148ae3970d19475cd269e3a6d31c3d7a237
- Artefato do GitHub: ID 14743360551, disponível até 06/12/2026.

O artefato foi descarregado nesta execução, aberto e validado. O Info.plist foi inspecionado, confirmando Bundle ID, nome, versão, MinimumOSVersion e família de dispositivo. O executável é arm64. A pasta de assinatura e o provisioning profile não existem; portanto, o pacote não está pronto para instalação.

## critérios de qualidade para fontes
Só classificar uma obra como Full HD depois de conferir no player oficial:
1. resolução real de 1920×1080 ou superior;
2. bitrate sem instabilidade severa e sem upscale artificial;
3. proporção correta;
4. áudio sincronizado e sem clipping;
5. legenda PT-BR completa e sincronizada;
6. estabilidade de buffer no iPhone 6s Plus.

## regra
Build bem-sucedido não prova instalação, estabilidade nem reprodução real. Os links externos para Mercado Play, Anime Sato, Muse BR e Pluto TV não significam que o ynoanimes hospeda ou incorpora os vídeos. Toda funcionalidade precisa da evidência apropriada.


## Build e validação mais recentes — 22/11/2026

- Workflow ios-build run 45042287537: **success**.
- Link: https://github.com/6zyloov/ynoanimes/actions/runs/45042287537
- Commit: 4786b48459eca840d8571ab1f2b9382347d6c702.
- Smoke test de biblioteca local e favoritos/progresso, build Xcode Release arm64, instalação de ldid-procursus, empacotamento e upload: aprovados.
- Artefato: 14762043178; expira em 06/12/2026.
- Bundle ID: com.ynoez.ynoanimes; display name: yno animes; versão/build: 0.1.0 (1); iOS mínimo 15.0; família iPhone.
- IPA unsigned: 84.557 bytes; SHA-256: 2905995e1068c7760f4491d3e68c18d4ee19ce4ad68ef2b96b90e9ed23c202c5.
- IPA TrollStore: 87.311 bytes; SHA-256: f3aedbd61aefa9fd4b24e3a3081e320e05ea25dbaf3b517c15a17171075a5d96.
- ZIPs: integridade aprovada. Info.plist e executável Mach-O arm64 conferidos. A variante TrollStore contém LC_CODE_SIGNATURE fake do ldid; a unsigned não contém.
- Verificação estática do binário confirmou os atalhos da tela inicial (Anime Sato, Crunchyroll e Pluto TV) e textos da biblioteca local.

**Classificação:** código compilado, smoke tests e integridade dos IPAs **implementado e testado**; instalação/abertura no iPhone 6s Plus/iOS 15.8.8 **não verificadas**. A variante TrollStore deve ser importada no TrollStore; o fakesign não é assinatura Apple e não instala pelo fluxo normal do iOS.
