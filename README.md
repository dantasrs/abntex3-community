# abnTeX3 Community

Continuação comunitária e independente da ideia apresentada no projeto
[`abntex/abntex3`](https://github.com/abntex/abntex3), voltada à produção de
documentos LaTeX compatíveis com normas brasileiras de informação e
documentação.

## Situação do projeto

O projeto está em fase de fundação. Ainda não há uma versão utilizável nem
alegação de conformidade normativa.

O primeiro objetivo é criar um pacote leve, testável e compatível com classes
LaTeX usuais. Regras de citações e referências serão delegadas ao
[`biblatex-abnt`](https://github.com/abntex/biblatex-abnt), evitando duplicação
de responsabilidades.

## Independência e atribuição

Este projeto:

- é desenvolvido de forma independente;
- não é mantido nem oficialmente endossado pela organização abnTeX ou pela
  Associação Brasileira de Normas Técnicas (ABNT);
- reconhece o `abntex3` original como origem histórica da proposta e o
  `abntex2` como antecedente técnico;
- não incorpora, neste momento, código-fonte dos projetos anteriores;
- não redistribui o texto de normas técnicas.

O uso dos nomes abnTeX e ABNT neste repositório tem finalidade descritiva e de
atribuição.

## Princípios

- Implementação nova, modular e com poucas dependências.
- Compatibilidade com classes LaTeX usuais sempre que possível.
- Requisitos normativos rastreáveis por norma, edição e item.
- Testes automatizados para cada comportamento observável.
- Separação entre apresentação documental e formatação bibliográfica.
- Ausência de regras institucionais particulares no núcleo do pacote.

## Normas no escopo

A matriz inicial considera, entre outras:

- ABNT NBR 14724:2024 — trabalhos acadêmicos;
- ABNT NBR 12225:2023 — lombada;
- ABNT NBR 6024:2012 — numeração progressiva das seções;
- ABNT NBR 6027:2012 — sumário;
- ABNT NBR 6028:2021 — resumo, resenha e recensão;
- ABNT NBR 10520:2023 — citações;
- ABNT NBR 6023:2025 — referências;
- ABNT NBR 15287:2025 — projeto de pesquisa.

Consulte [`docs/normas.md`](docs/normas.md) para a matriz completa e os limites
de uso das normas.

## Roteiro

1. Consolidar governança, licença e arquitetura.
2. Criar a infraestrutura de testes com `l3build`.
3. Implementar um perfil mínimo de trabalho acadêmico.
4. Integrar e validar `biblatex-abnt`.
5. Acrescentar perfis de projeto de pesquisa, artigo, relatório e livro.

O roteiro detalhado está em [`docs/roadmap.md`](docs/roadmap.md).

## Licença

O conteúdo original deste projeto pode ser distribuído e modificado sob a
LaTeX Project Public License, versão 1.3c ou posterior. Consulte
[`LICENSE`](LICENSE) e [`manifest.txt`](manifest.txt).

O projeto possui estado de manutenção `maintained`. O mantenedor atual é
[`dantasrs`](https://github.com/dantasrs).
