# abnTeX3 Community

[![CI](https://github.com/dantasrs/abntex3-community/actions/workflows/ci.yml/badge.svg)](https://github.com/dantasrs/abntex3-community/actions/workflows/ci.yml)
[![Licença: LPPL 1.3c+](https://img.shields.io/badge/licen%C3%A7a-LPPL%201.3c%2B-blue.svg)](LICENSE)

Continuação comunitária e independente da ideia apresentada no projeto
[`abntex/abntex3`](https://github.com/abntex/abntex3), voltada à produção de
documentos LaTeX compatíveis com normas brasileiras de informação e
documentação.

## Situação do projeto

O projeto possui infraestrutura reproduzível, API experimental de configuração
e metadados, módulos para layout, paginação, seções, elementos pré e
pós-textuais, citações, referências, apêndices, anexos e índice e um perfil
acadêmico em revisão. A versão 0.0.0 ainda não é indicada para produção e não
faz alegação de conformidade.

O primeiro objetivo é criar um pacote leve, testável e compatível com classes
LaTeX usuais. Regras de citações e referências serão delegadas ao
[`biblatex-abnt`](https://github.com/abntex/biblatex-abnt), evitando duplicação
de responsabilidades.

## Independência e atribuição

Este projeto:

- é desenvolvido de forma independente;
- não é mantido nem oficialmente endossado pela organização abnTeX ou pela
  Associação Brasileira de Normas Técnicas (ABNT);
- reconhece o `abntex3` original como origem histórica da proposta e o
  `abntex2` como antecedente técnico;
- não incorpora, neste momento, código-fonte dos projetos anteriores;
- não redistribui o texto de normas técnicas.

O uso dos nomes abnTeX e ABNT neste repositório tem finalidade descritiva e de
atribuição.

## Princípios

- Implementação nova, modular e com poucas dependências.
- Compatibilidade com classes LaTeX usuais sempre que possível.
- Requisitos normativos rastreáveis por norma, edição e item.
- Testes automatizados para cada comportamento observável.
- Separação entre apresentação documental e formatação bibliográfica.
- Ausência de regras institucionais particulares no núcleo do pacote.

## Normas no escopo

A matriz inicial considera, entre outras:

- ABNT NBR 14724:2024 — trabalhos acadêmicos;
- ABNT NBR 12225:2023 — lombada;
- ABNT NBR 6024:2012 — numeração progressiva das seções;
- ABNT NBR 6027:2012 — sumário;
- ABNT NBR 6028:2021 — resumo, resenha e recensão;
- ABNT NBR 10520:2023 — citações;
- ABNT NBR 6023:2025 — referências;
- ABNT NBR 15287:2025 — projeto de pesquisa.

Consulte [`docs/normas.md`](docs/normas.md) para a matriz completa e os limites
de uso das normas.

## Roteiro

### Marcos implementados

- [x] **Marco 0 — Fundação:** governança, independência, licença, arquitetura
  e matriz normativa inicial.
- [x] **Marco 1 — Infraestrutura:** fontes documentadas, `l3build`, testes nos
  três motores, CI e pacote CTAN de ensaio.
- [x] **Marco 2 — Núcleo e API:** configuração, metadados, perfis e suporte
  inicial a `article`, `report` e `book`.
- [x] **Marco 3 — Estrutura:** numeração progressiva, seções, sumário,
  apêndices e anexos.
- [x] **Marco 4 — Layout:** A4, margens, frente e verso, paginação,
  espaçamento, notas, citações longas e textos auxiliares.
- [x] **Marco 5 — Elementos pré-textuais:** capa, prova de lombada, folhas de
  identificação, resumos, palavras-chave e listas automáticas ou declarativas.
- [x] **Marco 6 — Elementos pós-textuais:** integração explícita com
  `biblatex-abnt` e `biber`, referências, glossário, apêndices, anexos e
  índice.
- [x] **Marco 7 — Trabalho acadêmico:** perfil completo para teses,
  dissertações, TCCs e monografias, com exemplo, manual e testes. A revisão
  normativa independente continua pendente antes de qualquer alegação de
  conformidade.

### Próximos marcos

- [ ] **Marco 8 — Projeto de pesquisa:** criar o perfil específico da
  NBR 15287:2025, documentando e testando suas diferenças em relação ao
  trabalho acadêmico.
- [ ] **Marco 9 — Artigo:** implementar o perfil da NBR 6022:2018, incluindo
  autoria múltipla, afiliações, datas editoriais e testes de composição em
  uma ou duas colunas.
- [ ] **Marco 10 — Relatório técnico ou científico:** implementar o perfil da
  NBR 10719:2015, com identificação, equipes, dados institucionais e anexos
  específicos.
- [ ] **Marco 11 — Livro ou folheto:** implementar o perfil da
  NBR 6029:2023, incluindo elementos editoriais, volumes, lombada e índice.
- [ ] **Marco 12 — Migração:** publicar a correspondência entre interfaces do
  abnTeX2 e do abnTeX3 Community, uma camada limitada de compatibilidade e o
  guia de migração para `biblatex-abnt`.
- [ ] **Marco 13 — Qualidade e portabilidade:** ampliar os testes para Linux,
  Windows e macOS, interoperabilidade com pacotes comuns, regressão visual,
  acessibilidade e desempenho.
- [ ] **Marco 14 — Alfa e beta:** publicar os primeiros artefatos no GitHub,
  recolher experiências de uso, concluir revisões normativas e congelar
  progressivamente a API.
- [ ] **Marco 15 — Versão estável e CTAN:** preparar a versão `1.0.0`, criar
  release e tag, submeter ao CTAN e acompanhar a inclusão nas distribuições
  TeX.

Consulte a [`arquitetura e árvore de arquivos`](docs/arquitetura.md) e o
[`roteiro técnico completo`](docs/roadmap.md), que contém tarefas, critérios
de saída e dependências de cada marco.

## Como usar

O pacote ainda não foi publicado no CTAN. Para instalar a versão de
desenvolvimento na árvore pessoal do TeX, use:

```sh
git clone https://github.com/dantasrs/abntex3-community.git
cd abntex3-community
l3build install
```

Uma instalação TeX Live completa deve fornecer também `biblatex-abnt` e
`biber`. O pacote funciona inicialmente com as classes `article`, `report` e
`book`.

### Configuração

Selecione o perfil, o tipo de trabalho e o sistema de citações no preâmbulo:

```tex
\documentclass[12pt]{report}
\usepackage[T1]{fontenc}
\usepackage[brazilian]{babel}
\usepackage{csquotes}
\usepackage[
  perfil=academico,
  tipo-trabalho=dissertacao,
  citacoes=autor-data
]{abntex3}

\addbibresource{referencias.bib}

\ABNTEXsetup{
  titulo      = {Título do trabalho},
  autoria     = {Nome da autoria},
  instituicao = {Nome da instituição},
  natureza    = {Dissertação},
  objetivo    = {apresentada para obtenção do título de Mestre},
  area        = {Área de concentração},
  orientacao  = {Nome da pessoa orientadora},
  local       = {Recife},
  data        = {2026}
}
```

### Fluxo do trabalho acadêmico

Os comandos coordenadores delimitam as partes do documento:

```tex
\begin{document}

\ABNTEXacademicoexterna

\ABNTEXacademicopretextual
\ABNTEXfolhaderosto
\ABNTEXfolhadeaprovacao{Data da aprovação}{Componentes da banca}
\ABNTEXresumo{Texto do resumo}{palavra-chave, outra palavra-chave}
\ABNTEXresumoemlinguaestrangeira
  {Abstract text}
  {keyword, another keyword}
\ABNTEXsumario

\ABNTEXacademicotextual
\chapter{Introdução}
Texto do trabalho.

\ABNTEXacademicopostextual
\ABNTEXbibliografia

\end{document}
```

A ficha catalográfica, lombada, dedicatória, agradecimentos, epígrafe, listas,
glossário, apêndices, anexos e índice são acrescentados somente quando
aplicáveis. Consulte o
[`exemplo acadêmico completo`](examples/trabalho-academico.tex).

### Compilação

Documentos com referências processadas pelo `biber` podem ser compilados com:

```sh
pdflatex trabalho.tex
biber trabalho
pdflatex trabalho.tex
pdflatex trabalho.tex
```

O projeto continua experimental e não deve ser usado como declaração
automática de conformidade normativa.

Consulte a [`referência da API`](docs/api.md) para os metadados disponíveis,
perfis, precedência de configuração, validação técnica e garantias de
estabilidade. O uso de seções e sumário está documentado em
[`docs/structure.md`](docs/structure.md); papel, margens, impressão em uma ou
duas faces, paginação e espaçamento estão em
[`docs/layout.md`](docs/layout.md).
O fluxo completo de tese, dissertação, TCC ou monografia está em
[`docs/profile-academic.md`](docs/profile-academic.md).

## Desenvolvimento

O projeto usa `l3build`. Uma instalação TeX Live completa e atual permite
executar:

```sh
l3build unpack
l3build check
l3build doc
l3build install --texmfhome /caminho/temporario/texmf
l3build ctan
./scripts/validate-distribution.sh
```

`l3build check` executa os testes com pdfTeX, LuaTeX e XeTeX. A integração
contínua repete a suíte no TeX Live 2024, 2025 e 2026. `l3build ctan` já
executa testes e documentação antes de empacotar; por isso o trabalho de
distribuição não repete esses comandos. O último comando valida o pacote CTAN
de ensaio, sem publicá-lo, e compila os exemplos tanto a partir de uma
instalação isolada quanto da árvore TDS empacotada.

Nos pull requests, alterações limitadas à documentação executam somente a
validação rápida de diferenças. Mudanças em fontes, testes, exemplos, scripts,
build, manifesto ou workflows acionam a matriz TeX completa. Execuções manuais
também são sempre completas.

## Governança e colaboração

- [`CONTRIBUTING.md`](CONTRIBUTING.md) — fluxo e requisitos das contribuições;
- [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) — padrões de convivência;
- [`SECURITY.md`](SECURITY.md) — relato privado de vulnerabilidades;
- [`CITATION.cff`](CITATION.cff) — metadados para citação;
- [`docs/decisoes/`](docs/decisoes/) — decisões arquiteturais aceitas;
- [`docs/versionamento.md`](docs/versionamento.md) — versões e compatibilidade.

## Licença

O conteúdo original deste projeto pode ser distribuído e modificado sob a
LaTeX Project Public License, versão 1.3c ou posterior. Consulte
[`LICENSE`](LICENSE) e [`manifest.txt`](manifest.txt).

O projeto possui estado de manutenção `maintained`. O mantenedor atual é
[`dantasrs`](https://github.com/dantasrs).
