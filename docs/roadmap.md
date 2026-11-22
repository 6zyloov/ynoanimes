# roadmap — yno animes

Este documento acompanha o trabalho real. Marque uma tarefa como concluída somente depois de implementar e validar.

## fase 0 — preparação

- [x] Criar repositório público.
- [x] Registrar objetivo, dispositivo-alvo e escopo.
- [ ] Reunir novamente os materiais de referência necessários no ambiente de desenvolvimento.
- [ ] Inventariar telas, menus, estados vazios, erros e fluxos do app Android.
- [ ] Registrar requisitos funcionais e visuais com evidências.

## fase 1 — análise e arquitetura

- [ ] Confirmar tecnologia e arquitetura adequadas ao iOS 15.8.8.
- [ ] Mapear navegação, modelos de dados e estados de tela.
- [ ] Identificar dependências compatíveis com arm64 e o sistema-alvo.
- [ ] Definir estratégia de armazenamento local e tratamento de erros.
- [ ] Documentar integrações externas autorizadas e seus limites.

## fase 2 — experiência visual

- [ ] Criar sistema visual escuro com identidade yno.
- [ ] Implementar navegação inferior e componentes reutilizáveis.
- [ ] Implementar início, catálogo, categorias e pesquisa.
- [ ] Implementar detalhes, temporadas e episódios.
- [ ] Revisar espaçamentos, tipografia, animações e estados de carregamento.

## fase 3 — recursos

- [ ] Favoritos persistentes.
- [ ] Histórico e continuar assistindo.
- [ ] Player com controles e legendas.
- [ ] Login apenas por fluxo oficial/autorizado, se disponível.
- [ ] Tratamento de falhas de rede e indisponibilidade de conteúdo.

## fase 4 — build e validação

- [ ] Configurar projeto de build para IPA.
- [ ] Compilar para o dispositivo-alvo.
- [ ] Instalar no iPhone 6s Plus com Dopamine.
- [ ] Testar cada fluxo no aparelho real.
- [ ] Medir inicialização, memória, fluidez e consumo de bateria.
- [ ] Corrigir falhas e registrar evidências.
- [ ] Publicar uma versão de teste identificada.

## critério de conclusão

Cada item precisa de implementação verificável e teste registrado em `docs/testing.md`. Planejamento ou documentação, isoladamente, não significa que o recurso existe.
