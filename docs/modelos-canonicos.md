# Modelos canônicos e auditoria

Os modelos canônicos são documentos completos e compiláveis destinados a dois
usos simultâneos:

1. servir como base para iniciar um documento novo; e
2. fornecer uma evidência estável para auditoria externa da implementação.

Eles usam apenas interfaces públicas. Os textos são demonstrativos e não
substituem decisões institucionais, conteúdo científico ou leitura das normas.

## Modelos disponíveis

| Arquivo | Perfil | Variante |
| --- | --- | --- |
| `modelo-tese-completo.tex` | acadêmico | tese |
| `modelo-dissertacao-completo.tex` | acadêmico | dissertação |
| `modelo-tcc-completo.tex` | acadêmico | trabalho de conclusão de curso |
| `modelo-monografia-completo.tex` | acadêmico | monografia |
| `modelo-projeto-pesquisa-completo.tex` | projeto | projeto de pesquisa |
| `modelo-artigo-uma-coluna-completo.tex` | artigo | uma coluna |
| `modelo-artigo-duas-colunas-completo.tex` | artigo | duas colunas |
| `modelo-relatorio-cientifico-completo.tex` | relatório | científico |
| `livro.tex` | livro | livro impresso, capa dura e com índice |

Todos ficam em `examples/` e compartilham apenas o arquivo bibliográfico
`referencias-exemplo.bib`. Cada `.tex` contém sua configuração, seus metadados
e todo o corpo documental, de modo que possa ser copiado como ponto de partida.

## Matriz de cobertura

| Grupo observável | Acadêmicos | Projeto | Artigos | Relatório | Livro |
| --- | --- | --- | --- | --- | --- |
| Capa | obrigatória, presente | opcional, presente | não aplicável | opcional, presente | prova editorial presente |
| Lombada | prova opcional, presente | prova opcional, presente | não aplicável | prova opcional, presente | prova presente |
| Folha de rosto | presente | presente | não aplicável | própria, presente | própria, presente |
| Ficha catalográfica/formulário | ponto de extensão presente | não aplicável | não aplicável | formulário presente | dados catalográficos presentes |
| Errata | presente | não aplicável | não aplicável | presente | presente |
| Folha de aprovação | presente | não aplicável | não aplicável | não aplicável | não aplicável |
| Dedicatória, agradecimentos e epígrafe pré-textuais | presentes | não aplicáveis | não aplicáveis | agradecimentos presentes | presentes |
| Resumos e palavras-chave em dois idiomas | presentes | não aplicáveis | presentes | vernáculo presente | não aplicáveis |
| Autoria múltipla, vínculos e contatos | metadado geral | metadado geral | duas autorias presentes | autoria e equipe presentes | duas autorias e colaboração presentes |
| Datas editoriais e identificação de acesso | não aplicáveis | não aplicáveis | presentes | dados do formulário presentes | edição, ISBN e direitos presentes |
| Listas de ilustrações e tabelas | presentes | presentes | não previstas pelo perfil | presentes | presentes |
| Abreviaturas, siglas e símbolos | presentes | presentes | não previstas pelo perfil | presentes | sigla presente |
| Sumário | presente | presente | não aplicável | presente | presente |
| Estrutura textual do perfil | capítulos demonstrativos | cinco divisões específicas | três divisões específicas | três divisões específicas | parte e dois capítulos |
| Citação narrativa, parentética, longa e nota | presentes | presentes | presentes | parentética presente | parentética presente |
| Figura, tabela, legenda e fonte | presentes | presentes | presentes | presentes | presentes |
| Referências | presentes | presentes | presentes | presentes | presentes |
| Glossário | presente | presente | presente | presente | presente |
| Apêndice e anexo | presentes | presentes | presentes | presentes | presentes |
| Índice remissivo | presente | presente | não previsto pelo perfil | presente | presente |
| Agradecimentos finais | não aplicáveis | não aplicáveis | presentes e por último | não aplicáveis | não aplicáveis |

A lista combinada de abreviaturas e siglas foi escolhida nos modelos. As APIs
de listas separadas continuam demonstradas em `elementos-pretextuais.tex`;
essas formas são alternativas de apresentação e não devem ser emitidas
simultaneamente no mesmo documento canônico.

## Procedimento de auditoria

Uma pessoa avaliadora pode:

1. conferir a matriz normativa do perfil em `docs/requisitos/`;
2. localizar o comando correspondente no `.tex`;
3. compilar o modelo a partir de uma instalação isolada;
4. inspecionar ordem, presença, paginação e apresentação no PDF;
5. comparar o resultado com a edição normativa obtida legalmente;
6. registrar achados sem considerar o próprio modelo uma declaração de
   conformidade.

O ensaio automatizado executa `pdflatex`, `biber`, `makeindex` quando
aplicável, `makeglossaries` e novas passagens de `pdflatex` tanto na instalação
isolada quanto no pacote TDS.

Para reproduzir manualmente um modelo acadêmico ou de projeto:

```sh
pdflatex modelo-tese-completo.tex
biber modelo-tese-completo
makeindex modelo-tese-completo
makeglossaries modelo-tese-completo
pdflatex modelo-tese-completo.tex
pdflatex modelo-tese-completo.tex
```

Nos dois artigos, omita apenas a chamada a `makeindex`, pois o índice remissivo
não integra o perfil implementado.

## Uso como ponto de partida

Copie o modelo correspondente junto com `referencias-exemplo.bib`, substitua
metadados e conteúdo e remova apenas os elementos opcionais que não se
aplicarem. Regras institucionais adicionais devem ficar fora do núcleo do
pacote e ser documentadas no projeto do novo documento.
