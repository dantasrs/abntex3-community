# 0004 — Política de compatibilidade

- Estado: aceita
- Data: 2026-07-27

## Contexto

O abnTeX2 possui uma API extensa, formada por comandos documentados,
conveniências de `memoir` e comandos internos que passaram a ser usados em
modelos institucionais. Reproduzir toda essa superfície impediria a criação de
uma arquitetura simples e manteria decisões históricas inadequadas.

## Decisão

A compatibilidade do abnTeX3 será definida por sua própria API pública:

- comandos, ambientes, opções e chaves documentados no manual;
- formatos de arquivo declarados como públicos;
- resultados cobertos por testes normativos.

Nomes internos usarão convenções de `expl3` ou prefixo privado e não terão
garantia de estabilidade.

A migração do abnTeX2 será seletiva. Cada comando legado será classificado como:

1. equivalente direto;
2. substituído por nova API;
3. fornecido apenas pelo módulo opcional de compatibilidade;
4. deliberadamente não suportado.

Antes de `1.0.0`, mudanças incompatíveis são permitidas, mas devem constar no
changelog e no guia de migração. A partir de `1.0.0`, o projeto seguirá a
política descrita em [`../versionamento.md`](../versionamento.md).

## Depreciação

Depois de `1.0.0`, uma API pública normalmente será marcada como obsoleta em
uma versão menor, emitirá aviso e permanecerá disponível até a próxima versão
principal. Exceções de segurança ou impossibilidade técnica deverão ser
documentadas.

## Consequências

- migração explícita em vez de compatibilidade acidental;
- liberdade para corrigir a arquitetura antes da versão estável;
- necessidade de manual e tabela de migração completos;
- modelos que usam comandos internos do abnTeX2 exigirão adaptação.
