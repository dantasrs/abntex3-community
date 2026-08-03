# Layout e paginação

O módulo `abntex3-layout` implementa o recorte de apresentação geral da
ABNT NBR 14724:2024 aplicável ao Marco 4. Ele funciona sobre `article`,
`report` e `book`, sem transformar o projeto em uma classe.

Esta implementação ainda requer revisão normativa independente e não
constitui alegação de conformidade.

## Configuração inicial

As opções podem ser passadas ao pacote ou a `\ABNTEXsetup` no preâmbulo:

```tex
\documentclass[12pt]{book}
\usepackage[
  papel=a4,
  orientacao-papel=retrato,
  impressao=frente-e-verso,
  margem-superior=3cm,
  margem-inferior=2cm,
  margem-interna=3cm,
  margem-externa=2cm
]{abntex3}
```

Os padrões são A4 em retrato, impressão apenas no anverso, margens superior e
interna de 3 cm e margens inferior e externa de 2 cm. No modo frente e verso,
as margens interna e externa são espelhadas. `paisagem` é uma extensão
configurável para necessidades institucionais e não é o padrão normativo.

As chaves que mudam papel, orientação ou margens são restritas ao preâmbulo,
pois alteram a geometria física do documento.

## Política tipográfica

O pacote não escolhe família tipográfica. Essa decisão reflete os requisitos
normativos, que não elegem Arial, Times New Roman ou outra família:

- a ABNT NBR 14724:2024, 5.1, recomenda fonte tamanho 12 para o trabalho
  acadêmico e tamanho menor uniforme para as exceções que enumera;
- a ABNT NBR 10719:2015, 5.1, recomenda tamanho 12 e um tipo de fonte
  padronizado em todo o relatório, sem nomear uma família;
- a ABNT NBR 6022:2018, 6.1, recomenda tamanho 12 e uniformidade no artigo e
  atribui o projeto gráfico ao editor.

Assim, regras como “Arial ou Times New Roman” normalmente pertencem ao manual
da instituição, às instruções do periódico ou ao projeto da editora. Esses
documentos locais devem ser consultados e prevalecem na escolha editorial.

Para um trabalho acadêmico sem exigência institucional de família, uma família
Times é uma recomendação prática conservadora, pois é recorrente em modelos
institucionais. Isso não a transforma em “fonte da ABNT”. Com LuaLaTeX, a
família pode ser escolhida explicitamente:

```tex
\usepackage{fontspec}
\setmainfont{TeX Gyre Termes}
```

`TeX Gyre Termes` é uma alternativa livre de desenho compatível com Times e
normalmente está disponível no TeX Live. Ela não é o mesmo arquivo tipográfico
que Times New Roman; quando uma instituição exigir essa família nominalmente,
use `\setmainfont{Times New Roman}` se a fonte estiver instalada e licenciada
no sistema, ou confirme se a alternativa é aceita.

O tamanho normal continua sendo definido pela opção da classe; os exemplos
usam 12 pt. Isso preserva a escolha editorial e evita substituir fontes de
forma silenciosa.

O texto geral recebe espaçamento de um e meio. Citações longas, notas de
rodapé, títulos, fontes e notas de ilustrações e tabelas usam tamanho menor
uniforme e espaço simples. Outros elementos de perfis, como natureza do
trabalho e referências, serão configurados nos módulos responsáveis.

## Contagem e exibição das páginas

```tex
\ABNTEXpretextualpages
% elementos contados, mas sem número impresso

\ABNTEXtextualpages
% primeira página textual: número arábico no cabeçalho
```

`\ABNTEXpretextualpages` inicia a contagem em 1 e oculta os números.
`\ABNTEXtextualpages` preserva a contagem e começa a exibi-la. Elementos que
não participam da contagem, como a capa, devem vir antes do primeiro comando;
o tratamento completo deles pertence ao módulo de elementos pré-textuais.

No modo `anverso`, a parte textual e cada seção primária começam em nova
página. No modo `frente-e-verso`, começam em página ímpar. As páginas vazias
inseridas para ajustar a paridade não mostram cabeçalho ou rodapé.

O número fica no alto à direita das páginas ímpares e no alto à esquerda das
páginas pares. Não são acrescentados títulos correntes ao cabeçalho.

## Citações longas, notas e ilustrações

```tex
\begin{ABNTEXcitacaolonga}
Texto da citação direta longa.
\end{ABNTEXcitacaolonga}

\begin{figure}
  \centering
  \rule{6cm}{3cm}
  \caption{Representação usada no exemplo}
  \ABNTEXfonte{elaboração própria}
  \ABNTEXnota{medidas meramente ilustrativas}
\end{figure}
```

O recuo inicial da citação longa é 4 cm. Ele pode ser alterado globalmente
com `recuo-citacao-longa` ou localmente pelo argumento opcional do ambiente.
A chamada bibliográfica pode ser inserida no ambiente pela integração com
`biblatex-abnt` descrita em [`backmatter.md`](backmatter.md).

Notas de rodapé recebem espaço simples, tamanho menor, filete de 5 cm e
alinhamento suspenso que mantém o expoente destacado. `\caption`,
`\ABNTEXfonte` e `\ABNTEXnota` adotam tamanho menor e espaço simples, mas a
autoria e a redação das fontes permanecem responsabilidade do usuário.
Figuras e tabelas usam sequências contínuas, sem reinício por capítulo.

No modo frente e verso, o módulo acompanha separadamente as faces físicas
enviadas ao PDF e o contador documental. Essa distinção mantém as aberturas
no anverso mesmo quando a ficha catalográfica ocupa uma face que não entra na
contagem.

## Limites atuais

- capa, ficha catalográfica e demais elementos pré-textuais são tratados pelo
  módulo `abntex3-frontmatter`;
- referências e integração de citações pertencem ao módulo
  `abntex3-backmatter`;
- o perfil acadêmico completo e sua sequência de elementos pertencem ao
  Marco 7;
- cor do texto, proximidade editorial de figuras e conteúdo das legendas não
  podem ser validados de modo confiável pelo pacote;
- a matriz detalhada está em
  [`requisitos/nbr-14724-2024.md`](requisitos/nbr-14724-2024.md).
