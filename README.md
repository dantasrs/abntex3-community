# abnTeX3 Community

Continuação comunitária e independente da ideia apresentada no projeto
[`abntex/abntex3`](https://github.com/abntex/abntex3), voltada à produção de
documentos LaTeX compatíveis com normas brasileiras de informação e
documentação.

## Situação do projeto

O projeto possui infraestrutura reproduzível, API experimental de configuração
e metadados e um primeiro módulo para seções, numeração, sumário, apêndices e
anexos. A versão 0.0.0 ainda não é indicada para produção e não faz alegação
de conformidade.

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

1. Consolidar governança, arquitetura e rastreabilidade normativa.
2. Criar fontes documentadas, build e testes com `l3build`.
3. Implementar o núcleo sobre classes LaTeX usuais.
4. Entregar estrutura, layout e elementos documentais.
5. Integrar e validar `biblatex-abnt`.
6. Entregar os perfis acadêmico, projeto, artigo, relatório e livro.
7. Documentar migração, estabilizar a API e preparar a distribuição CTAN.

Consulte a [`arquitetura e árvore de arquivos`](docs/arquitetura.md) e o
[`roteiro técnico completo`](docs/roadmap.md).

## API experimental

O núcleo funciona inicialmente com `article`, `report` e `book`:

```tex
\documentclass{article}
\usepackage[perfil=academico]{abntex3}

\ABNTEXsetup{
  titulo      = {Título do trabalho},
  autoria     = {Nome da autoria},
  instituicao = {Nome da instituição},
  local       = {Recife},
  data        = {2026}
}
```

Consulte a [`referência da API`](docs/api.md) para os metadados disponíveis,
perfis, precedência de configuração, validação técnica e garantias de
estabilidade. O uso de seções e sumário está documentado em
[`docs/structure.md`](docs/structure.md).

## Desenvolvimento

O projeto usa `l3build`. Uma instalação TeX Live completa e atual permite
executar:

```sh
l3build unpack
l3build check
l3build doc
l3build install --texmfhome /caminho/temporario/texmf
l3build ctan
./scripts/validate-distribution.sh
```

`l3build check` executa os testes com pdfTeX, LuaTeX e XeTeX. A integração
contínua repete a suíte no TeX Live 2024, 2025 e 2026. O último comando valida
o pacote CTAN de ensaio, sem publicá-lo, e compila o exemplo mínimo tanto a
partir de uma instalação isolada quanto da árvore TDS empacotada.

## Governança e colaboração

- [`CONTRIBUTING.md`](CONTRIBUTING.md) — fluxo e requisitos das contribuições;
- [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) — padrões de convivência;
- [`SECURITY.md`](SECURITY.md) — relato privado de vulnerabilidades;
- [`CITATION.cff`](CITATION.cff) — metadados para citação;
- [`docs/decisoes/`](docs/decisoes/) — decisões arquiteturais aceitas;
- [`docs/versionamento.md`](docs/versionamento.md) — versões e compatibilidade.

## Licença

O conteúdo original deste projeto pode ser distribuído e modificado sob a
LaTeX Project Public License, versão 1.3c ou posterior. Consulte
[`LICENSE`](LICENSE) e [`manifest.txt`](manifest.txt).

O projeto possui estado de manutenção `maintained`. O mantenedor atual é
[`dantasrs`](https://github.com/dantasrs).
