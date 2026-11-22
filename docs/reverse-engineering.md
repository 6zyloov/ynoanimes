# análise estática do apk de referência

**Data da análise:** 22/11/2026  
**Amostra:** `tomato.apk` recebido nesta conversa  
**Estado:** análise estática executada; comportamento em execução não verificado.

## Integridade da amostra

- Tamanho: 99.167.557 bytes.
- SHA-256: `008212da46566ea0c5bcb230e3c57d158d8af495dbcf5c633ee777f718406616`.
- Contêiner ZIP: 5.316 entradas.
- DEX: sete arquivos, de `classes.dex` a `classes7.dex`.
- Bundle React Native: `assets/index.android.bundle`, 2.204.600 bytes.

O APK original foi somente lido. Nenhum arquivo dentro dele foi alterado.

## Manifesto Android

Valores decodificados diretamente de `AndroidManifest.xml`:

| Campo | Valor |
|---|---|
| Application ID | `com.tomatos.clientapp` |
| versionCode | `105` |
| versionName | `1.6.1` |
| minSdkVersion | `24` |
| targetSdkVersion | `34` |
| compileSdkVersion | `35` |
| cleartext traffic | desativado |

O manifesto declara permissões de internet, áudio, armazenamento, rede, notificações, serviços em primeiro plano, janela sobreposta, wake lock e identificador de publicidade. Essas permissões pertencem ao app Android de referência; não devem ser copiadas automaticamente para o iOS.

## Estrutura técnica observada

- React Native, Hermes e JSI aparecem no bundle e nas bibliotecas nativas.
- O APK contém bibliotecas nativas para ARM/ARM64 e x86.
- Há componentes AndroidX Media3/ExoPlayer e FFmpeg.
- Foram encontrados módulos próprios para autenticação, API, histórico, comentários, mangás e player.
- O pacote contém SDKs de publicidade; o projeto ynoanimes não precisa reproduzi-los.

## Componentes e fluxos identificados

### Aplicativo e navegação

O manifesto declara, entre outros, componentes de splash, perfil, edição de perfil, comentários, configurações, detalhes de mangá, leitor de mangá e player. O componente de player declara suporte a Picture in Picture no Android.

### Player

A classe `PlayerActivity` contém métodos relacionados a:
- inicialização e destruição do player;
- play/pause e mudança de velocidade;
- mudança de qualidade/faixa;
- avanço para o próximo episódio;
- Picture in Picture;
- tratamento de legendas;
- envio de posição de reprodução (playhead);
- integração com sessão de Cast.

A classe `SubtitleUtils` contém funções para reconhecer arquivos de legenda, idioma e MIME type, procurar legendas em diretórios e normalizar conversões de texto. Isso descreve a estrutura observada no Android, não prova que cada fluxo funciona hoje.

### Conta e API

Foram identificadas classes como `AuthSessionManager`, `AuthStore`, `AuthPreferences`, `ApiSession`, `AuthApi` e `TomatoApiService`. Isso indica uma camada própria de sessão e transporte.

O APK contém referências ao host `prod-api.tomatoanimes.com` e a rotas como `/v2/anime/`, `/v2/manga/`, `/v2/playheads`, `/v3/auth/`, `/v3/auth/session`, `/v3/episodes/`, `/v3/mangas/`, `/v3/comments/` e `/v3/version`. A presença dessas strings não comprova disponibilidade, acesso público, estabilidade ou autorização de uso. Nenhuma dessas rotas foi chamada nesta análise.

**Decisão de segurança:** não reutilizar autenticação privada, cookies, tokens, segredos, assinaturas, endpoints internos ou controles de acesso do Tomato. Os nomes de rota servem apenas para compreender as áreas funcionais do app de referência.

### Mangás e persistência

Foram identificados modelos de mangá, capítulo e página, leitor padrão/reverso/webtoon, favoritos, histórico, cache de páginas, banco local e funções de backup/restauração. O APK contém migrações de banco de dados de 1 a 11.

## Tradução para a implementação iOS

Arquitetura recomendada para o dispositivo-alvo:
- UIKit como camada de interface principal, com deployment target iOS 15.0.
- AVPlayer/AVPlayerViewController para mídia autorizada compatível com AVFoundation.
- AVPlayerItem legível por legendas fornecidas legitimamente pela fonte e suportadas pelo iOS; outras combinações exigirão teste separado.
- Core Data ou SQLite para biblioteca, favoritos e histórico local.
- Camada `CatalogProvider` isolada para que um provedor autorizado possa ser trocado sem reescrever as telas.
- Keychain somente para credenciais de serviços que tenham fluxo oficial e autorização explícita.

Não se deve portar bibliotecas Android ou copiar código/ativos proprietários do APK.

## O que esta análise não fez

- Não instalou nem executou o APK.
- Não observou tráfego de rede do aplicativo.
- Não validou login, catálogo, endpoints, reprodução, legendas, download ou comentários em execução.
- Não confirmou direitos de uso sobre os servidores, imagens ou vídeos do Tomato.
- Não produziu projeto Xcode nem IPA.
- Não inspecionou visualmente todas as telas em dispositivo real.

## Classificação

| Item | Estado |
|---|---|
| Integridade e hash da amostra | **implementado e testado** (leitura local) |
| Manifesto e versão Android | **implementado e testado** (decodificação estática) |
| Estrutura React Native/Hermes | **implementado e testado** (inspeção estática) |
| Módulos de player, legenda, API e mangá | **implementado e testado** (classes/strings estáticas) |
| Telas e fluxos em execução | **não verificado** |
| Serviços e rotas Tomato atualmente disponíveis | **não verificado** |
| Direito de reutilizar infraestrutura Tomato | **bloqueado** até prova de autorização |
| Arquitetura iOS | **parcial** (direção técnica definida; ainda sem projeto compilável) |
| IPA | **planejado** |
