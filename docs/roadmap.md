# Roteiro técnico

Este roteiro transforma a estrutura herdada conceitualmente do abnTeX2 em um
pacote novo, modular, verificável e integrado ao `biblatex-abnt`. A ordem dos
marcos expressa dependências técnicas, não datas prometidas.

Consulte [`arquitetura.md`](arquitetura.md) para a árvore completa de arquivos
e [`normas.md`](normas.md) para a matriz normativa.

## Regras de execução

Uma tarefa normativa somente pode ser concluída quando houver:

1. requisito identificado por norma, edição e item;
2. interpretação escrita com palavras próprias;
3. implementação associada;
4. teste automatizado reproduzível;
5. exemplo ou trecho de manual quando o comportamento for público;
6. revisão normativa independente.

Um marco somente é concluído quando seus testes passam nos motores declarados,
a documentação compila sem avisos novos e não há conteúdo protegido das normas
nos arquivos distribuídos.

## Marco 0 — Fundação e governança

**Objetivo:** tornar explícitos o escopo, a independência e o processo de
decisão antes da implementação.

- [x] Criar o projeto independente.
- [x] Registrar atribuição ao abnTeX2 e ao abnTeX3 original.
- [x] Registrar ausência de endosso da organização abnTeX e da ABNT.
- [x] Adotar LPPL 1.3c ou posterior.
- [x] Definir a matriz normativa inicial.
- [x] Reunir localmente as edições normativas necessárias.
- [x] Definir a árvore de arquivos pretendida.
- [x] Definir a separação entre apresentação e bibliografia.
- [x] Criar `CODE_OF_CONDUCT.md`.
- [x] Criar `SECURITY.md`.
- [x] Criar `CITATION.cff`.
- [x] Criar modelos de issue e pull request.
- [x] Registrar as decisões arquiteturais 0001 a 0004.
- [x] Definir política de versões segundo versionamento semântico.

**Saída:** repositório governável, sem API ainda prometida.

## Marco 1 — Build, testes e distribuição mínima

**Objetivo:** produzir, instalar, testar e empacotar um pacote vazio antes de
implementar regras normativas.

- [x] Criar `build.lua`.
- [x] Criar `source/abntex3.ins`.
- [x] Criar `source/abntex3.dtx` com `abntex3.sty` mínimo.
- [x] Configurar geração dos módulos a partir dos `.dtx`.
- [x] Criar testes de carregamento e opções.
- [x] Criar `examples/minimo.tex`.
- [x] Configurar `l3build unpack`, `check`, `doc`, `install` e `ctan`.
- [x] Configurar CI para `pdfTeX`, `LuaTeX` e `XeTeX`.
- [x] Testar TeX Live corrente e duas versões anuais anteriores.
- [x] Adicionar verificação de arquivos não permitidos em artefatos.
- [x] Gerar um pacote CTAN de ensaio sem publicá-lo.

**Critério de saída:** um documento mínimo compila com a versão instalada e
com a versão empacotada; `l3build check` é reprodutível.

## Marco 2 — Núcleo e API pública

**Objetivo:** estabelecer configuração, metadados e compatibilidade básica com
classes usuais.

- [x] Criar `abntex3-core.dtx`.
- [x] Implementar opções com `l3keys2e`.
- [x] Implementar `\ABNTEXsetup`.
- [x] Definir mensagens de erro, aviso e depreciação.
- [x] Implementar metadados: título, subtítulo, autoria, instituição, natureza,
      objetivo, área, orientação, local e data.
- [x] Definir valores obrigatórios por perfil.
- [x] Detectar classe-base e conflitos conhecidos.
- [x] Suportar inicialmente `article`, `report` e `book`.
- [x] Testar carregamento antes e depois de pacotes comuns.
- [x] Documentar API, precedência das opções e estabilidade.

**Critério de saída:** API mínima documentada e estável o suficiente para os
módulos seguintes, ainda sem alegação de conformidade.

## Marco 3 — Numeração, seções e sumário

**Normas:** ABNT NBR 6024:2012 e ABNT NBR 6027:2012.

- [x] Criar as matrizes `nbr-6024-2012.md` e `nbr-6027-2012.md`.
- [x] Criar `abntex3-structure.dtx`.
- [x] Implementar níveis e indicativos de seção.
- [x] Implementar títulos com e sem indicativo numérico.
- [x] Implementar alinhamento, espaçamento e destaques configuráveis.
- [x] Implementar apêndices e anexos sem acoplamento à classe-base.
- [x] Implementar sumário e correspondência tipográfica com o texto.
- [x] Tratar entradas pré-textuais e pós-textuais no sumário.
- [x] Testar títulos longos, quebras de página e profundidades.
- [x] Testar caracteres acentuados e marcadores de PDF.
- [x] Criar documentação e exemplos mínimos.

**Critério de saída:** estrutura e sumário têm requisitos rastreáveis e testes
nos três motores. Uma revisão normativa independente continua necessária antes
de qualquer alegação de conformidade.

## Marco 4 — Layout e paginação

**Norma principal:** ABNT NBR 14724:2024.

- [x] Criar a matriz `nbr-14724-2024.md`.
- [x] Criar `abntex3-layout.dtx`.
- [x] Implementar papel, orientação e margens.
- [x] Implementar impressão em anverso e frente e verso.
- [x] Implementar contagem e exibição de páginas.
- [x] Implementar cabeçalhos e rodapés mínimos.
- [x] Definir política de fonte e tamanho sem impor família desnecessária.
- [x] Implementar espaçamento geral e exceções.
- [x] Implementar notas, citações longas, legendas e fontes.
- [x] Testar documentos de uma página, múltiplas páginas e páginas em branco.
- [x] Testar paridade de páginas no modo frente e verso.

**Critério de saída:** o layout básico é mensurável, testado e independente do
perfil documental.

## Marco 5 — Elementos pré-textuais e listas

**Normas:** ABNT NBR 14724:2024, ABNT NBR 12225:2023 e ABNT NBR 6028:2021.

- [x] Criar as matrizes `nbr-12225-2023.md` e `nbr-6028-2021.md`.
- [x] Criar `abntex3-frontmatter.dtx`.
- [x] Criar `abntex3-lists.dtx`.
- [x] Implementar capa e lombada.
- [x] Implementar folha de rosto e ficha catalográfica como ponto de extensão.
- [x] Implementar errata e folha de aprovação.
- [x] Implementar dedicatória, agradecimentos e epígrafe.
- [x] Implementar resumo e resumo em outro idioma.
- [x] Implementar palavras-chave com separador configurável.
- [x] Implementar listas de ilustrações e tabelas.
- [x] Implementar listas de abreviaturas, siglas e símbolos.
- [x] Definir comportamento quando elementos opcionais estiverem ausentes.
- [x] Testar ordem, obrigatoriedade e paginação dos elementos.

**Critério de saída:** todos os elementos anteriores ao texto podem ser
compostos sem comandos internos ou redefinições no documento do usuário.

## Marco 6 — Elementos pós-textuais e bibliografia

**Normas:** ABNT NBR 6023:2025, ABNT NBR 10520:2023 e ABNT NBR 6034:2004.

- [x] Criar as matrizes `nbr-6023-2025.md`, `nbr-10520-2023.md` e
      `nbr-6034-2004.md`.
- [x] Criar `abntex3-backmatter.dtx`.
- [x] Integrar `biblatex-abnt` sem carregar um estilo silenciosamente.
- [x] Definir opções `citacoes=autor-data|numerico`.
- [x] Verificar citações diretas, indiretas, notas e citações longas.
- [x] Verificar referências com `biber`.
- [x] Implementar pontos de integração para glossário.
- [x] Implementar apêndices e anexos no fluxo pós-textual.
- [x] Implementar índice remissivo.
- [x] Testar ausência de `biber`, estilo incompatível e versões insuficientes.
- [x] Documentar claramente a divisão de responsabilidades entre os projetos.

**Critério de saída:** citações e referências funcionam de ponta a ponta sem
reimplementar estilos bibliográficos.

## Marco 7 — Perfil de trabalho acadêmico

**Norma principal:** ABNT NBR 14724:2024.

- [x] Criar `abntex3-profile-academic.dtx`.
- [x] Definir elementos obrigatórios e opcionais do perfil.
- [x] Compor as partes externa, interna, textual e pós-textual.
- [x] Criar `examples/trabalho-academico.tex`.
- [x] Criar testes de tese, dissertação, TCC e monografia por configuração.
- [x] Testar documentos com e sem ficha catalográfica e folha de aprovação.
- [x] Produzir seção completa do manual.
- [ ] Executar revisão normativa independente.

**Critério de saída:** primeiro perfil completo, candidato à versão alfa.

**Estado:** implementação técnica concluída; o marco permanece aberto até que
uma pessoa diferente do autor registre a revisão normativa.

## Marco 8 — Perfil de projeto de pesquisa

**Norma:** ABNT NBR 15287:2025.

- [ ] Criar a matriz `nbr-15287-2025.md`.
- [ ] Criar `abntex3-profile-project.dtx`.
- [ ] Mapear diferenças em relação ao trabalho acadêmico.
- [ ] Implementar estrutura específica do projeto.
- [ ] Criar `examples/projeto-pesquisa.tex`.
- [ ] Criar testes de elementos obrigatórios e opcionais.
- [ ] Produzir seção do manual.
- [ ] Executar revisão normativa independente.

**Critério de saída:** perfil de projeto completo e reutilizando o núcleo.

## Marco 9 — Perfil de artigo

**Norma:** ABNT NBR 6022:2018.

- [ ] Criar a matriz `nbr-6022-2018.md`.
- [ ] Criar `abntex3-profile-article.dtx`.
- [ ] Implementar elementos pré-textuais do artigo.
- [ ] Implementar estrutura textual e pós-textual.
- [ ] Tratar autoria múltipla, afiliações e datas editoriais.
- [ ] Criar `examples/artigo.tex`.
- [ ] Criar testes em uma e duas colunas quando aplicável.
- [ ] Produzir seção do manual.
- [ ] Executar revisão normativa independente.

**Critério de saída:** artigo completo sem depender de comandos do perfil
acadêmico.

## Marco 10 — Perfil de relatório técnico ou científico

**Norma:** ABNT NBR 10719:2015.

- [ ] Criar a matriz `nbr-10719-2015.md`.
- [ ] Criar `abntex3-profile-report.dtx`.
- [ ] Implementar identificação, equipes, resumo e dados do relatório.
- [ ] Implementar partes externa, interna e anexos específicos.
- [ ] Criar `examples/relatorio-tecnico.tex`.
- [ ] Criar testes de relatório institucional e científico.
- [ ] Produzir seção do manual.
- [ ] Executar revisão normativa independente.

**Critério de saída:** relatório completo com metadados próprios do perfil.

## Marco 11 — Perfil de livro ou folheto

**Norma:** ABNT NBR 6029:2023.

- [ ] Criar a matriz `nbr-6029-2023.md`.
- [ ] Criar `abntex3-profile-book.dtx`.
- [ ] Implementar elementos editoriais e divisão do corpo da publicação.
- [ ] Integrar lombada e índice quando solicitados.
- [ ] Criar `examples/livro.tex`.
- [ ] Criar testes de livro, folheto, volumes e múltiplas autorias.
- [ ] Produzir seção do manual.
- [ ] Executar revisão normativa independente.

**Critério de saída:** os cinco perfis previstos estão implementados.

## Marco 12 — Migração e compatibilidade

**Objetivo:** permitir adoção gradual sem transformar o núcleo em uma réplica
do abnTeX2.

- [ ] Inventariar comandos públicos do abnTeX2 usados nos modelos canônicos.
- [ ] Classificar cada comando como migrável, substituído ou não suportado.
- [ ] Criar `docs/compatibilidade.md`.
- [ ] Criar `doc/abntex3-migration.tex`.
- [ ] Criar `abntex3-compat.dtx`.
- [ ] Emitir avisos claros para opções antigas reconhecidas.
- [ ] Publicar tabela “abnTeX2 → abnTeX3”.
- [ ] Testar migrações representativas, sem exigir compatibilidade integral.
- [ ] Documentar a migração de BibTeX/`abntex2cite` para
      `biblatex-abnt`/`biber`.

**Critério de saída:** um usuário do abnTeX2 consegue avaliar e executar a
migração sem consultar o código-fonte.

## Marco 13 — Qualidade, acessibilidade e portabilidade

- [ ] Executar a suíte em Linux, Windows e macOS.
- [ ] Testar hiperlinks, marcadores e metadados do PDF.
- [ ] Testar entradas em português e em idioma adicional.
- [ ] Verificar mensagens sem vazamento de comandos internos.
- [ ] Medir tempo de compilação e quantidade de dependências.
- [ ] Testar interoperabilidade com `hyperref`, `bookmark`, `geometry`,
      `microtype`, `babel`, `polyglossia`, `glossaries-extra` e `makeidx`.
- [ ] Definir política inicial de PDF/UA como estudo, sem alegação prematura.
- [ ] Executar análise de regressões visuais para páginas canônicas.
- [ ] Documentar limitações conhecidas.
- [ ] Resolver todos os avisos bloqueadores.

**Critério de saída:** candidato a beta portável e com limitações explícitas.

## Marco 14 — Alfa e beta públicos

### Alfa `0.1.0`

- [ ] Entregar infraestrutura, núcleo e perfil acadêmico experimental.
- [ ] Marcar a API como sujeita a mudanças.
- [ ] Publicar artefatos em GitHub Releases, ainda sem CTAN.
- [ ] Recolher exemplos mínimos e relatos de migração.

### Betas `0.x`

- [ ] Congelar progressivamente nomes de opções e comandos.
- [ ] Entregar os demais perfis.
- [ ] Exigir teste de regressão para toda correção.
- [ ] Concluir revisão independente das 12 matrizes normativas.
- [ ] Auditar licença, atribuições e conteúdo dos artefatos.
- [ ] Produzir manual PDF completo.

**Critério de saída:** nenhuma mudança incompatível conhecida necessária para
a API pública.

## Marco 15 — Versão estável e CTAN

- [ ] Definir versão `1.0.0` e data em todos os pontos controlados.
- [ ] Atualizar `README.md`, `CHANGELOG.md`, `CITATION.cff` e `manifest.txt`.
- [ ] Executar `l3build clean`, `check`, `doc` e `ctan` em ambiente limpo.
- [ ] Verificar o ZIP conforme as regras atuais do CTAN.
- [ ] Confirmar que `.sty` derivados e PDFs de normas não estão no upload.
- [ ] Testar instalação a partir do artefato TDS.
- [ ] Criar tag assinada e GitHub Release.
- [ ] Submeter o pacote ao CTAN.
- [ ] Verificar espelhamento e inclusão em TeX Live/MiKTeX.
- [ ] Publicar política de suporte e atualização normativa.

**Critério de saída:** pacote instalável pelas distribuições TeX, com API
estável e alegações de conformidade limitadas ao que foi revisado.

## Manutenção contínua

- [ ] Monitorar novas edições, emendas e cancelamentos das normas.
- [ ] Abrir uma issue normativa para cada mudança identificada.
- [ ] Manter compatibilidade com a versão corrente do `biblatex-abnt`.
- [ ] Revisar anualmente a matriz de motores e TeX Live.
- [ ] Publicar correções incompatíveis apenas em versão principal.
- [ ] Manter as duas últimas linhas principais com correções de segurança e
      regressões críticas, conforme capacidade dos mantenedores.
- [ ] Arquivar evidências de revisão sem redistribuir conteúdo protegido.

## Fora do escopo do núcleo

- estilos particulares de universidades, cursos ou organizações;
- reprodução ou redistribuição de normas técnicas;
- implementação própria de estilos bibliográficos;
- compatibilidade total e irrestrita com comandos internos do abnTeX2;
- modelos de apresentações de slides;
- editor gráfico, serviço web ou conversor de documentos.

Esses itens podem existir futuramente como extensões independentes, desde que
tenham manutenção, testes e licença próprios.

## Ordem crítica

```text
Fundação
  → build e testes
    → núcleo/API
      → estrutura e layout
        → elementos pré/pós-textuais
          → integração bibliográfica
            → perfil acadêmico
              → demais perfis
                → migração e portabilidade
                  → alfa → beta → 1.0/CTAN
```
