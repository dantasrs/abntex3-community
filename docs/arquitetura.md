# Arquitetura e inventário de arquivos

Este documento descreve a arquitetura pretendida do abnTeX3 Community e a
árvore de arquivos necessária para implementá-la. Os nomes dos arquivos
gerados podem ser refinados antes da primeira versão pública, mas as
responsabilidades aqui definidas devem permanecer separadas.

## Decisões principais

1. O núcleo será um **pacote**, carregado sobre classes LaTeX usuais, e não uma
   classe monolítica derivada de `memoir`.
2. A API pública será oferecida por `abntex3.sty`; os demais arquivos
   `abntex3-*.sty` serão módulos internos.
3. Os perfis `academico`, `projeto`, `artigo`, `relatorio` e `livro` serão
   opções do mesmo pacote e compartilharão o núcleo.
4. Citações e referências serão responsabilidade do `biblatex-abnt`. O projeto
   não recriará `abntex2cite.sty`, arquivos `.bst` nem bancos de opções BibTeX.
5. A implementação usará interfaces atuais do kernel LaTeX e `expl3`, com
   chaves em `l3keys2e` e ganchos públicos sempre que disponíveis.
6. Cada comportamento normativo terá requisito, implementação e teste ligados
   por um identificador interno estável.
7. Arquivos derivados (`.sty`, PDF da documentação e pacotes CTAN/TDS) serão
   produzidos pelo `l3build`, sem duplicação no controle de versão.
8. PDFs das normas permanecerão apenas em `bases/`, ignorados pelo Git e fora
   de qualquer distribuição.

## O que aproveitar conceitualmente do abnTeX2

| Componente do abnTeX2 | Destino no abnTeX3 Community |
| --- | --- |
| `abntex2.cls` | API e módulos novos, sem copiar a implementação |
| `abntex2cite.sty`, `.bst` e opções BibTeX | Substituídos por `biblatex-abnt` |
| Modelos de trabalho, projeto, artigo, relatório e livro | Exemplos novos por perfil |
| Manual da classe | Manual único da API e dos perfis |
| Manual de citações | Referência à documentação do `biblatex-abnt` |
| `build.sh`, `Makefile` e `.latexmkrc` | `build.lua` e GitHub Actions |
| Instalação em árvore TDS | Artefato produzido por `l3build ctan` |
| Configurações institucionais | Extensões externas ao núcleo |

O código do abnTeX2 deve ser tratado apenas como antecedente técnico. Qualquer
trecho eventualmente reutilizado exigirá análise de licença, atribuição
individual e registro explícito de proveniência.

## Árvore planejada

```text
abntex3-community/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug.yml
│   │   ├── config.yml
│   │   ├── proposta.yml
│   │   └── requisito-normativo.yml
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows/
│       ├── ci.yml
│       └── release.yml
├── source/
│   ├── abntex3.ins
│   ├── abntex3.dtx
│   ├── abntex3-core.dtx
│   ├── abntex3-layout.dtx
│   ├── abntex3-structure.dtx
│   ├── abntex3-frontmatter.dtx
│   ├── abntex3-backmatter.dtx
│   ├── abntex3-lists.dtx
│   ├── abntex3-profile-academic.dtx
│   ├── abntex3-profile-project.dtx
│   ├── abntex3-profile-article.dtx
│   ├── abntex3-profile-report.dtx
│   ├── abntex3-profile-book.dtx
│   └── abntex3-compat.dtx
├── doc/
│   ├── abntex3-manual.tex
│   ├── abntex3-migration.tex
│   └── abntex3-doc.bib
├── examples/
│   ├── minimo.tex
│   ├── estrutura-sumario.tex
│   ├── elementos-pretextuais.tex
│   ├── pos-textuais-bibliografia.tex
│   ├── referencias-exemplo.bib
│   ├── trabalho-academico.tex
│   ├── projeto-pesquisa.tex
│   ├── artigo.tex
│   ├── modelo-tese-completo.tex
│   ├── modelo-dissertacao-completo.tex
│   ├── modelo-tcc-completo.tex
│   ├── modelo-monografia-completo.tex
│   ├── modelo-projeto-pesquisa-completo.tex
│   ├── modelo-artigo-uma-coluna-completo.tex
│   ├── modelo-artigo-duas-colunas-completo.tex
│   ├── modelo-relatorio-cientifico-completo.tex
│   ├── relatorio-tecnico.tex
│   ├── livro.tex
│   └── referencias.bib
├── testfiles/
│   ├── support/
│   │   └── referencias.bib
│   ├── loading.lvt
│   ├── loading.tlg
│   ├── options.lvt
│   ├── options.tlg
│   ├── layout.lvt
│   ├── layout.tlg
│   ├── sections.lvt
│   ├── sections.tlg
│   ├── frontmatter.lvt
│   ├── frontmatter.tlg
│   ├── backmatter-api.lvt
│   ├── backmatter-api.tlg
│   ├── backmatter-order.lvt
│   ├── backmatter-order.tlg
│   ├── lists.lvt
│   ├── lists.tlg
│   ├── academic-types.lvt
│   ├── academic-types.tlg
│   ├── academic-flow.lvt
│   ├── academic-flow.tlg
│   ├── academic-elements.lvt
│   ├── academic-elements.tlg
│   ├── profile-project.lvt
│   ├── profile-project.tlg
│   ├── profile-article.lvt
│   ├── profile-article.tlg
│   ├── report-flow.lvt
│   ├── report-flow.tlg
│   ├── report-elements.lvt
│   ├── report-elements.tlg
│   ├── report-team.lvt
│   ├── report-team.tlg
│   ├── report-sections.lvt
│   ├── report-sections.tlg
│   ├── report-types.lvt
│   ├── report-types.tlg
│   ├── book-authors.lvt
│   ├── book-authors.tlg
│   ├── book-divisions.lvt
│   ├── book-divisions.tlg
│   ├── book-elements.lvt
│   ├── book-elements.tlg
│   ├── book-flow.lvt
│   ├── book-flow.tlg
│   ├── book-types.lvt
│   ├── book-types.tlg
│   ├── biblatex-author-year.lvt
│   ├── biblatex-author-year.tlg
│   ├── biblatex-numeric.lvt
│   └── biblatex-numeric.tlg
├── scripts/
│   └── validate-distribution.sh
├── docs/
│   ├── arquitetura.md
│   ├── api.md
│   ├── backmatter.md
│   ├── profile-academic.md
│   ├── profile-project.md
│   ├── profile-article.md
│   ├── profile-report.md
│   ├── profile-book.md
│   ├── structure.md
│   ├── roadmap.md
│   ├── normas.md
│   ├── conformidade.md
│   ├── compatibilidade.md
│   ├── versionamento.md
│   ├── requisitos/
│   │   ├── nbr-6022-2018.md
│   │   ├── nbr-6023-2025.md
│   │   ├── nbr-6024-2012.md
│   │   ├── nbr-6027-2012.md
│   │   ├── nbr-6028-2021.md
│   │   ├── nbr-6029-2023.md
│   │   ├── nbr-6034-2004.md
│   │   ├── nbr-10520-2023.md
│   │   ├── nbr-10719-2015.md
│   │   ├── nbr-12225-2023.md
│   │   ├── nbr-14724-2024.md
│   │   └── nbr-15287-2025.md
│   └── decisoes/
│       ├── README.md
│       ├── 0001-pacote-em-vez-de-classe.md
│       ├── 0002-integracao-biblatex-abnt.md
│       ├── 0003-motores-e-versoes.md
│       └── 0004-politica-de-compatibilidade.md
├── bases/                         # somente local; nunca versionar
├── .gitignore
├── build.lua
├── CHANGELOG.md
├── CITATION.cff
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── LICENSE
├── README.md
├── SECURITY.md
└── manifest.txt
```

Os arquivos já materializados até o Marco 11 formam a infraestrutura mínima,
os módulos normativos gerais e os perfis acadêmico, de projeto de pesquisa,
artigo, relatório técnico ou científico e livro ou folheto, todos ainda
pendentes de revisão normativa independente. Os demais itens da árvore são
criados apenas no marco
em que sua responsabilidade é implementada.

## Responsabilidade dos módulos

| Módulo gerado | Responsabilidade |
| --- | --- |
| `abntex3.sty` | Carregamento, opções públicas, seleção de perfil e diagnóstico |
| `abntex3-core.sty` | Estado interno, metadados, mensagens e utilidades |
| `abntex3-layout.sty` | Papel, margens, frente e verso, paginação e tipografia |
| `abntex3-structure.sty` | Seções, numeração, apêndices, anexos e sumário |
| `abntex3-frontmatter.sty` | Capa, folha de rosto, aprovação, resumos e listas |
| `abntex3-backmatter.sty` | Referências, glossário, apêndices, anexos e índice |
| `abntex3-lists.sty` | Ilustrações, tabelas, abreviaturas, siglas e símbolos |
| `abntex3-profile-*.sty` | Regras exclusivas de cada perfil documental |
| `abntex3-compat.sty` | Diagnósticos e camada limitada de migração do abnTeX2 |

## API pública do núcleo

A API privilegia chaves e comandos sem dependência da estrutura interna. Seu
primeiro contrato experimental foi estabelecido no Marco 2; a estabilidade
definitiva será congelada apenas no primeiro beta.

```tex
\usepackage[
  perfil=academico,
  impressao=frente-e-verso,
  citacoes=autor-data
]{abntex3}

\ABNTEXsetup{
  titulo       = {...},
  autor        = {...},
  instituicao  = {...},
  local        = {...},
  data         = {...}
}
```

Os comandos de consulta `\ABNTEXmetadata`, `\ABNTEXprofile` e `\ABNTEXclass`,
além de `\ABNTEXvalidate`, completam o núcleo atual. A referência detalhada
está em [`api.md`](api.md).

Comandos legados não devem ser reproduzidos automaticamente. A camada de
compatibilidade só incluirá os casos de migração com benefício comprovado e
sem comprometer a nova API.

## Classes e motores

O primeiro alvo funcional será `article`, `report` e `book`. Compatibilidade
com `memoir` e KOMA-Script será avaliada depois que o núcleo estiver estável.

A matriz de integração contínua usa apenas LuaLaTeX, conforme a
[ADR 0005](decisoes/0005-lualatex-exclusivo.md), em todas as versões anuais do
TeX Live mantidas pelo projeto.
Durante o desenvolvimento inicial, serão suportadas a versão corrente e as
duas versões anuais anteriores do TeX Live, sujeitas à disponibilidade dos
executores de CI. A política vigente está registrada na ADR 0005; a ADR 0003
permanece apenas como histórico da decisão substituída.

## Arquivos que não devem ser criados

- substitutos próprios de `abntex2cite.sty`, `abntex2-alf.bst` ou
  `abntex2-num.bst`;
- cópias de PDFs das normas dentro de `doc/`, `examples/` ou artefatos;
- classes específicas de universidades no núcleo;
- arquivos `.sty` derivados dos `.dtx` sob controle de versão;
- PDFs compilados dos exemplos no repositório;
- um segundo sistema de build paralelo ao `l3build`.
