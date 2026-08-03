# Instruções persistentes do projeto

Estas decisões devem ser observadas em qualquer máquina e por qualquer agente
que trabalhe neste repositório.

## Início obrigatório de toda sessão

Antes de analisar o roadmap, editar arquivos, criar uma branch ou executar
testes:

1. Leia este `AGENTS.md` por inteiro.
2. Execute `git status -sb` e identifique a branch, alterações locais e seu
   upstream.
3. Confira `git remote -v` e a autenticação com `gh auth status`; depois
   execute `git fetch --prune origin`.
4. Consulte o estado online com `gh pr list --state open` e inspecione os
   commits que existem apenas em `origin/main`.
5. Compare o checkout com o GitHub antes de decidir o próximo trabalho. A
   `main` do GitHub é a referência compartilhada entre as máquinas.

Se a árvore estiver limpa e a branch atual for `main`, atualize-a somente por
avanço rápido:

```sh
git merge --ff-only origin/main
```

Não comece trabalho novo enquanto a situação local e a remota não estiverem
compreendidas. Se a rede ou a autenticação do GitHub estiver indisponível,
informe a limitação antes de fazer mudanças; trabalho offline exige autorização
explícita do usuário.

## Trabalho em duas máquinas

- Nunca pressuponha que a branch local mais recente representa o estado atual
  do projeto. A outra máquina pode ter enviado commits, mesclado um PR ou
  removido uma branch.
- Se o upstream da branch aparecer como `gone`, consulte o PR correspondente e
  verifique se o commit já é ancestral de `origin/main`. Não recrie nem envie a
  branch automaticamente.
- Quando um PR já tiver sido mesclado, volte para `main` e faça o avanço rápido
  antes de iniciar outra tarefa. Remova branches locais antigas somente depois
  de confirmar a incorporação no GitHub.
- Se houver alterações locais não commitadas, não execute `pull`, merge,
  rebase, `reset`, troca de branch ou `stash` automaticamente. Preserve o
  trabalho, compare os estados e explique o conflito ao usuário.
- Antes de enviar uma branch existente, execute novamente
  `git fetch --prune origin`. Se `origin/main` avançou, incorpore-o sem
  reescrever commits já publicados; branches compartilhadas entre máquinas não
  devem sofrer `push --force`.
- Para transferir trabalho entre as máquinas, prefira commits pequenos enviados
  a uma branch remota. Não deixe uma etapa que precise continuar na outra
  máquina apenas como alterações não commitadas.
- Todo trabalho novo parte da `main` sincronizada e usa uma branch de propósito
  único no formato `agent/<descricao>`.
- Ao concluir um marco, valide, faça commit, envie a branch e abra um PR. O PR
  começa como rascunho, salvo instrução contrária do usuário.

## Decisões técnicas atuais

- LuaLaTeX é o único motor LaTeX suportado e usado em exemplos, testes,
  documentação e distribuição.
- Configure o `l3build` com `luatex`; não amplie a matriz para pdfTeX ou XeTeX
  sem uma nova decisão arquitetural explícita.
- Use `lualatex` nas instruções e scripts de compilação.
- Bibliografias usam `biblatex-abnt` com `biber`, não BibTeX nem
  `abntex2cite`.
- Decisões técnicas duradouras devem ser registradas em `docs/decisoes/` e
  refletidas neste arquivo quando afetarem o modo de trabalhar.
- Não inclua PDFs de normas, conteúdo de `bases/` ou artefatos gerados no Git.
- Antes de publicar mudanças técnicas, execute `git diff --check`,
  `l3build check` e as validações adicionais descritas em `CONTRIBUTING.md`.
