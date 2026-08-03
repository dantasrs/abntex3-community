# 0005 — LuaLaTeX como motor exclusivo

- Estado: aceita
- Data: 2026-08-03
- Substitui: [0003 — Motores e versões de TeX](0003-motores-e-versoes.md)

## Contexto

Manter pdfLaTeX, LuaLaTeX e XeLaTeX amplia a matriz de testes e restringe o
uso coerente de Unicode e fontes OpenType. O projeto já depende de uma
distribuição TeX Live atual e usa `biblatex-abnt` com `biber`, portanto não há
benefício suficiente em preservar motores legados ou uma segunda pilha
Unicode.

LuaLaTeX oferece ao projeto um único caminho moderno para Unicode, seleção de
fontes e evolução futura do processamento tipográfico. Concentrar os testes
nesse motor reduz variações acidentais e permite investir a mesma capacidade
de CI em versões do TeX Live, classes-base e interoperabilidade.

## Decisão

LuaLaTeX é o único motor suportado pelo abnTeX3 Community.

- O pacote encerra a compilação com diagnóstico explícito em outro motor.
- O `l3build` usa exclusivamente `luatex`, inclusive como motor padrão.
- Exemplos, documentação e validação da distribuição usam `lualatex`.
- A CI pode testar múltiplas versões anuais do TeX Live, mas sempre com
  LuaLaTeX.
- O fluxo bibliográfico permanece `biblatex-abnt` com `biber`.

A decisão não afirma que LuaLaTeX está presente em toda instalação mínima ou
personalizada de TeX. O requisito operacional é uma instalação TeX Live que
inclua LuaLaTeX e as dependências declaradas pelo projeto; a CI usa o esquema
completo.

## Consequências

### Positivas

- uma única implementação tipográfica e uma suíte mais rápida;
- suporte nativo a Unicode e fontes modernas;
- menos diferenças de hifenização e saída entre ambientes;
- documentação e diagnóstico de instalação mais simples;
- mais espaço de CI para portabilidade entre versões e sistemas operacionais.

### Custos e riscos

- documentos limitados a pdfLaTeX ou XeLaTeX precisam mudar de motor;
- distribuições mínimas podem exigir a instalação de componentes LuaTeX;
- diferenças de fontes disponíveis entre sistemas continuam exigindo testes;
- regressões específicas do LuaTeX não terão um motor alternativo suportado.

## Reversão

Adicionar outro motor exige uma nova ADR, justificativa de usuário, definição
da matriz de compatibilidade e testes próprios. Compatibilidade acidental não
constitui suporte.
