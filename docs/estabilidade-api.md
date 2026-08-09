# Estabilidade progressiva da API

Este documento fixa a baseline pública inaugurada por `0.1.0-alpha.1` e define
como ela evolui durante os betas. A linha `0.x` continua experimental: esta
política reduz mudanças acidentais, mas não promete a estabilidade de `1.0.0`.

## Baseline `0.1.0-alpha.1`

Integram a baseline:

- o pacote `abntex3` sobre `article`, `report` e `book` com LuaLaTeX;
- os perfis `nenhum`, `academico`, `projeto`, `artigo`, `relatorio` e `livro`;
- comandos, ambiente, opções, chaves e valores descritos em
  [`api.md`](api.md) e nos manuais dos módulos e perfis;
- a integração opt-in com `biblatex-abnt` e `biber`;
- os formatos de configuração dos modelos canônicos.

O teste `public-api-baseline.lvt` enumera todos os comandos nativos e o
ambiente público existentes na primeira alfa. Os demais testes exercitam as
chaves, seus valores e os comportamentos observáveis. A camada
`abntex3-compat` é temporária e não integra a API nativa congelável.

## Categorias de estabilidade

- **baseline alfa:** interface publicada e protegida contra remoção acidental;
- **candidata a congelamento:** interface mantida sem incompatibilidade por
  pelo menos um ciclo público e coberta por documentação e teste;
- **congelada no beta:** interface que não deve mudar antes de `1.0.0`, salvo
  defeito comprovado, exigência normativa ou impossibilidade técnica;
- **interna:** nomes privados, estado `expl3`, arquivos de build e detalhes de
  implementação, sem promessa de compatibilidade.

Uma interface não se torna estável apenas porque aparece no código. Ela precisa
estar documentada como pública.

## Mudanças durante `0.x`

Toda proposta incompatível deve:

1. identificar a interface e o caso real que exige a mudança;
2. discutir a alternativa em issue antes da implementação;
3. atualizar o changelog, a referência da API e o guia de migração;
4. fornecer diagnóstico ou caminho de transição quando tecnicamente possível;
5. atualizar a baseline e os testes no mesmo pull request;
6. ser publicada em nova versão, sem alterar uma tag existente.

Correções compatíveis e ampliações aditivas continuam permitidas. A ausência
de incompatibilidades conhecidas só poderá ser declarada depois dos relatos de
uso e das revisões independentes previstos no Marco 14.

## Critério para o primeiro beta

Antes de `0.1.0-beta.1`, a manutenção deve revisar cada interface da baseline,
registrar as exceções ainda experimentais e declarar quais nomes passam à
categoria congelada no beta. Até essa decisão, a baseline protege contra
mudanças silenciosas, mas permanece sujeita ao processo acima.
