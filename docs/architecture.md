# arquitetura — yno animes

## objetivo

Construir um aplicativo iOS instalável em IPA, compatível com iOS 15.8.8 e iPhone 6s Plus. A arquitetura final será escolhida depois de inspecionar as referências e validar ferramentas de build compatíveis com o sistema-alvo.

## áreas do aplicativo

- **apresentação:** telas, componentes, tema escuro, navegação e estados visuais.
- **catálogo:** animes, mangás, categorias, pesquisa e detalhes.
- **biblioteca pessoal:** favoritos e histórico.
- **reprodução:** player, controles, seleção de faixa e legendas, quando suportados pela fonte autorizada.
- **conta:** autenticação e sincronização somente por mecanismos oficiais/autorizados.
- **dados:** cache, preferências e persistência local.

## decisões ainda abertas

As decisões abaixo não devem ser presumidas antes de testes:

- Swift/UIKit, SwiftUI ou outra abordagem compatível.
- Versões exatas do Xcode e SDK necessárias para gerar um binário que rode no iOS 15.8.8.
- Bibliotecas de reprodução e formatos de legenda.
- APIs e provedores de catálogo autorizados.
- Necessidade de componentes específicos para instalação em dispositivo com Dopamine.

## regras técnicas

1. Verificar a compatibilidade de cada dependência com iOS 15.8.8.
2. Evitar bibliotecas pesadas sem benefício demonstrado.
3. Não embutir credenciais, tokens ou dados de sessão.
4. Não presumir que endpoints observados no APK sejam públicos, estáveis ou autorizados.
5. Isolar integrações externas para que possam ser substituídas sem reescrever a interface.
6. Tratar erros de rede, dados ausentes e indisponibilidade de mídia de forma explícita.

## referência Android

O APK de referência deverá ser analisado apenas para documentar comportamento observável, estrutura de telas e compatibilidade de fluxos. Não copiar código, chaves, bibliotecas proprietárias ou conteúdo protegido. A análise de endpoints não autoriza seu uso.
