# Perfil de livro ou folheto

O módulo `abntex3-profile-book` coordena publicações editoriais conforme a
ABNT NBR 6029:2023. Ele não substitui editora, profissional de biblioteconomia,
agência de ISBN, projeto gráfico ou revisão humana.

## Configuração

Use a classe `book` ou `report` e selecione o perfil:

```tex
\usepackage[perfil=livro]{abntex3}
\ABNTEXsetup{
  titulo={Título da obra},
  subtitulo={Subtítulo},
  volume={1},
  local={Recife},
  data={2026}
}
```

Os dados editoriais ficam em configuração própria:

```tex
\ABNTEXlivroSetup{
  tipo=livro,
  meio=impresso,
  editora={Editora Exemplo},
  isbn={978-65-00000-00-0},
  edicao={2},
  numero-paginas=120,
  ano-direito-autoral={2026},
  detentor-direito-autoral={Editora Exemplo},
  direito-reproducao={Texto definido pela editora},
  dados-catalogacao={Ficha fornecida por profissional habilitado},
  capa-dura=sim,
  comporta-lombada=sim,
  possui-referencias=sim,
  possui-indice=sim
}
```

`tipo` aceita `livro` ou `folheto`; `meio` aceita `impresso` ou
`eletronico`. A faixa de páginas declarada é verificada contra o tipo, mas o
pacote não calcula o total editorial automaticamente. O ISBN da versão
digital deve ser o atribuído especificamente àquele suporte.

## Autorias e colaboradores

Registre as pessoas ou entidades e a participação:

```tex
\ABNTEXlivroautor{Ana Silva}{autora}
\ABNTEXlivroautor{Bruno Lima}{organizador}
\ABNTEXlivrocolaborador{Carla Souza}{tradutora}
```

As autorias atualizam o metadado geral `autoria` para integração com os
módulos compartilhados. Colaboradores aparecem na folha de rosto.

## Fluxo

```tex
\ABNTEXlivroexterna
\ABNTEXlivrocapa
% \ABNTEXlombada                 % quando comporta-lombada=sim
% \ABNTEXlivrofolhasdeguarda     % quando capa-dura=sim
% \ABNTEXlivroorelha{autoria}{obra}

\ABNTEXlivropretextual
% \ABNTEXlivrofalsafolhaderosto[identificação da série]
\ABNTEXlivrofolhaderosto
\ABNTEXlivrocreditos
% demais pré-textuais opcionais
\ABNTEXsumario

\ABNTEXlivrotextual
% \ABNTEXlivroprefacio{...}
\ABNTEXlivroparte{Título da parte}
\ABNTEXlivrocapitulo{Título do capítulo}

\ABNTEXlivropostextual
% \ABNTEXlivroposfacio{...}
% referências, glossário, apêndices, anexos e índice
% \ABNTEXlivrocolofao{dados de produção}
```

`\ABNTEXlivrocapa` gera uma prova sequencial da primeira e da quarta capas.
Ela serve para verificar conteúdo, não para substituir o arquivo gráfico de
produção. A sobrecapa completa e as folhas físicas são responsabilidades do
projeto editorial.

## Validação

`\ABNTEXvalidatelivro` verifica:

- tipo, meio, total declarado, editora e ISBN;
- ao menos uma autoria;
- direitos de autor, reprodução e dados catalográficos fornecidos;
- capa, folha de rosto, créditos, sumário e ao menos um capítulo;
- folhas de guarda, lombada, referências e índice quando declarados;
- ordem das quatro fases.

O exemplo [`examples/livro.tex`](../examples/livro.tex) demonstra duas
autorias, colaboração, volume, capa dura, lombada, elementos opcionais,
bibliografia, glossário, índice e colofão.

Os requisitos estão rastreados em
[`requisitos/nbr-6029-2023.md`](requisitos/nbr-6029-2023.md). Ainda é
necessária revisão normativa independente antes de alegar conformidade ou
encerrar formalmente o Marco 11.
