# roadmap — yno animes

Atualizado em 22/11/2026. Marque como concluído somente depois de implementar e validar.

## fase 0 — preparação e referência

- [x] Criar repositório e documentar o objetivo.
- [x] Receber e inventariar a amostra APK por análise estática.
- [ ] Capturar e catalogar telas/fluxos do Tomato com referência visual legítima.
- [ ] Documentar estados de erro, vazio, loading, perfil e reprodução com evidências.

## fase 1 — arquitetura e base iOS

- [x] Criar projeto Xcode UIKit com deployment target iOS 15.0.
- [x] Configurar build CI para dispositivo genérico arm64.
- [x] Implementar persistência local básica de favoritos e progresso.
- [x] Executar smoke test automatizado de persistência em macOS CI.
- [x] Compilar a base no Xcode CI e empacotar IPA sem assinatura.
- [ ] Testar instalação e abertura em iPhone 6s Plus/iOS 15.8.8.
- [ ] Completar modelos, repositórios e tratamento de erros.
- [ ] Definir fornecedor autorizado de metadados/imagens.
- [ ] Definir fornecedor/titular autorizado de episódios e reprodução.

## fase 2 — experiência visual e navegação

- [x] Criar shell inicial escuro com abas início/buscar/biblioteca/fontes/ajustes.
- [x] Adicionar diretório de links externos para fontes oficiais e leitura de mangá.
- [ ] Refinar interface baseada nas evidências do app de referência, sem copiar ativos proprietários.
- [ ] Implementar catálogo paginado, pesquisa real, categorias e detalhes.
- [ ] Implementar tela de anime, temporadas e episódios.
- [ ] Implementar leitor de mangá interno, se houver fonte autorizada.
- [ ] Validar layout no tamanho de tela do iPhone 6s Plus.

## fase 3 — recursos locais e reprodução

- [x] Persistir favoritos localmente (camada de dados).
- [x] Persistir e atualizar progresso local (camada de dados).
- [ ] Conectar controles visuais de favoritos e progresso à interface.
- [ ] Integrar AVPlayer com mídia HLS de teste própria/autorizada.
- [ ] Integrar seleção de faixas/legendas suportadas pela fonte autorizada.
- [ ] Validar continuar assistindo e próximo episódio.
- [ ] Conectar login apenas se houver fluxo oficial autorizado e necessário.

## fase 4 — validação e distribuição

- [x] Build arm64 para iOS por GitHub Actions/Xcode.
- [x] Criar artefato IPA unsigned de protótipo e validar a estrutura ZIP.
- [ ] Configurar assinatura/instalação conforme método compatível com o iPhone-alvo.
- [ ] Instalar em dispositivo-alvo e testar todos os fluxos.
- [ ] Medir inicialização, memória, fluidez e bateria.
- [ ] Publicar build testado com changelog e SHA-256.

## bloqueador externo

A reprodução real de episódios depende de autorização do titular/provedor. Os candidatos e seus formulários oficiais estão em `docs/providers.md`. A análise de rotas no APK não concede autorização para acessar/reutilizar o backend Tomato.

## regra de conclusão

Cada item precisa de implementação verificável e teste registrado em `docs/testing.md`. Planejamento, link externo ou documentação, isoladamente, não significa que o catálogo/player está funcionando.
