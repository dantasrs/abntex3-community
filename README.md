# abnTeX3 Community

[![CI](https://github.com/dantasrs/abntex3-community/actions/workflows/ci.yml/badge.svg)](https://github.com/dantasrs/abntex3-community/actions/workflows/ci.yml)
[![Pré-release](https://github.com/dantasrs/abntex3-community/actions/workflows/release.yml/badge.svg)](https://github.com/dantasrs/abntex3-community/actions/workflows/release.yml)
[![Licença: LPPL 1.3c+](https://img.shields.io/badge/licen%C3%A7a-LPPL%201.3c%2B-blue.svg)](LICENSE)

Continuação comunitária e independente da ideia apresentada no projeto
[`abntex/abntex3`](https://github.com/abntex/abntex3), voltada à produção de
documentos LaTeX compatíveis com normas brasileiras de informação e
documentação.

## Situação do projeto

O projeto possui infraestrutura reproduzível, API experimental de configuração
e metadados, módulos para layout, paginação, seções, elementos pré e
pós-textuais, citações, referências, apêndices, anexos e índice, além dos
perfis acadêmico, de projeto de pesquisa, de artigo, de relatório e de livro
ou folheto em revisão.
A versão 0.1.0-alpha.1 ainda não é indicada para produção e não faz alegação de
conformidade.

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
- ABNT NBR 15287:2025 — projeto de pesquisa;
- ABNT NBR 6022:2018 — artigo em publicação periódica;
- ABNT NBR 10719:2015 — relatório técnico ou científico.
- ABNT NBR 6029:2023 — livro ou folheto.

Consulte [`docs/normas.md`](docs/normas.md) para a matriz completa e os limites
de uso das normas.

## Roteiro

### Marcos implementados

- [x] **Marco 0 — Fundação:** governança, independência, licença, arquitetura
  e matriz normativa inicial.
- [x] **Marco 1 — Infraestrutura:** fontes documentadas, `l3build`, testes com
  LuaLaTeX, CI e pacote CTAN de ensaio.
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
- [x] **Marco 8 — Projeto de pesquisa:** perfil completo da NBR 15287:2025,
  com estrutura textual própria, exemplo, manual e testes. A revisão normativa
  independente continua pendente.
- [x] **Marco 9 — Artigo:** perfil completo da NBR 6022:2018, com autoria
  múltipla, dados editoriais, uma ou duas colunas, exemplo, manual e testes. A
  revisão normativa independente continua pendente.
- [x] **Marco 10 — Relatório técnico ou científico:** identificação própria,
  equipe técnica, resumo, dados institucionais, formulário, exemplos e testes
  das variantes institucional e científica. A revisão normativa independente
  continua pendente.
- [x] **Marco 11 — Livro ou folheto:** elementos editoriais, autorias
  repetíveis, volumes, capa, lombada, partes, capítulos e pós-textuais da
  NBR 6029:2023. A revisão normativa independente continua pendente.
- [x] **Marco 12 — Migração:** correspondência entre interfaces do abnTeX2 e
  do abnTeX3 Community, camada limitada de compatibilidade e guia de migração
  para `biblatex-abnt`.
- [x] **Marco 13 — Qualidade e portabilidade:** suíte em Linux, Windows e
  macOS, interoperabilidade, metadados do PDF, auditoria de mensagens,
  desempenho, regressão visual e política inicial de acessibilidade.

### Próximos marcos

- [ ] **Marco 14 — Alfa e beta:** a candidata `0.1.0-alpha.1` está preparada
  para publicação no GitHub; depois da pré-release, serão recolhidas
  experiências de uso, concluídas revisões normativas e congelada
  progressivamente a API.
- [ ] **Marco 15 — Versão estável e CTAN:** preparar a versão `1.0.0`, criar
  release e tag, submeter ao CTAN e acompanhar a inclusão nas distribuições
  TeX.

Consulte a [`arquitetura e árvore de arquivos`](docs/arquitetura.md) e o
[`roteiro técnico completo`](docs/roadmap.md), que contém tarefas, critérios
de saída e dependências de cada marco.

Quem mantém documentos em abnTeX2 pode começar pela
[`matriz de compatibilidade e procedimento de migração`](docs/compatibilidade.md).
O módulo opcional `abntex3-compat` oferece somente aliases de correspondência
direta e emite avisos para que a conversão termine na API nativa.

## Testar a candidata alfa

A linha `0.1.0-alpha` destina-se a ensaios públicos e pode introduzir mudanças
de API entre pré-releases. Depois da publicação da tag, os ZIPs CTAN e TDS e
seus resumos SHA-256 estarão na
[página de Releases](https://github.com/dantasrs/abntex3-community/releases).
O [`guia do teste alfa`](docs/teste-alfa.md) explica instalação isolada,
verificação de integridade, exemplo mínimo e envio de relatos de uso ou
migração. Os artefatos dessa fase não serão submetidos ao CTAN.

## Modelos canônicos

Há modelos completos e auditáveis para tese, dissertação, TCC, monografia,
projeto de pesquisa, artigo em uma ou duas colunas, relatório científico e
livro.
Eles demonstram todos os elementos aplicáveis atualmente implementados. Cada
arquivo tem duas funções:

1. servir como exemplo de auditoria, no qual um avaliador pode localizar e
   compilar cada recurso do perfil;
2. servir como ponto de partida para um documento novo, removendo-se os
   elementos opcionais que não forem necessários.

| Documento desejado | Arquivo para copiar |
| --- | --- |
| Tese | [`modelo-tese-completo.tex`](examples/modelo-tese-completo.tex) |
| Dissertação | [`modelo-dissertacao-completo.tex`](examples/modelo-dissertacao-completo.tex) |
| TCC | [`modelo-tcc-completo.tex`](examples/modelo-tcc-completo.tex) |
| Monografia | [`modelo-monografia-completo.tex`](examples/modelo-monografia-completo.tex) |
| Projeto de pesquisa | [`modelo-projeto-pesquisa-completo.tex`](examples/modelo-projeto-pesquisa-completo.tex) |
| Artigo em uma coluna | [`modelo-artigo-uma-coluna-completo.tex`](examples/modelo-artigo-uma-coluna-completo.tex) |
| Artigo em duas colunas | [`modelo-artigo-duas-colunas-completo.tex`](examples/modelo-artigo-duas-colunas-completo.tex) |
| Relatório científico | [`modelo-relatorio-cientifico-completo.tex`](examples/modelo-relatorio-cientifico-completo.tex) |
| Livro ou folheto | [`livro.tex`](examples/livro.tex) |

Os arquivos são deliberadamente extensos: não significa que todo documento
deva conter todos aqueles elementos. A matriz de cobertura e o procedimento
de auditoria estão em
[`docs/modelos-canonicos.md`](docs/modelos-canonicos.md).

## Como usar

Esta seção é um manual inicial para quem já consegue escrever texto, seções e
comandos básicos em LaTeX, mas ainda não conhece a organização de um modelo
documental completo.

### Instalação

O abnTeX3 Community suporta exclusivamente LuaLaTeX. Use uma instalação TeX
Live que inclua LuaLaTeX, `l3build`, `biblatex-abnt`, `biber` e as demais
dependências dos recursos escolhidos.

As normas gerais no escopo não determinam uma família como Arial ou Times New
Roman: a ABNT NBR 14724:2024, 5.1, recomenda o tamanho; a ABNT NBR 10719:2015,
5.1, exige padronização; e a ABNT NBR 6022:2018, 6.1, deixa o projeto gráfico
do artigo a critério editorial. O pacote, portanto, não impõe família
tipográfica. Para trabalhos acadêmicos, uma família Times é uma escolha
prática frequentemente aceita por regulamentos institucionais, mas o manual
local sempre prevalece. Consulte a [política tipográfica](docs/layout.md) para
configuração com `fontspec` e para distinguir Times New Roman de alternativas
compatíveis.

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

### Classe, perfil e tipo: qual é a diferença?

Esses três conceitos atuam em níveis diferentes:

| Conceito | Exemplos | O que controla |
| --- | --- | --- |
| Classe LaTeX | `article`, `report`, `book` | Estrutura básica do LaTeX, como a existência de capítulos |
| Perfil | `academico`, `projeto`, `artigo`, `relatorio`, `livro` | Fluxo, elementos obrigatórios e validações do gênero documental |
| Tipo de trabalho | `tese`, `dissertacao`, `tcc`, `monografia` | Variação declarada dentro do perfil acadêmico |

A classe não substitui o perfil. Por exemplo, `report` fornece `\chapter`, mas
não sabe o que é folha de rosto, resumo ou folha de aprovação. O perfil
`academico` coordena esses elementos. Da mesma forma, selecionar
`tipo-trabalho=tese` não inventa o nome do programa, a natureza ou o objetivo:
esses textos variam por instituição e precisam ser informados pelo usuário.

Como ponto de partida:

- use `report` ou `book` com `perfil=academico` para tese, dissertação, TCC ou
  monografia;
- use `report` ou `book` com `perfil=projeto` para projeto de pesquisa;
- use `article` com `perfil=artigo` para artigo.
- use `report` ou `book` com `perfil=relatorio` para relatório técnico ou
  científico.
- use `book` ou `report` com `perfil=livro` para livro ou folheto.

As classes `abntex2`, `memoir` e KOMA-Script não são suportadas atualmente.
O `abntex3` é um pacote carregado por `\usepackage`, não uma classe usada em
`\documentclass`.

### Escolha rápida do perfil

| Perfil | Opções principais | Metadados mínimos | Estrutura verificada |
| --- | --- | --- | --- |
| Acadêmico | `perfil=academico`, `tipo-trabalho=...` | título, autoria, instituição, natureza, objetivo, área, orientação, local e data | capa, folha de rosto, aprovação, resumos nos dois idiomas, sumário e referências |
| Projeto | `perfil=projeto` | título, autoria, instituição, natureza, local e data | folha de rosto, sumário, cinco divisões textuais e referências |
| Artigo | `perfil=artigo`, `artigo-colunas=...` | título; autorias e dados próprios em `\ABNTEXartigoSetup` | elementos iniciais, introdução, desenvolvimento, considerações finais e referências |
| Relatório | `perfil=relatorio` | título, autoria, instituição, local e data; dados próprios em `\ABNTEXrelatorioSetup` | folha de rosto, resumo, sumário, três divisões, catalogação ou formulário e referências quando houver citações |
| Livro | `perfil=livro`, `tipo=livro|folheto` | título, local e data; autorias, editora, ISBN, direitos e catalogação em `\ABNTEXlivroSetup` | capa, folha de rosto, créditos, sumário, corpo e elementos condicionais declarados |

O identificador experimental `nenhum` permite usar os módulos gerais sem um
fluxo documental específico.

### Estrutura mínima do arquivo

Um documento possui um preâmbulo, antes de `\begin{document}`, e o conteúdo
propriamente dito. No preâmbulo ficam a classe, os pacotes, as opções e os
metadados:

```tex
\documentclass[12pt]{report}
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

\begin{document}
% Os comandos do perfil e o texto entram aqui.
\end{document}
```

As opções podem ser escritas em `\usepackage[...]` ou em
`\ABNTEXsetup{...}`. Recomenda-se deixar em `\usepackage` as decisões globais
e usar `\ABNTEXsetup` para os metadados. Se uma chave for repetida, o último
valor prevalece.

### Opções gerais

#### Perfil, tipo e citações

| Chave | Valores | Efeito |
| --- | --- | --- |
| `perfil` | `nenhum`, `academico`, `projeto`, `artigo`, `relatorio`, `livro` | Seleciona o fluxo documental |
| `tipo-trabalho` | `tese`, `dissertacao`, `tcc`, `monografia` | Identifica o tipo dentro do perfil acadêmico |
| `artigo-colunas` | `uma`, `duas` | Define a composição editorial do artigo; `uma` é o padrão |
| `citacoes` | `autor-data`, `numerico`, `externo` | Seleciona a integração bibliográfica |

Com `citacoes=autor-data`, o pacote carrega `biblatex-abnt` no sistema
autor-data. Com `numerico`, usa o estilo numérico. O valor inicial `externo`
não carrega nem configura `biblatex`; ele é destinado a quem deseja fazer a
integração manualmente.

#### Metadados

| Chave | Para que serve |
| --- | --- |
| `titulo`, `subtitulo` | Título principal e complemento |
| `autoria` | Autoria apresentada nos elementos gerais |
| `instituicao` | Instituição responsável ou de vínculo |
| `natureza` | Natureza declarada, como “Dissertação” ou “Projeto de pesquisa” |
| `objetivo` | Finalidade institucional, como obtenção de um título |
| `area` | Área de concentração ou conhecimento |
| `orientacao`, `coorientacao` | Pessoas responsáveis pela orientação |
| `volume` | Identificação de volume, quando houver |
| `local`, `data` | Cidade e ano ou data documental |

Os valores são impressos como foram fornecidos. O pacote não corrige nomes,
titulações, redação institucional nem conteúdo acadêmico. Um valor pode ser
recuperado, quando necessário, com `\ABNTEXmetadata{titulo}`, trocando
`titulo` por outro nome de metadado.

#### Papel, margens e impressão

| Chave | Valores ou formato | Padrão |
| --- | --- | --- |
| `papel` | `a4` | `a4` |
| `orientacao-papel` | `retrato`, `paisagem` | `retrato` |
| `impressao` | `anverso`, `frente-e-verso` | `anverso` |
| `margem-superior`, `margem-inferior` | dimensão, como `3cm` | `3cm`, `2cm` |
| `margem-interna`, `margem-externa` | dimensão, como `3cm` | `3cm`, `2cm` |
| `recuo-citacao-longa` | dimensão | `4cm` |

No modo `frente-e-verso`, as margens interna e externa são espelhadas e as
divisões primárias começam em página ímpar. Papel, orientação e margens devem
ser configurados no preâmbulo.

#### Seções, sumário e nomes

| Chave | Valores ou formato | Uso |
| --- | --- | --- |
| `profundidade-secoes` | número de `1` a `5` | Quantos níveis recebem numeração |
| `profundidade-sumario` | número de `1` a `5` | Quantos níveis aparecem no sumário |
| `largura-indicativo-sumario` | dimensão, como `6.5em` | Espaço reservado aos números no sumário |
| `nome-apendice`, `nome-anexo` | texto | Substitui os rótulos padrão |
| `separador-palavras-chave` | texto | Muda o separador visual das palavras-chave |
| `disposicao-lombada` | `descendente`, `horizontal` | Orientação do texto na prova de lombada |
| `largura-lombada` | dimensão | Largura da prova de lombada |
| `debug` | opção booleana experimental | Ativa mensagens adicionais de diagnóstico |

### Perfil acadêmico

Use o perfil acadêmico para tese, dissertação, TCC ou monografia:

```tex
\usepackage[
  perfil=academico,
  tipo-trabalho=tese,
  citacoes=autor-data
]{abntex3}
```

A troca entre os quatro tipos altera a identificação e a validação do tipo,
mas não preenche os metadados nem remove elementos automaticamente. As
diferenças institucionais devem ser expressas em `natureza`, `objetivo`,
`area`, `instituicao`, `orientacao` e `coorientacao`.

#### Fluxo acadêmico

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

A ordem esperada e os elementos são:

| Parte | Normalmente obrigatórios | Opcionais ou condicionais |
| --- | --- | --- |
| Externa | capa | lombada |
| Pré-textual | folha de rosto, aprovação, resumos nos dois idiomas e sumário | ficha catalográfica, errata, dedicatória, agradecimentos, epígrafe e listas |
| Textual | conteúdo organizado pela autoria | nomes e quantidade das divisões |
| Pós-textual | referências | glossário, apêndices, anexos e índice |

Os comandos completos mais comuns são:

```tex
\ABNTEXfichacatalografica{Conteúdo preparado pelo serviço responsável}
\ABNTEXerrata{Referência do trabalho}{Tabela ou texto das correções}
\ABNTEXdedicatoria{Texto da dedicatória}
\ABNTEXagradecimentos{Texto dos agradecimentos}
\ABNTEXepigrafe[Autoria]{Texto da epígrafe}

\ABNTEXabreviatura{Fil.}{Filosofia}
\ABNTEXsigla{ABNT}{Associação Brasileira de Normas Técnicas}
\ABNTEXsimbolo{$n$}{Quantidade de elementos}
\ABNTEXlistadeilustracoes
\ABNTEXlistadetabelas
\ABNTEXlistadeabreviaturasesiglas
\ABNTEXlistadesimbolos
```

A ficha catalográfica recebe conteúdo externo; o pacote não produz
classificação ou descrição catalográfica. Uma lista declarativa vazia não
gera página.

### Perfil de projeto de pesquisa

O projeto possui um fluxo próprio e cinco divisões textuais verificadas:

```tex
\usepackage[perfil=projeto,citacoes=autor-data]{abntex3}

\begin{document}
\ABNTEXprojetoexterna
% \ABNTEXcapa % opcional no projeto

\ABNTEXprojetopretextual
\ABNTEXfolhaderosto
\ABNTEXsumario

\ABNTEXprojetotextual
\ABNTEXprojetointroducao{Tema, problema, hipóteses, objetivos e justificativa.}
\ABNTEXprojetoreferencialteorico{Fundamentação da pesquisa.}
\ABNTEXprojetometodologia{Métodos, técnicas e procedimentos.}
\ABNTEXprojetorecursos{Recursos humanos, materiais e financeiros.}
\ABNTEXprojetocronograma{Etapas e prazos.}

\ABNTEXprojetopostextual
\ABNTEXbibliografia
\end{document}
```

Ao contrário do perfil acadêmico, a capa é opcional. Folha de rosto, sumário,
as cinco divisões e referências são verificados. O pacote confirma que cada
divisão existe, mas não avalia intelectualmente seu conteúdo.

### Perfil de artigo

O artigo usa `article`, registra cada autoria separadamente e mantém seus
dados editoriais em uma configuração própria:

```tex
\documentclass[12pt]{article}
\usepackage[
  perfil=artigo,
  artigo-colunas=uma,
  citacoes=autor-data
]{abntex3}

\ABNTEXsetup{titulo={Título do artigo}, subtitulo={Subtítulo}}
\ABNTEXartigoSetup{
  titulo-outro-idioma={Article title},
  resumo={Texto do resumo.},
  palavras-chave={normalização; documentação},
  resumo-outro-idioma={Abstract text.},
  palavras-chave-outro-idioma={standardization; documentation},
  data-submissao={10 de janeiro de 2026},
  data-aprovacao={20 de março de 2026},
  identificacao-disponibilidade={DOI: 10.0000/exemplo}
}
\ABNTEXartigoautor
  {Nome da autoria}
  {Currículo breve ou titulação}
  {Instituição de vínculo}
  {email@example.org}
```

Repita `\ABNTEXartigoautor` para cada pessoa. Título, ao menos uma autoria,
resumo, palavras-chave e as duas datas editoriais são verificados. Título,
resumo e palavras-chave em outro idioma, assim como DOI ou outra identificação
de disponibilidade, são opcionais.

O corpo é composto assim:

```tex
\ABNTEXartigopretextual
\ABNTEXartigotextual
\ABNTEXartigointroducao{Conteúdo da introdução.}
\ABNTEXartigodesenvolvimento[Resultados e discussão]{Conteúdo.}
\ABNTEXartigoconsideracoesfinais{Conteúdo final.}
\ABNTEXartigopostextual
\ABNTEXbibliografia
\ABNTEXartigoagradecimentos{Agradecimentos, quando houver.}
```

O texto entre colchetes substitui o título padrão da divisão. Os
agradecimentos, quando presentes, devem ser o último elemento. Uma ou duas
colunas são escolhas editoriais; nenhuma delas constitui, isoladamente, uma
exigência normativa.

### Perfil de relatório técnico ou científico

O relatório usa metadados próprios além de título, autoria, instituição,
local e data:

```tex
\usepackage[perfil=relatorio, citacoes=autor-data]{abntex3}
\ABNTEXrelatorioSetup{
  projeto-programa-plano={Programa relacionado},
  numero-relatorio={RT-2026-001},
  tipo-relatorio={relatório técnico},
  resumo={Texto do resumo.},
  palavras-chave={documentação, relatório},
  possui-citacoes=sim
}
\ABNTEXrelatoriomembroequipe
  {Nome}{Função ou qualificação}{Instituição}
```

No documento, use `\ABNTEXrelatorioexterna`,
`\ABNTEXrelatoriopretextual`, `\ABNTEXrelatoriotextual` e
`\ABNTEXrelatoriopostextual`. A capa e a equipe são opcionais; folha de rosto,
resumo, sumário, introdução, desenvolvimento e considerações finais são
verificados. Ao final, inclua dados catalográficos com
`\ABNTEXfichacatalografica` ou o formulário próprio com
`\ABNTEXrelatorioformulario`.

O exemplo completo está em
[`examples/relatorio-tecnico.tex`](examples/relatorio-tecnico.tex).

### Perfil de livro ou folheto

Use `perfil=livro` sobre `book` ou `report`. Além dos metadados gerais,
declare os dados editoriais e registre cada autoria separadamente:

```tex
\usepackage[perfil=livro, citacoes=autor-data]{abntex3}
\ABNTEXlivroSetup{
  tipo=livro,
  meio=impresso,
  editora={Editora Exemplo},
  isbn={978-65-00000-00-0},
  numero-paginas=120,
  ano-direito-autoral={2026},
  detentor-direito-autoral={Editora Exemplo},
  direito-reproducao={Texto definido pela editora},
  dados-catalogacao={Ficha fornecida por profissional habilitado}
}
\ABNTEXlivroautor{Ana Silva}{autora}
```

No documento, coordene `\ABNTEXlivroexterna`,
`\ABNTEXlivropretextual`, `\ABNTEXlivrotextual` e
`\ABNTEXlivropostextual`. O pacote valida capa, folha de rosto, créditos,
sumário e corpo, além de lombada, folhas de guarda, referências e índice
quando declarados. O arquivo [`examples/livro.tex`](examples/livro.tex)
demonstra o fluxo completo; a referência está em
[`docs/profile-book.md`](docs/profile-book.md).

### Recursos comuns aos perfis

#### Citações, figuras e tabelas

Com `citacoes=autor-data` ou `numerico`, use os comandos normais do
`biblatex`, por exemplo `\textcite{chave}`, `\parencite{chave}` e
`\footcite{chave}`. Uma citação longa pode ser composta com:

```tex
\begin{ABNTEXcitacaolonga}
Texto da citação direta longa. \parencite[42]{chave}
\end{ABNTEXcitacaolonga}
```

Em figuras e tabelas, `\ABNTEXfonte` e `\ABNTEXnota` complementam a legenda:

```tex
\begin{figure}
  \centering
  \rule{6cm}{3cm}
  \caption{Descrição da figura}
  \ABNTEXfonte{Elaboração própria}
  \ABNTEXnota{Informação complementar, quando necessária}
\end{figure}
```

#### Referências, glossário, apêndices, anexos e índice

```tex
\ABNTEXbibliografia
\ABNTEXglossario
\ABNTEXappendix{Instrumento de pesquisa}
\ABNTEXannex{Documento fornecido por outra entidade}
\ABNTEXindice
```

Apêndice é material elaborado pela autoria; anexo é material de outra origem.
Para o glossário, carregue e configure `glossaries` ou `glossaries-extra`.
Para o índice, carregue `makeidx`, execute `\makeindex` no preâmbulo e marque
termos com `\index{termo}`. O `abntex3` posiciona e intitula esses elementos,
enquanto os pacotes externos cuidam das entradas e da ordenação.

### Personalização de títulos de seções

As classes têm nomes diferentes para o primeiro nível: `article` usa
`\section`, enquanto `report` e `book` usam `\chapter`. O pacote coordena até
cinco níveis. É possível mudar a apresentação de um nível:

```tex
\ABNTEXstructureSetup{1}{
  destaque      = negrito,
  alinhamento   = esquerda,
  espaco-antes  = 3ex,
  espaco-depois = 1.5ex
}
```

`destaque` aceita `normal`, `negrito`, `italico`, `negrito-italico` e
`versalete`; `alinhamento` aceita `esquerda`, `centro` e `direita`. Algumas
instituições impõem estilos próprios, portanto personalizar a apresentação
pode representar uma escolha institucional deliberada.

### Compilação

Para um documento simples, duas execuções de `lualatex` atualizam referências
internas, listas e sumário. Com bibliografia processada pelo `biber`, use:

```sh
lualatex trabalho.tex
biber trabalho
lualatex trabalho.tex
lualatex trabalho.tex
```

Se houver glossário ou índice, execute também os respectivos processadores
entre a primeira e as últimas passagens:

```sh
lualatex trabalho.tex
biber trabalho
makeglossaries trabalho
makeindex trabalho
lualatex trabalho.tex
lualatex trabalho.tex
```

O nome passado a `biber`, `makeglossaries` e `makeindex` não inclui a extensão
`.tex`. Mensagens sobre referências indefinidas na primeira passagem são
normais; elas devem desaparecer nas passagens finais.

### O que a validação faz — e o que não faz

Os comandos coordenadores registram a ordem das partes e, ao final, avisam
sobre metadados ou elementos obrigatórios ausentes. Também é possível chamar
explicitamente `\ABNTEXvalidateacademico`, `\ABNTEXvalidateprojeto`,
`\ABNTEXvalidateartigo`, `\ABNTEXvalidaterelatorio` ou
`\ABNTEXvalidatelivro`.

A validação confirma completude técnica observável. Ela não:

- avalia a qualidade da redação ou da pesquisa;
- cria dados catalográficos;
- decide regras particulares da instituição ou do periódico;
- garante que uma referência foi preenchida semanticamente de forma correta;
- substitui revisão humana ou consulta às normas aplicáveis.

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
O perfil de projeto de pesquisa está documentado em
[`docs/profile-project.md`](docs/profile-project.md), o perfil de artigo em
[`docs/profile-article.md`](docs/profile-article.md) e o perfil de relatório em
[`docs/profile-report.md`](docs/profile-report.md). O perfil de livro ou
folheto está em [`docs/profile-book.md`](docs/profile-book.md).

## Desenvolvimento

O projeto usa `l3build`. Uma instalação TeX Live completa e atual permite
executar:

```sh
l3build unpack
l3build check
l3build doc
l3build install --texmfhome /caminho/temporario/texmf
l3build ctan
./scripts/check-release.sh
./scripts/quality-audit.sh
./scripts/validate-distribution.sh
```

`l3build check` executa os testes exclusivamente com LuaLaTeX. A integração
contínua repete a suíte no TeX Live 2024, 2025 e 2026 no Linux e no TeX Live
2026 em Windows e macOS. A auditoria adicional verifica metadados, marcadores,
ligações, mensagens, desempenho, dependências e uma página de regressão
visual. Consulte
[`docs/qualidade-portabilidade.md`](docs/qualidade-portabilidade.md) para o
escopo e as limitações. `l3build ctan` já
executa testes e documentação antes de empacotar; por isso o trabalho de
distribuição não repete esses comandos. O último comando valida o pacote CTAN
de ensaio, sem publicá-lo, e compila os exemplos tanto a partir de uma
instalação isolada quanto da árvore TDS empacotada.

Nos pull requests, alterações limitadas à documentação executam somente a
validação rápida de diferenças. Mudanças em fontes, testes, exemplos, scripts,
build, manifesto ou workflows acionam a matriz TeX completa. Execuções manuais
também são sempre completas.

## Governança e colaboração

- [`AGENTS.md`](AGENTS.md) — decisões operacionais persistentes entre máquinas
  e agentes;
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
