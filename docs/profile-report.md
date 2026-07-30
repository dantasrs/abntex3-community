# Perfil de relatório técnico ou científico

O módulo `abntex3-profile-report` coordena o fluxo previsto pela ABNT NBR
10719:2015. Ele não determina classificação de segurança, não produz
catalogação profissional e não substitui regras institucionais ou revisão
humana.

## Configuração

Selecione o perfil e configure os metadados gerais:

```tex
\usepackage[perfil=relatorio]{abntex3}
\ABNTEXsetup{
  titulo      = {Título do relatório},
  autoria     = {Pessoa ou entidade autora},
  instituicao = {Entidade responsável},
  local       = {Recife},
  data        = {2026}
}
```

Em seguida, informe os dados próprios:

```tex
\ABNTEXrelatorioSetup{
  projeto-programa-plano = {Programa relacionado},
  numero-relatorio       = {RT-2026-001},
  codigo-identificacao   = {ORG-RT-2026-001},
  classificacao-seguranca= {acesso público},
  tipo-relatorio         = {relatório técnico},
  resumo                 = {Texto do resumo.},
  palavras-chave         = {tema um, tema dois},
  possui-citacoes        = sim
}
```

Projeto/programa/plano, tipo, resumo e palavras-chave são campos específicos
verificados. Número, código, classificação, endereços, patrocínio, ISSN,
edição, tiragem e demais dados do formulário são preenchidos quando
aplicáveis. O valor `possui-citacoes=sim` exige referências; `nao` registra
explicitamente que a condição não ocorre.

## Equipe e fluxo

Registre zero ou mais membros antes do documento:

```tex
\ABNTEXrelatoriomembroequipe
  {Nome}{Função ou qualificação}{Instituição}
```

O fluxo completo é:

```tex
\ABNTEXrelatorioexterna
% \ABNTEXrelatoriocapa     % opcional
% \ABNTEXlombada           % opcional

\ABNTEXrelatoriopretextual
\ABNTEXrelatoriofolhaderosto
% \ABNTEXrelatorioequipe   % opcional
% \ABNTEXfichacatalografica{...} % alternativa ao formulário
\ABNTEXrelatorioresumo
% listas opcionais
\ABNTEXsumario

\ABNTEXrelatoriotextual
\ABNTEXrelatoriointroducao{...}
\ABNTEXrelatoriodesenvolvimento{...}
\ABNTEXrelatorioconsideracoesfinais{...}

\ABNTEXrelatoriopostextual
% \ABNTEXbibliografia      % obrigatória quando possui-citacoes=sim
% glossário, apêndices, anexos e índice
\ABNTEXrelatorioformulario % alternativa aos dados catalográficos
```

Os três comandos textuais aceitam título opcional, pois a nomenclatura pode
ser adaptada sem perder o registro semântico.

## Validação

`\ABNTEXvalidaterelatorio` verifica:

- metadados gerais e específicos;
- as quatro fases;
- folha de rosto, resumo e sumário;
- introdução, desenvolvimento e considerações finais;
- referências quando declaradas citações;
- pelo menos uma das alternativas: dados catalográficos ou formulário.

A validação ocorre também no fim do documento após o uso de um coordenador.
Ela mede completude técnica observável, não conformidade normativa.

## Exemplos e estado normativo

[`examples/relatorio-tecnico.tex`](../examples/relatorio-tecnico.tex)
demonstra um relatório institucional. O
[`modelo-relatorio-cientifico-completo.tex`](../examples/modelo-relatorio-cientifico-completo.tex)
amplia a cobertura para um relatório científico auditável.

Os requisitos e a divergência interna sobre referências estão registrados em
[`requisitos/nbr-10719-2015.md`](requisitos/nbr-10719-2015.md). Ainda é
necessária revisão normativa independente antes de alegar conformidade ou
encerrar formalmente o Marco 10.
