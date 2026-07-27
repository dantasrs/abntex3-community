# 0001 — Pacote em vez de classe monolítica

- Estado: aceita
- Data: 2026-07-27

## Contexto

O abnTeX2 concentra apresentação, comandos documentais e grande parte da
compatibilidade em uma classe derivada de `memoir`. Essa escolha oferece muitos
recursos prontos, mas acopla o usuário a uma classe-base específica e torna
difícil separar regras normativas de conveniências históricas.

O abnTeX3 Community pretende atender classes LaTeX usuais e manter módulos
pequenos, testáveis e substituíveis.

## Decisão

O projeto fornecerá uma API pública em `abntex3.sty`, carregável sobre
`article`, `report` e `book` no primeiro ciclo funcional.

As responsabilidades serão divididas em módulos internos para núcleo, layout,
estrutura, elementos pré-textuais, elementos pós-textuais, listas, perfis e
compatibilidade. Os perfis documentais serão selecionados por opção do pacote,
sem criar uma classe pública para cada tipo de documento.

Compatibilidade com `memoir` e KOMA-Script será avaliada somente depois da
estabilização do núcleo.

## Consequências

### Positivas

- menor acoplamento a uma classe-base;
- testes e manutenção por responsabilidade;
- possibilidade de adoção gradual;
- API comum aos diferentes perfis;
- dependências explícitas.

### Custos e riscos

- recursos antes herdados de `memoir` precisarão de implementação ou integração;
- diferenças entre classes-base exigirão testes;
- nem todo documento existente em abnTeX2 poderá migrar sem ajustes;
- a camada de compatibilidade deverá permanecer limitada.

## Alternativas rejeitadas

- continuar derivando diretamente de `memoir`;
- criar uma classe independente para cada perfil;
- copiar e adaptar `abntex2.cls`.
