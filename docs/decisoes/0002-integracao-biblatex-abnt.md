# 0002 — Integração com `biblatex-abnt`

- Estado: aceita
- Data: 2026-07-27

## Contexto

O abnTeX2 inclui `abntex2cite.sty`, estilos BibTeX `.bst` e bancos de opções.
O projeto `biblatex-abnt` oferece uma implementação contemporânea de citações e
referências com `biblatex` e `biber`.

Manter duas implementações do mesmo domínio duplicaria esforço, ampliaria a
superfície de erros e dificultaria a atualização para a ABNT NBR 6023:2025 e a
ABNT NBR 10520:2023.

## Decisão

O abnTeX3 Community não implementará estilos bibliográficos próprios.
Citações e referências serão delegadas ao `biblatex-abnt`.

O pacote fornecerá apenas:

- opções de integração coerentes com os perfis documentais;
- formatação do espaço documental ocupado pela lista de referências;
- verificações de dependência e versões;
- testes de integração de ponta a ponta;
- documentação da divisão de responsabilidades.

O usuário continuará podendo configurar diretamente `biblatex` e
`biblatex-abnt`. O abnTeX3 não substituirá silenciosamente escolhas explícitas.

## Consequências

### Positivas

- uma única implementação bibliográfica especializada;
- uso de `biber` e do ecossistema atual de `biblatex`;
- evolução independente dos dois projetos;
- redução do núcleo do abnTeX3.

### Custos e riscos

- compatibilidade depende de versões coordenadas;
- migração a partir de BibTeX exige documentação;
- falhas de integração poderão envolver dois repositórios;
- releases precisarão declarar versões mínimas testadas.

## Alternativas rejeitadas

- portar `abntex2cite.sty` e os estilos `.bst`;
- embutir uma cópia de `biblatex-abnt`;
- oferecer duas pilhas bibliográficas paralelas.
