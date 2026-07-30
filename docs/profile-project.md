# Perfil de projeto de pesquisa

O módulo `abntex3-profile-project` reúne os módulos gerais em um fluxo baseado
na ABNT NBR 15287:2025. Ele não substitui regras institucionais, avaliação
humana nem o texto da norma.

## Configuração

Selecione o perfil e informe explicitamente o tipo do projeto:

```tex
\usepackage[perfil=projeto]{abntex3}

\ABNTEXsetup{
  titulo      = {Título do projeto},
  autoria     = {Nome da autoria},
  instituicao = {Nome da entidade},
  natureza    = {Projeto de pesquisa},
  local       = {Fortaleza},
  data        = {2026}
}
```

Título, autoria, instituição, natureza, local e data são metadados
obrigatórios. Orientação, coorientação, subtítulo e volume são preenchidos
quando aplicáveis.

## Fluxo das partes

```tex
\begin{document}
\ABNTEXprojetoexterna
% \ABNTEXcapa              % opcional
% \ABNTEXlombada           % opcional

\ABNTEXprojetopretextual
\ABNTEXfolhaderosto
% listas opcionais
\ABNTEXsumario

\ABNTEXprojetotextual
% divisões textuais específicas

\ABNTEXprojetopostextual
\ABNTEXbibliografia
\end{document}
```

A fase externa não produz uma capa automaticamente, pois esse elemento é
opcional no perfil. A folha de rosto, o sumário e as referências são
verificados como obrigatórios.

## Estrutura textual

O perfil oferece comandos para as cinco divisões observáveis:

```tex
\ABNTEXprojetointroducao{...}
\ABNTEXprojetoreferencialteorico{...}
\ABNTEXprojetometodologia{...}
\ABNTEXprojetorecursos{...}
\ABNTEXprojetocronograma{...}
```

Cada comando cria uma divisão primária compatível com a classe-base e
registra sua presença. O conteúdo da introdução deve tratar tema, problema,
hipóteses quando aplicáveis, objetivos e justificativa. O pacote verifica a
presença da divisão, mas não julga sua completude intelectual.

## Validação

`\ABNTEXvalidateprojeto` verifica:

- seleção do perfil e metadados obrigatórios;
- folha de rosto, sumário e referências;
- introdução, referencial teórico, metodologia, recursos e cronograma.

Quando qualquer coordenador é usado, a validação também ocorre no fim do
documento. Capa, lombada, listas, glossário, apêndices, anexos e índice são
opcionais e sua ausência não produz diagnóstico.

## Exemplo e processamento

[`examples/projeto-pesquisa.tex`](../examples/projeto-pesquisa.tex) apresenta
um projeto completo. Como contém bibliografia, processe-o com `biber`.

## Estado normativo

Os requisitos estão rastreados em
[`requisitos/nbr-15287-2025.md`](requisitos/nbr-15287-2025.md). Ainda é
necessária revisão normativa independente antes de alegar conformidade ou
encerrar formalmente o Marco 8.
