# Estrutura, seções e sumário

O módulo `abntex3-structure` adapta a hierarquia das classes `article`,
`report` e `book` a cinco níveis progressivos. Ele é carregado
automaticamente por `abntex3`; não deve ser carregado diretamente.

Esta implementação segue requisitos rastreados das ABNT NBR 6024:2012 e
6027:2012, mas ainda aguarda revisão normativa independente e não constitui
alegação de conformidade.

## Hierarquia

| Nível | `article` | `report` e `book` |
| ---: | --- | --- |
| 1 | `\section` | `\chapter` |
| 2 | `\subsection` | `\section` |
| 3 | `\subsubsection` | `\subsection` |
| 4 | `\paragraph` | `\subsubsection` |
| 5 | `\subparagraph` | `\paragraph` |

Os indicativos usam os contadores hierárquicos das classes-base. O módulo
remove prefixos como “Capítulo” da composição do indicativo, mantém um espaço
entre o número e o título e alinha títulos longos a partir do início do
título.

As profundidades são configuradas no carregamento ou no preâmbulo:

```tex
\usepackage[
  profundidade-secoes=5,
  profundidade-sumario=3
]{abntex3}

\ABNTEXsetup{
  profundidade-secoes  = 4,
  profundidade-sumario = 4
}
```

Os valores aceitos vão de `1` a `5`. Configurações feitas com
`\ABNTEXsetup` devem permanecer no preâmbulo.

## Apresentação por nível

`\ABNTEXstructureSetup{<nível>}{<chaves>}` controla:

- `destaque`: `normal`, `negrito`, `italico`, `negrito-italico` ou
  `versalete`;
- `alinhamento`: `esquerda`, `centro` ou `direita`;
- `espaco-antes`;
- `espaco-depois`.

Exemplo:

```tex
\ABNTEXstructureSetup{1}{
  destaque      = negrito,
  alinhamento   = esquerda,
  espaco-antes  = 3ex,
  espaco-depois = 1.5ex
}
\ABNTEXstructureSetup{3}{destaque=italico}
```

O padrão é alinhado à esquerda. `centro` e `direita` são extensões para
requisitos institucionais e representam divergência deliberada quando
aplicados a seções numeradas.

## Títulos sem indicativo

Use `\ABNTEXpretextualtitle` para um título pré-textual centralizado que não
deve aparecer no sumário:

```tex
\ABNTEXpretextualtitle{Agradecimentos}
```

Use `\ABNTEXposttextualtitle` para um título pós-textual centralizado com
entrada no sumário:

```tex
\ABNTEXposttextualtitle{Referências}
```

Ambos reutilizam o destaque configurado para o nível primário.

## Sumário

`\ABNTEXsumario` começa uma nova página e chama o sumário da classe com título
centralizado. A profundidade é controlada por `profundidade-sumario`. Cada
nível do sumário reutiliza o destaque do nível correspondente no texto.

A coluna reservada aos indicativos pode ser ajustada:

```tex
\ABNTEXsetup{largura-indicativo-sumario=6.5em}
```

O valor padrão é `5.5em`. Entradas pós-textuais criadas pelo módulo recebem
uma caixa de indicativo vazia e começam na mesma margem dos demais títulos.
Quando `hyperref` está carregado, a integração normal do LaTeX mantém as
entradas clicáveis.

## Apêndices e anexos

Os comandos abaixo mantêm contadores alfabéticos independentes e criam
títulos centralizados com entradas pós-textuais:

```tex
\ABNTEXappendix{Questionário aplicado}
\ABNTEXappendix{Dados complementares}
\ABNTEXannex{Autorização institucional}
```

Os rótulos podem ser alterados no preâmbulo por `nome-apendice` e
`nome-anexo`. Essa interface não altera os contadores de capítulos ou seções.

## Limites atuais

- a ordem completa dos elementos pré-textuais será coordenada no Marco 5;
- alíneas e subalíneas ainda não possuem uma API própria;
- documentos multilíngues ou multivolume exigem coordenação editorial;
- classes `memoir` e KOMA-Script ainda não são suportadas;
- entradas gravadas manualmente por outros pacotes não são reescritas.

As interpretações e evidências detalhadas estão em
[`nbr-6024-2012.md`](requisitos/nbr-6024-2012.md) e
[`nbr-6027-2012.md`](requisitos/nbr-6027-2012.md).
