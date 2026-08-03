# Instruções persistentes do projeto

Estas decisões devem ser observadas em qualquer máquina e por qualquer agente
que trabalhe neste repositório.

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
