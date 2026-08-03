# Migração do abnTeX2 para o abnTeX3 Community

## Escopo e método

Este inventário foi produzido a partir dos modelos canônicos distribuídos com
o abnTeX2 1.9.7 no TeX Live. Ele cobre as interfaces que afetam a migração
documental; comandos gerais de LaTeX e interfaces específicas de `memoir` não
passam a integrar a API do abnTeX3.

A migração recomendada usa diretamente a API `ABNTEX`. O módulo opcional
`abntex3-compat` existe para permitir conversão gradual de correspondências
inequívocas. Cada alias emite um aviso de depreciação e deve ser removido ao
fim da migração.

## Tabela abnTeX2 → abnTeX3

| Interface do abnTeX2 | Classificação | Interface do abnTeX3 | Observação |
|---|---|---|---|
| `\titulo`, `\autor`, `\instituicao` | migrável | chaves `titulo`, `autoria`, `instituicao` de `\ABNTEXsetup` | Alias temporário disponível. |
| `\orientador`, `\coorientador` | migrável | chaves `orientacao`, `coorientacao` | Alias temporário disponível. |
| `\local`, `\data` | migrável | chaves `local`, `data` | Alias temporário disponível. |
| `\imprimir...` dos sete metadados acima | migrável | `\ABNTEXmetadata{chave}` | Alias temporário disponível. |
| `\tipotrabalho` | substituído | `tipo-trabalho` e chaves `natureza`, `objetivo`, `area` | O abnTeX3 separa o tipo controlado do texto institucional; não há alias lossy. |
| `\preambulo` | substituído | chaves `natureza`, `objetivo`, `area` | O texto único deve ser decomposto em metadados verificáveis. |
| `\pretextual`, `\textual`, `\postextual` | migrável | `\ABNTEXpretextualpages`, `\ABNTEXtextualpages`, `\ABNTEXposttextualpages` | Em perfis completos, prefira os comandos de fase do perfil. |
| `\imprimircapa` | migrável | `\ABNTEXcapa` | Alias temporário disponível. |
| `\imprimirfolhaderosto` e forma estrelada | migrável | `\ABNTEXfolhaderosto` | O argumento estrela legado é aceito e ignorado pelo alias. |
| ambientes `fichacatalografica`, `errata`, `folhadeaprovacao`, `dedicatoria`, `agradecimentos`, `epigrafe`, `resumo` | substituído | comandos `\ABNTEX...` correspondentes | A nova API recebe conteúdo explicitamente; conversão manual. |
| `\listoffigures`, `\listoftables`, `\tableofcontents` | substituído | `\ABNTEXlistadeilustracoes`, `\ABNTEXlistadetabelas`, `\ABNTEXsumario` | Use os títulos e o rastreamento do abnTeX3. |
| `\fonte`, `\nota` | migrável | `\ABNTEXfonte`, `\ABNTEXnota` | Alias temporário disponível. |
| `\partapendices`, `\partanexos` | substituído | `\ABNTEXappendix{...}`, `\ABNTEXannex{...}` | Cada divisão é declarada diretamente. |
| `\bibliography` com `abntex2cite` | substituído | `\addbibresource` e `\ABNTEXbibliografia` | Requer `biblatex-abnt`/`biber`; `abntex2cite` é incompatível. |
| `\citeonline` | substituído | `\textcite` | Revise chamadas opcionais durante a conversão. |
| `\cite` do fluxo `abntex2cite` | substituído | `\parencite` ou `\cite` do `biblatex` | Escolha conforme a função sintática da citação. |
| opções e comandos de layout de `memoir` | não suportado | opções do abnTeX3 ou pacotes LaTeX especializados | Não há objetivo de reproduzir `memoir`. |
| classe `abntex2` | não suportado | `article`, `report` ou `book` com `abntex3` | Carregar as duas implementações é erro explícito. |

## Procedimento recomendado

1. Troque a classe `abntex2` por `article`, `report` ou `book` e carregue
   `abntex3` com o perfil correspondente.
2. Converta os metadados para uma chamada `\ABNTEXsetup`; decomponha
   `\preambulo` em `natureza`, `objetivo` e `area`.
3. Substitua os blocos pré-textuais pelos comandos públicos do perfil.
4. Migre `abntex2cite`/BibTeX para `biblatex-abnt`/`biber` e revise cada
   citação textual ou parentética.
5. Troque apêndices, anexos, listas e índice pelas interfaces `ABNTEX`.
6. Compile, execute `\ABNTEXvalidate` ou a validação do perfil e resolva os
   diagnósticos antes de remover `abntex3-compat`.

## Limites deliberados

Compatibilidade significa auxiliar a migração, não garantir que um documento
abnTeX2 compile sem edição. Interfaces semanticamente ambíguas, composição
interna de ambientes e personalizações de `memoir` não recebem aliases. Essa
restrição evita preservar acidentalmente uma estrutura que a API nova tornou
explícita e verificável.
