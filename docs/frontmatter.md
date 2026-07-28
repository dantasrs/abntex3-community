# Elementos pré-textuais e listas

O Marco 5 implementa a composição da parte externa, dos elementos
pré-textuais e de suas listas por meio de comandos públicos. O módulo se
baseia nas ABNT NBR 14724:2024, 12225:2023 e 6028:2021. As interpretações
continuam sujeitas a revisão normativa independente.

## Sequência recomendada

Uma sequência acadêmica completa pode ser escrita assim:

```tex
\ABNTEXcapa
\ABNTEXlombada

\ABNTEXpretextualpages
\ABNTEXfolhaderosto
\ABNTEXfichacatalografica{...}
\ABNTEXerrata{<referência>}{<correções>}
\ABNTEXfolhadeaprovacao{<data>}{<banca>}
\ABNTEXdedicatoria{...}
\ABNTEXagradecimentos{...}
\ABNTEXepigrafe[<autoria>]{...}
\ABNTEXresumo{<texto>}{<palavras-chave>}
\ABNTEXresumoemlinguaestrangeira{<texto>}{<palavras-chave>}
\ABNTEXlistadeilustracoes
\ABNTEXlistadetabelas
\ABNTEXlistadeabreviaturas
\ABNTEXlistadesiglas
\ABNTEXlistadesimbolos
\ABNTEXsumario

\ABNTEXtextualpages
```

A capa e a prova de lombada precedem o início da contagem. A folha de rosto
inicia os elementos internos. A ficha catalográfica ocupa uma face física,
mas o comando compensa o contador para que ela não seja contada. Os elementos
opcionais ausentes não criam páginas vazias.

O módulo registra a ordem dos comandos e avisa quando um elemento é composto
depois de outro que normativamente deveria sucedê-lo. No perfil `academico`,
`\ABNTEXvalidatepretextual` verifica a presença de capa, folha de rosto,
folha de aprovação, resumos nos dois idiomas e sumário. A transição
`\ABNTEXtextualpages` executa a mesma verificação.

## Metadados

A capa, a lombada, a folha de rosto e a folha de aprovação reutilizam:

- `titulo`, `subtitulo`, `autoria` e `instituicao`;
- `natureza`, `objetivo` e `area`;
- `orientacao` e a nova chave opcional `coorientacao`;
- a nova chave opcional `volume`;
- `local` e `data`.

`data` deve conter o ano de depósito quando for empregado nesses elementos.
O conteúdo semântico, as titulações e a grafia dos nomes permanecem sob
responsabilidade do autor e da instituição.

## Capa e lombada

`\ABNTEXcapa` organiza instituição opcional, autoria, título, subtítulo,
volume, local e ano. `\ABNTEXlombada[<identificação>][<instituição ou
logomarca>]` produz uma prova gráfica estreita para conferência.

As opções são:

- `disposicao-lombada=descendente|horizontal`;
- `largura-lombada=<dimensão>`.

A largura final, a integração com a capa aberta, a sangria, a espessura do
papel e o arquivo de produção gráfica dependem da encadernadora ou editora.
A prova do pacote não substitui o gabarito do fornecedor.

## Folha de rosto e ficha catalográfica

`\ABNTEXfolhaderosto` apresenta os metadados de identificação e a natureza do
trabalho. A natureza ocupa a metade direita da mancha e usa espaço simples.

`\ABNTEXfichacatalografica{<conteúdo>}` é deliberadamente um ponto de
extensão. O pacote não inventa número de classificação, notação de autor nem
descrição catalográfica. Esses dados devem ser preparados conforme o código
de catalogação vigente pelo profissional ou serviço responsável.

## Errata e aprovação

`\ABNTEXerrata{<referência>}{<correções>}` recebe conteúdo livre para permitir
uma tabela compatível com as necessidades do documento.

`\ABNTEXfolhadeaprovacao{<data>}{<banca>}` recebe os componentes da banca no
segundo argumento. Cada componente pode ser composto com:

```tex
\ABNTEXmembrobanca{<nome>}{<titulação ou função>}{<instituição>}
```

A assinatura e a data definitivas devem ser inseridas após a aprovação.

## Dedicatória, agradecimentos e epígrafe

`\ABNTEXdedicatoria` e `\ABNTEXepigrafe` usam a metade direita da mancha, na
parte inferior. A epígrafe recebe uma indicação opcional de autoria.
`\ABNTEXagradecimentos` possui título centralizado.

## Resumos e palavras-chave

`\ABNTEXresumo{<texto>}{<lista>}` usa os rótulos `Resumo` e
`Palavras-chave`. A variante estrangeira aceita rótulos opcionais:

```tex
\ABNTEXresumoemlinguaestrangeira
  [Resumen][Palabras clave]{<texto>}{<lista>}
```

As palavras são fornecidas como lista separada por vírgulas. Na saída, o
separador inicial é ponto e vírgula e o conjunto termina com ponto. A opção
`separador-palavras-chave` permite outra convenção institucional.

O pacote não reescreve o resumo, não altera automaticamente maiúsculas e
minúsculas e não decide se o texto é informativo ou indicativo. A contagem de
palavras e a redação em parágrafo único permanecem verificações editoriais.

## Listas

As listas de ilustrações e tabelas reutilizam as entradas gravadas por
`\caption`; por isso, o documento deve ser compilado pelo menos duas vezes.

Abreviaturas, siglas e símbolos são declarados no preâmbulo ou antes das
listas:

```tex
\ABNTEXabreviatura{Fil.}{Filosofia}
\ABNTEXsigla{ABNT}{Associação Brasileira de Normas Técnicas}
\ABNTEXsimbolo{$n$}{Quantidade de elementos}
```

Abreviaturas e siglas são ordenadas alfabeticamente. Símbolos preservam a
ordem de declaração. Também existe
`\ABNTEXlistadeabreviaturasesiglas` para produzir uma lista combinada.
Uma lista declarativa vazia não gera título nem página.

## Limites atuais

- a obrigatoriedade é verificada apenas para o perfil `academico`;
- o perfil acadêmico completo e suas variações institucionais pertencem ao
  Marco 7;
- a lombada é uma prova, não um arquivo gráfico de capa aberta;
- os dados catalográficos são conteúdo profissional externo;
- listas específicas de outros tipos de ilustração podem ser criadas com os
  mecanismos de `caption`, mas ainda não têm atalhos próprios;
- os resumos não recebem validação linguística ou semântica automática.

As matrizes detalhadas estão em
[`nbr-14724-2024.md`](requisitos/nbr-14724-2024.md),
[`nbr-12225-2023.md`](requisitos/nbr-12225-2023.md) e
[`nbr-6028-2021.md`](requisitos/nbr-6028-2021.md).
