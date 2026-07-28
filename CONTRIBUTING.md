# Como contribuir

Obrigado por considerar uma contribuição. Ao participar, você concorda com o
[`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md).

## Antes de começar

- Use o template de bug para comportamentos reproduzíveis.
- Use o template de proposta para alterações de API, arquitetura ou escopo.
- Use o template normativo para implementar ou corrigir uma regra de norma.
- Vulnerabilidades devem seguir [`SECURITY.md`](SECURITY.md), sem issue pública.

Mudanças grandes ou incompatíveis devem ser discutidas antes da implementação.
Decisões arquiteturais aceitas são registradas em `docs/decisoes/`.

## Contribuições normativas

Antes de implementar uma regra normativa, registre:

1. a norma e sua edição;
2. o item que fundamenta o comportamento;
3. uma descrição própria e concisa do requisito;
4. o identificador interno do requisito;
5. os arquivos de implementação;
6. um exemplo mínimo;
7. um teste automatizado.

Não inclua no repositório:

- PDFs ou imagens de normas técnicas;
- transcrições extensas de conteúdo protegido;
- modelos institucionais sem licença compatível;
- código de outros projetos sem identificação da origem e da licença.

## Pull requests

1. Mantenha a mudança pequena e com propósito único.
2. Atualize documentação e `CHANGELOG.md` quando aplicável.
3. Adicione testes para toda alteração observável.
4. Execute as verificações disponíveis no estágio atual do projeto.
5. Preencha o template do pull request e relacione a issue correspondente.
6. Não inclua arquivos gerados nem conteúdo de `bases/`.

Toda mudança deve passar por `git diff --check`. Mudanças de código também
devem passar por `l3build check` e pela compilação dos exemplos afetados.
Alterações de distribuição devem executar ainda `l3build ctan` e
`./scripts/validate-distribution.sh`.

Regras específicas de universidades e organizações devem permanecer fora do
núcleo ou ser implementadas como extensões claramente separadas.

Ao contribuir, você declara possuir o direito de submeter o conteúdo e concorda
em licenciá-lo sob a LaTeX Project Public License, versão 1.3c ou posterior.
