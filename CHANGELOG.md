# Histórico de alterações

Todas as mudanças relevantes deste projeto serão registradas neste arquivo.

## Não publicado

### Alterado

- LuaLaTeX passa a ser o único motor suportado no build, na CI, nos exemplos e
  na validação da distribuição; outros motores recebem erro explícito.
- A política de motor é registrada na ADR 0005 e em instruções persistentes no
  `AGENTS.md` para uso consistente em diferentes máquinas.

### Adicionado

- Inventário e tabela de migração das interfaces canônicas do abnTeX2.
- Guia de migração para a API do abnTeX3 e para `biblatex-abnt`/`biber`.
- Módulo opcional `abntex3-compat` com aliases temporários, diagnósticos de
  depreciação e testes de correspondências diretas.

- Fundação do projeto comunitário independente.
- Matriz normativa inicial.
- Arquitetura, inventário de arquivos e roteiro técnico completo.
- Código de conduta, política de segurança e metadados de citação.
- Templates estruturados para issues e pull requests.
- Registro das decisões arquiteturais fundamentais.
- Política de versionamento semântico e compatibilidade.
- Política de contribuição.
- Licenciamento sob LPPL 1.3c ou posterior.
- Fonte documentada e instalador para o pacote mínimo `abntex3.sty`.
- Build, documentação, testes e distribuição reproduzíveis com `l3build`.
- Testes de carregamento e opções em pdfTeX, LuaTeX e XeTeX.
- Integração contínua no TeX Live 2024, 2025 e 2026.
- Exemplo mínimo e validação das instalações isolada e empacotada.
- Pacote CTAN/TDS de ensaio com verificação de arquivos não permitidos.
- Núcleo documentado `abntex3-core` com configuração baseada em `l3keys2e`.
- API experimental `\ABNTEXsetup`, `\ABNTEXmetadata`, `\ABNTEXprofile`,
  `\ABNTEXclass` e `\ABNTEXvalidate`.
- Metadados técnicos e requisitos provisórios de completude por perfil.
- Diagnósticos próprios para classes, conflitos, validação e depreciação.
- Compatibilidade inicial com `article`, `report` e `book`.
- Testes de precedência, metadados, perfis, classes e ordem de carregamento.
- Matrizes rastreáveis da ABNT NBR 6024:2012 e da ABNT NBR 6027:2012.
- Módulo documentado `abntex3-structure` para cinco níveis progressivos.
- Configuração de profundidade, destaque, alinhamento e espaçamento por nível.
- Títulos pré-textuais e pós-textuais, sumário, apêndices e anexos.
- Correspondência tipográfica entre títulos e entradas do sumário.
- Testes de profundidade, títulos longos, quebras de página, acentos,
  hiperlinks e classes-base nos três motores.
- Exemplo completo de estrutura e sumário.
- Matriz rastreável da ABNT NBR 14724:2024 para layout e paginação.
- Módulo documentado `abntex3-layout` com papel A4, orientação e margens.
- Modos de impressão em anverso e frente e verso com margens espelhadas.
- Contagem pré-textual, exibição textual e paginação externa no cabeçalho.
- Entrelinha geral, notas de rodapé, citações longas, legendas e fontes.
- Numeração contínua de figuras e tabelas, independente dos capítulos.
- Testes de dimensões, páginas únicas e múltiplas, páginas em branco e
  paridade nos três motores.
- Exemplo completo de layout e paginação.
- Visão executiva do roadmap no README, com marcos concluídos e próximos.
- Badges de integração contínua e licença no README.
- Matrizes rastreáveis da ABNT NBR 12225:2023 e da ABNT NBR 6028:2021.
- Módulos documentados `abntex3-frontmatter` e `abntex3-lists`.
- Capa, prova de lombada, folha de rosto e ficha catalográfica extensível.
- Errata, folha de aprovação, dedicatória, agradecimentos e epígrafe.
- Resumos vernáculo e estrangeiro com palavras-chave configuráveis.
- Listas automáticas de ilustrações e tabelas.
- Listas ordenadas de abreviaturas e siglas e lista sequencial de símbolos.
- Validação de ordem e obrigatoriedade dos elementos pré-textuais acadêmicos.
- Exemplo integrado de elementos pré-textuais e listas.
- Matrizes rastreáveis das NBR 6023:2025, NBR 10520:2023 e NBR 6034:2004.
- Módulo documentado `abntex3-backmatter` para o fluxo pós-textual.
- Integração opt-in com `biblatex-abnt` nos sistemas autor-data e numérico.
- Referências processadas de ponta a ponta com `biber`.
- Espaço simples, alinhamento à esquerda e separação uniforme das referências.
- Pontos de integração para glossário e índice remissivo.
- Ordem pós-textual de referências, glossário, apêndices, anexos e índice.
- Diagnósticos para configuração, estilo, versão e saída do `biber`.
- Exemplo integrado de citações, bibliografia, apêndices, anexos e índice.
- Módulo `abntex3-profile-academic` para tese, dissertação, TCC e monografia.
- Coordenação das partes externa, pré-textual, textual e pós-textual.
- Validação integrada dos elementos acadêmicos obrigatórios e opcionais.
- Exemplo completo e manual do perfil de trabalho acadêmico.
- CI com cancelamento de execuções superadas, falha antecipada e distribuição
  sem chamadas redundantes anteriores a `l3build ctan`.
- Detecção de escopo na CI para dispensar a matriz TeX em alterações
  exclusivamente documentais, preservando os checks exigidos na `main`.
- Matriz rastreável da ABNT NBR 15287:2025.
- Módulo `abntex3-profile-project` para projetos de pesquisa.
- Coordenação das partes externa, pré-textual, textual e pós-textual do
  projeto, preservando a opcionalidade da capa.
- Comandos estruturais para introdução, referencial teórico, metodologia,
  recursos e cronograma.
- Validação, exemplo completo, manual e testes do perfil de projeto.
- Matriz rastreável da ABNT NBR 6022:2018.
- Módulo `abntex3-profile-article` com bloco pré-textual próprio, autoria
  múltipla, afiliações, contatos, resumos e datas editoriais.
- Estrutura textual e pós-textual do artigo, títulos adaptáveis e
  agradecimentos finais.
- Composição editorial em uma ou duas colunas, exemplo completo, manual e
  testes do perfil de artigo.
- Oito modelos canônicos completos para tese, dissertação, TCC, monografia,
  projeto de pesquisa e artigos em uma ou duas colunas.
- Matriz de cobertura e procedimento de auditoria externa dos modelos.
- Validação dos modelos com bibliografia, glossário e índice nas instalações
  isolada e empacotada.
- Compatibilidade da integração de glossário com a seção gerada pelo pacote
  `glossaries`, preservando o título pós-textual do abnTeX3 Community.
- Matriz rastreável da ABNT NBR 10719:2015.
- Módulo `abntex3-profile-report` com identificação, classificação de
  segurança, equipe técnica, resumo e formulário de identificação.
- Fluxo externo, pré-textual, textual e pós-textual de relatórios, com
  referências condicionadas à existência declarada de citações.
- Exemplo institucional, modelo científico completo, manual e testes do
  perfil de relatório.
- Matriz rastreável da ABNT NBR 6029:2023.
- Módulo `abntex3-profile-book` para livros e folhetos impressos ou digitais.
- Dados editoriais, autorias e colaborações repetíveis, direitos, catalogação
  fornecida externamente e validações condicionais de acabamento.
- Fluxo externo, pré-textual, textual e pós-textual, com capa, folhas de
  guarda, orelhas, folha de rosto, créditos, partes, capítulos e colofão.
- Exemplo completo, manual e testes de livro, folheto, volumes, autorias e
  elementos editoriais.
