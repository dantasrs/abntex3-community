# Elementos pós-textuais e bibliografia

O módulo `abntex3-backmatter` coordena a parte pós-textual sem reimplementar
estilos bibliográficos. A API permanece experimental na versão `0.0.0`.

## Início da parte pós-textual

Use:

```tex
\ABNTEXposttextualpages
```

O comando abre uma nova página, mantém a numeração arábica e preserva a
sequência iniciada na parte textual.

## Citações e referências

Há três modos:

```tex
\usepackage[citacoes=autor-data]{abntex3}
\usepackage[citacoes=numerico]{abntex3}
\usepackage[citacoes=externo]{abntex3} % valor inicial
```

`autor-data` carrega `biblatex` com `backend=biber,style=abnt`; `numerico` usa
`backend=biber,style=abnt-numeric`. A escolha é explícita.

O modo inicial `externo` não carrega `biblatex` nem escolhe estilo. Ele permite
que o usuário o configure antes do `abntex3`:

```tex
\usepackage[backend=biber,style=abnt]{biblatex}
\usepackage{abntex3}
```

Adicione o banco e cite usando diretamente a API do `biblatex`:

```tex
\addbibresource{referencias.bib}

Segundo \textcite{silva2025}, ...
... em análise anterior \parencite[42]{silva2025}.
\footcite[18]{silva2025}
```

Para imprimir a lista:

```tex
\ABNTEXbibliografia
\ABNTEXbibliografia[Fontes consultadas][keyword=principal]
```

O primeiro argumento muda o título; o segundo é encaminhado a
`\printbibliography`. A lista recebe espaço simples, alinhamento à esquerda e
uma linha simples de separação.

A sequência mínima de compilação é:

```console
pdflatex documento
biber documento
pdflatex documento
pdflatex documento
```

O pacote avisa quando a opção integrada foi selecionada e o `.bbl` ainda não
existe. A disponibilidade do executável `biber` é validada pelo ensaio de
distribuição.

## Citações longas

O conteúdo físico continua sendo responsabilidade do ambiente do módulo de
layout; a chamada é fornecida pelo `biblatex`:

```tex
\begin{ABNTEXcitacaolonga}
Texto da citação direta longa. \parencite[42]{silva2025}
\end{ABNTEXcitacaolonga}
```

## Glossário

O abnTeX3 não carrega `glossaries` nem `glossaries-extra`. Depois de configurar
um deles no preâmbulo, use:

```tex
\ABNTEXglossario
\ABNTEXglossario[Glossário técnico][type=main]
```

O título e a entrada no sumário são produzidos pelo abnTeX3; as entradas, a
ordenação e os arquivos auxiliares pertencem ao pacote de glossário.

## Apêndices e anexos

As interfaces do módulo estrutural participam agora da validação de ordem:

```tex
\ABNTEXappendix{Instrumento de pesquisa}
\ABNTEXannex{Documento institucional}
```

Os contadores alfabéticos continuam independentes e a paginação não é
reiniciada.

## Índice

Carregue e inicialize um gerador compatível, por exemplo:

```tex
\usepackage{makeidx}
\makeindex
...
\index{termo}
...
\ABNTEXindice
```

O argumento opcional define um título mais específico, como
`\ABNTEXindice[Índice de assuntos]`. Ordenação, remissivas, recuos e estilo das
entradas pertencem ao gerador.

## Diagnósticos

O módulo informa:

- bibliografia não configurada;
- arquivos do `biblatex-abnt` ausentes;
- estilo incompatível com o sistema solicitado;
- versões anteriores às mínimas testadas;
- arquivo `.bbl` ausente;
- pacote de glossário ou índice não carregado;
- elementos pós-textuais fora da ordem recomendada.

## Responsabilidades dos projetos

| Tema | `abntex3` | `biblatex-abnt` ou gerador externo |
| --- | --- | --- |
| posição, título e sumário da lista de referências | sim | não |
| espaço e alinhamento da lista | sim | coopera |
| drivers e campos bibliográficos | não | `biblatex-abnt` |
| chamadas autor-data e numéricas | apenas escolhe explicitamente | `biblatex-abnt` |
| processamento do banco `.bib` | não | `biber` |
| seleção e ordenação do glossário | não | pacote de glossário |
| seleção, remissivas e ordenação do índice | não | gerador de índice |

As matrizes normativas registram o limite em detalhe. Integração técnica
funcional não equivale a conformidade automática das saídas dos projetos
externos com todas as edições normativas mais recentes.
