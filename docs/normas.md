# Matriz normativa

Esta matriz identifica o escopo pretendido. Ela não substitui as normas nem
constitui declaração de conformidade.

## Núcleo: trabalhos acadêmicos

| Norma | Edição | Assunto | Responsabilidade prevista |
| --- | ---: | --- | --- |
| ABNT NBR 14724 | 2024 | Trabalhos acadêmicos | Estrutura e apresentação geral |
| ABNT NBR 12225 | 2023 | Lombada | Elementos e apresentação da lombada |
| ABNT NBR 6024 | 2012 | Numeração progressiva | Hierarquia e apresentação das seções |
| ABNT NBR 6027 | 2012 | Sumário | Organização e apresentação do sumário |
| ABNT NBR 6028 | 2021 | Resumo, resenha e recensão | Apresentação de resumos e palavras-chave |
| ABNT NBR 10520 | 2023 | Citações | Integração com `biblatex-abnt` e recursos textuais |
| ABNT NBR 6023 | 2025 | Referências | Delegada ao `biblatex-abnt` |

## Perfis adicionais

| Norma | Edição | Perfil |
| --- | ---: | --- |
| ABNT NBR 15287 | 2025 | Projeto de pesquisa |
| ABNT NBR 6022 | 2018 | Artigo técnico ou científico |
| ABNT NBR 10719 | 2015 | Relatório técnico ou científico |
| ABNT NBR 6029 | 2023 | Livro ou folheto |
| ABNT NBR 6034 | 2004 | Índice |

## Política de rastreabilidade

Cada requisito implementado deverá receber um identificador interno estável e
registrar:

- norma e edição;
- item normativo;
- interpretação adotada;
- arquivos responsáveis pela implementação;
- testes que demonstram o comportamento;
- divergências ou opções permitidas.

Os registros devem ser redigidos com palavras próprias. Textos integrais,
capturas de tela e reproduções substanciais das normas não devem ser
armazenados no repositório.

## Matrizes detalhadas disponíveis

- [`ABNT NBR 14724:2024`](requisitos/nbr-14724-2024.md) — layout e
  paginação e elementos pré-textuais;
- [`ABNT NBR 12225:2023`](requisitos/nbr-12225-2023.md) — lombada;
- [`ABNT NBR 6024:2012`](requisitos/nbr-6024-2012.md) — numeração
  progressiva das seções;
- [`ABNT NBR 6027:2012`](requisitos/nbr-6027-2012.md) — sumário;
- [`ABNT NBR 6028:2021`](requisitos/nbr-6028-2021.md) — resumos e
  palavras-chave.

## Conformidade

Nenhuma versão deve ser anunciada como compatível com uma norma antes de:

1. concluir a matriz dos requisitos aplicáveis;
2. implementar testes para os comportamentos verificáveis;
3. compilar os exemplos nos motores LaTeX suportados;
4. realizar revisão normativa independente;
5. documentar limitações e decisões de interpretação.
