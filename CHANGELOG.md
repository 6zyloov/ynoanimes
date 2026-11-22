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
