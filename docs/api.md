# API pública

Este documento descreve o contrato iniciado no Marco 2 e ampliado nos
Marcos 3 a 11. A versão `0.0.0` continua experimental. Os módulos estrutural,
de layout, pré-textual e pós-textual e os perfis acadêmico, de projeto, de
artigo, de relatório e de livro possuem rastreabilidade normativa, mas ainda aguardam
revisão independente e não fazem alegação de conformidade.

## Compatibilidade durante a migração

O módulo opcional `abntex3-compat` fornece aliases temporários para metadados,
fases e elementos do abnTeX2 que têm correspondência direta. Ele é carregado
separadamente, emite avisos de depreciação e não faz parte da API nativa a ser
preservada. A classificação completa está em
[`compatibilidade.md`](compatibilidade.md).

## Carregamento e classes

O pacote deve ser carregado sobre `article`, `report` ou `book`:

```tex
\documentclass{article}
\usepackage[perfil=academico]{abntex3}
```

`abntex2` é uma classe conflitante, e `abntex2cite` é um pacote conflitante.
A integração bibliográfica é delegada ao `biblatex-abnt`.

`\ABNTEXclass` retorna a classe-base detectada. `\ABNTEXprofile` retorna um dos
perfis `nenhum`, `academico`, `projeto`, `artigo`, `relatorio` ou `livro`.

## Configuração

`\ABNTEXsetup{<chaves>}` aceita:

- `perfil`;
- `titulo`;
- `subtitulo`;
- `autoria`;
- `instituicao`;
- `natureza`;
- `objetivo`;
- `area`;
- `orientacao`;
- `coorientacao`;
- `volume`;
- `local`;
- `data`;
- `profundidade-secoes`;
- `profundidade-sumario`;
- `largura-indicativo-sumario`;
- `nome-apendice`;
- `nome-anexo`;
- `papel`;
- `orientacao-papel`;
- `impressao`;
- `margem-superior`;
- `margem-inferior`;
- `margem-interna`;
- `margem-externa`;
- `recuo-citacao-longa`;
- `disposicao-lombada`;
- `largura-lombada`;
- `separador-palavras-chave`;
- `citacoes`, com valores `externo`, `autor-data` ou `numerico`;
- `tipo-trabalho`, com valores `tese`, `dissertacao`, `tcc` ou `monografia`;
- `debug`, uma opção experimental de diagnóstico.

As mesmas chaves podem ser passadas como opções do pacote. A precedência, da
menor para a maior, é:

1. valores iniciais do pacote;
2. opções de `\usepackage`;
3. chamadas de `\ABNTEXsetup`.

Entre atribuições no mesmo nível, a última ocorrência de uma chave prevalece.
Uma atribuição não apaga outros metadados.

`\ABNTEXmetadata{<nome>}` recupera de forma expansível o valor de um dos doze
metadados documentados. Isso permite, por exemplo:

```tex
\title{\ABNTEXmetadata{titulo}}
```

## Validação técnica

`\ABNTEXvalidate` verifica a presença dos metadados técnicos exigidos pelo
perfil:

| Perfil | Metadados exigidos no Marco 2 |
| --- | --- |
| `nenhum` | nenhum |
| `academico` | título, autoria, instituição, natureza, objetivo, área, orientação, local e data |
| `projeto` | título, autoria, instituição, local e data |
| `artigo` | título; autoria, resumo e datas são validados pelo perfil próprio |
| `relatorio` | título, autoria, instituição, local e data |
| `livro` | título, autoria, local e data |

Essas listas são requisitos técnicos provisórios de completude. Elas não
constituem interpretação normativa e serão refinadas nos marcos dos
respectivos perfis.

## Mensagens e estabilidade

O núcleo possui mensagens próprias para:

- classe não suportada;
- conflito de classe;
- conflito de pacote;
- aviso de metadado obrigatório ausente;
- interface obsoleta;
- diagnóstico ativado.

Comandos, opções e chaves documentados são a API pública experimental da linha
`0.0.x`. Funções e variáveis com nomes internos não têm garantia de
compatibilidade. Nenhuma interface está obsoleta até o Marco 6; a mensagem de
depreciação estabelece o mecanismo que será usado quando necessário.

## Estrutura e sumário

O Marco 3 acrescenta:

- `\ABNTEXstructureSetup` para destaque, alinhamento e espaçamento dos cinco
  níveis;
- `\ABNTEXpretextualtitle` e `\ABNTEXposttextualtitle`;
- `\ABNTEXsumario`;
- `\ABNTEXappendix` e `\ABNTEXannex`.

A referência, os valores aceitos e os limites estão em
[`structure.md`](structure.md).

## Layout e paginação

O Marco 4 acrescenta:

- chaves de papel, orientação física, modo de impressão e margens;
- `\ABNTEXpretextualpages` e `\ABNTEXtextualpages`;
- o ambiente `ABNTEXcitacaolonga`;
- `\ABNTEXfonte` e `\ABNTEXnota`;
- estilo de página, entrelinha, notas e legendas configurados pelo módulo.

`orientacao` permanece sendo o metadado acadêmico de orientação;
`orientacao-papel` controla retrato ou paisagem. As chaves físicas devem ser
usadas no preâmbulo. A referência detalhada está em
[`layout.md`](layout.md).

## Elementos pré-textuais e listas

O Marco 5 acrescenta:

- capa, prova de lombada, folha de rosto e ficha catalográfica;
- errata, folha de aprovação, dedicatória, agradecimentos e epígrafe;
- resumos vernáculo e estrangeiro com palavras-chave;
- listas automáticas de ilustrações e tabelas;
- registros e listas de abreviaturas, siglas e símbolos;
- validação da ordem e dos elementos obrigatórios do perfil acadêmico.

A ficha catalográfica recebe conteúdo preparado externamente; o pacote não
gera dados profissionais de catalogação. A referência completa está em
[`frontmatter.md`](frontmatter.md).

## Elementos pós-textuais e bibliografia

O Marco 6 acrescenta:

- `\ABNTEXcitacoes`, que informa o sistema selecionado;
- `\ABNTEXposttextualpages`, sem reinício da paginação;
- `\ABNTEXbibliografia`, que delega a lista a `\printbibliography`;
- `\ABNTEXglossario`, como integração opcional com pacotes de glossário;
- `\ABNTEXindice`, como integração opcional com geradores de índice;
- validação da ordem de referências, glossário, apêndices, anexos e índice.

O valor inicial `citacoes=externo` não carrega `biblatex`. Os valores
`autor-data` e `numerico` são escolhas explícitas por `style=abnt` e
`style=abnt-numeric`, respectivamente. A referência completa e a divisão de
responsabilidades estão em [`backmatter.md`](backmatter.md).

## Perfil de trabalho acadêmico

O Marco 7 acrescenta:

- `\ABNTEXtipotrabalho`, que informa a configuração selecionada;
- `\ABNTEXacademicoexterna`, que valida metadados e compõe a capa;
- `\ABNTEXacademicopretextual`, `\ABNTEXacademicotextual` e
  `\ABNTEXacademicopostextual`, que coordenam as fases da parte interna;
- `\ABNTEXvalidateacademico`, que verifica tipo, metadados e elementos
  obrigatórios.

A referência completa, inclusive a separação entre elementos obrigatórios e
opcionais, está em [`profile-academic.md`](profile-academic.md).

## Perfil de projeto de pesquisa

O Marco 8 acrescenta:

- `\ABNTEXprojetoexterna`, `\ABNTEXprojetopretextual`,
  `\ABNTEXprojetotextual` e `\ABNTEXprojetopostextual`, que coordenam as
  quatro fases sem tornar a capa obrigatória;
- `\ABNTEXprojetointroducao`, `\ABNTEXprojetoreferencialteorico`,
  `\ABNTEXprojetometodologia`, `\ABNTEXprojetorecursos` e
  `\ABNTEXprojetocronograma`, que compõem e registram as divisões textuais;
- `\ABNTEXvalidateprojeto`, que verifica metadados, elementos e divisões
  obrigatórias.

A referência completa está em [`profile-project.md`](profile-project.md).

## Perfil de artigo

- `\ABNTEXartigoSetup` configura resumos, palavras-chave, datas editoriais,
  título traduzido e identificação de acesso;
- `\ABNTEXartigoautor` registra repetidamente nome, currículo, vinculação e
  contato;
- `\ABNTEXartigopretextual`, `\ABNTEXartigotextual` e
  `\ABNTEXartigopostextual` coordenam as três partes;
- `\ABNTEXartigointroducao`, `\ABNTEXartigodesenvolvimento` e
  `\ABNTEXartigoconsideracoesfinais` registram a estrutura textual;
- `\ABNTEXvalidateartigo` verifica os elementos obrigatórios.

A opção `artigo-colunas=uma|duas` controla uma escolha editorial. A referência
completa está em [`profile-article.md`](profile-article.md).

## Perfil de relatório técnico ou científico

O Marco 10 acrescenta:

- `\ABNTEXrelatorioSetup`, para identificação, classificação, resumo,
  instituições e dados do formulário;
- `\ABNTEXrelatoriomembroequipe`, para registrar a equipe repetidamente;
- coordenadores das partes externa, pré-textual, textual e pós-textual;
- capa, folha de rosto, resumo e formulário próprios do relatório;
- comandos para introdução, desenvolvimento e considerações finais;
- `\ABNTEXvalidaterelatorio`, com referências condicionadas a
  `possui-citacoes=sim` e alternativa entre catalogação e formulário.

A referência completa está em [`profile-report.md`](profile-report.md).

## Perfil de livro ou folheto

O Marco 11 acrescenta:

- `\ABNTEXlivroSetup`, para tipo, meio, editora, ISBN, direitos, catalogação e
  condições editoriais;
- `\ABNTEXlivroautor` e `\ABNTEXlivrocolaborador`, para registros repetíveis;
- coordenadores das partes externa, pré-textual, textual e pós-textual;
- capa, folhas de guarda, orelhas, falsa folha de rosto, folha de rosto,
  créditos e colofão próprios do perfil;
- comandos para prefácio, partes, capítulos e posfácio;
- `\ABNTEXvalidatelivro`, com lombada, folhas de guarda, referências e índice
  condicionados às escolhas declaradas.

A referência completa está em [`profile-book.md`](profile-book.md).
