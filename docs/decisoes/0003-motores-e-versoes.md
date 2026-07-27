# 0003 — Motores e versões de TeX

- Estado: aceita
- Data: 2026-07-27

## Contexto

O pacote precisa funcionar tanto em fluxos LaTeX tradicionais quanto em
documentos Unicode com fontes modernas. Suportar versões indefinidamente torna
difícil usar interfaces atuais do kernel e aumenta excessivamente a matriz de
testes.

## Decisão

A matriz principal abrangerá:

- pdfLaTeX;
- LuaLaTeX;
- XeLaTeX.

Durante o desenvolvimento inicial, o projeto testará a versão corrente e as
duas versões anuais anteriores do TeX Live, quando houver imagens de CI
mantidas e reprodutíveis. Em 2026, a referência é TeX Live 2024–2026.

A versão mínima definitiva do kernel LaTeX será congelada antes da primeira
versão beta e documentada no manual, no README e nos metadados do pacote.

`article`, `report` e `book` compõem a matriz inicial de classes-base.
Compatibilidade com `memoir` e KOMA-Script não faz parte da primeira versão
alfa.

## Consequências

### Positivas

- cobertura dos três motores de uso geral;
- uso responsável de interfaces recentes;
- política previsível de descontinuação;
- falhas específicas de motor identificadas cedo.

### Custos e riscos

- a matriz de CI será maior;
- versões antigas de distribuições Linux podem ficar sem suporte;
- diferenças de fontes e hifenização exigirão normalização dos testes;
- a disponibilidade de imagens de CI pode reduzir temporariamente a matriz.

## Exceções

Correções simples para versões anteriores podem ser aceitas quando não
adicionarem dependências nem impedirem o uso de interfaces atuais, mas não
criam obrigação permanente de suporte.
