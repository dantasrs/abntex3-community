# Qualidade, acessibilidade e portabilidade

Este documento registra o escopo técnico do Marco 13. Os ensaios reduzem o
risco de regressão, mas não transformam uma versão experimental em declaração
de conformidade normativa, PDF/UA ou acessibilidade.

## Plataformas e versões

A integração contínua executa:

| Ambiente | TeX Live | Cobertura |
| --- | ---: | --- |
| Linux em contêiner | 2024, 2025 e 2026 | suíte `l3build` completa |
| macOS hospedado pelo GitHub | 2026 | suíte `l3build` completa |
| Windows hospedado pelo GitHub | 2026 | suíte `l3build` completa |

LuaLaTeX permanece o único motor suportado. A matriz por versão no Linux
detecta regressões do TeX Live; macOS e Windows verificam caminhos, processos e
comportamentos dependentes do sistema operacional na versão corrente.

O job multiplataforma usa `TeX-Live/setup-texlive-action@v4`, porque ele ainda
oferece os três sistemas. A própria ação está marcada como obsoleta. A ação
recomendada por seus mantenedores, `zauguin/install-texlive@v4`, ainda não
mantém ensaio público no Windows. Essa dependência deve ser reavaliada quando
houver alternativa mantida com cobertura equivalente.

## Interoperabilidade

Os testes cobrem carregamento conjunto com:

- `hyperref` e `bookmark`;
- `geometry` e `microtype`;
- `babel` em português e inglês;
- `polyglossia` em português e inglês;
- `glossaries-extra` e `makeidx`.

Os testes demonstram que as interfaces podem coexistir em uma configuração
representativa. Eles não garantem compatibilidade com toda combinação de
opções ou com versões futuras desses pacotes.

## Metadados, marcadores e ligações

Quando `hyperref` está carregado, `\ABNTEXsetup` transfere ao PDF:

| Chave | Campo do PDF |
| --- | --- |
| `titulo` | título |
| `autoria` | autoria |
| `assunto-pdf` | assunto |
| `palavras-chave-pdf` | palavras-chave |
| `idioma-pdf` | idioma principal; padrão `pt-BR` |

O pacote também solicita título visível na janela e marcadores abertos e
numerados. O ensaio `examples/qualidade-pdf.tex` verifica os campos, o catálogo
`/Lang`, os marcadores e uma ligação externa com `pdfinfo`, `qpdf` e
`pdftotext`.

## Desempenho e dependências

`scripts/quality-audit.sh` compila o exemplo de qualidade em duas passagens e
registra:

- versão do motor;
- total de páginas;
- quantidade de arquivos `.cls` e `.sty` carregados;
- tempo total de compilação;
- diferença visual em pixels;
- estado de marcação estrutural do PDF.

Os limites de segurança são 120 arquivos de classe ou pacote e 120 segundos
para duas passagens no ambiente de CI. Eles são tetos para detectar regressões
grandes, não metas de desempenho nem resultados comparáveis entre máquinas.

## Regressão visual

A primeira página do exemplo de qualidade é renderizada a 96 dpi e comparada
com `testfiles/visual/qualidade-pdf-pagina-1.png`. A comparação admite pequenas
diferenças de rasterização e falha acima de 500 pixels diferentes com
tolerância de cor de 5%. A baseline deve ser atualizada somente após inspeção
da alteração intencional:

```sh
./scripts/quality-audit.sh --update-visual-baseline
```

Esse ensaio detecta deslocamentos grosseiros na página canônica; não substitui
revisão visual humana de todos os modelos.

## Política inicial de PDF/UA

O projeto ainda não produz nem anuncia PDF/UA. O PDF de ensaio registra idioma
e metadados, mas permanece sem árvore completa de marcação semântica. Antes de
qualquer alegação de acessibilidade serão necessários, no mínimo:

1. adotar e estabilizar a infraestrutura de PDF marcada do LaTeX;
2. definir texto alternativo para figuras e conteúdo não textual;
3. verificar ordem de leitura, títulos, listas, tabelas, notas e matemática;
4. executar validadores especializados e testes com tecnologias assistivas;
5. documentar exceções e realizar auditoria humana independente.

O script confirma explicitamente `Tagged: no` para impedir que metadados
básicos sejam confundidos com conformidade PDF/UA.

## Avisos bloqueadores e limitações conhecidas

O exemplo de auditoria deve compilar sem avisos de referências, nova passagem,
caixas excedentes ou avisos de pacotes. Mensagens públicas do abnTeX3 não podem
expor nomes internos como `g__abntex` ou `l__abntex`.

Limitações atuais:

- PDF/UA e acessibilidade integral não estão implementados;
- a regressão visual cobre uma página em um ambiente Linux controlado;
- macOS e Windows usam apenas o TeX Live corrente;
- `glossaries-extra` pode emitir aviso do `tracklang` para o dialeto
  `brazilian`; o aviso pertence à integração de terceiros e não aparece no
  exemplo de qualidade bloqueante;
- métricas variam com cache, hardware, espelho e versão das dependências;
- a ação usada para instalar TeX Live nos runners multiplataforma está
  obsoleta e exige substituição futura.
