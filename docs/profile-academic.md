# Perfil de trabalho acadêmico

O módulo `abntex3-profile-academic` reúne os módulos gerais em um fluxo
completo baseado na ABNT NBR 14724:2024. Ele não substitui regras
institucionais, avaliação humana nem o texto da norma.

## Configuração

Selecione o perfil e o tipo do trabalho:

```tex
\usepackage[
  perfil=academico,
  tipo-trabalho=dissertacao
]{abntex3}
```

`tipo-trabalho` aceita `tese`, `dissertacao`, `tcc` e `monografia`.
`\ABNTEXtipotrabalho` recupera o valor selecionado. O tipo não preenche
automaticamente `natureza`, `objetivo`, `instituicao` ou `area`, pois a
redação e os requisitos de titulação variam conforme a instituição.

Todos os metadados obrigatórios do perfil continuam definidos por
`\ABNTEXsetup`: título, autoria, instituição, natureza, objetivo, área,
orientação, local e data.

## Fluxo das partes

O perfil oferece quatro comandos coordenadores:

```tex
\begin{document}
\ABNTEXacademicoexterna       % valida metadados e compõe a capa
% \ABNTEXlombada              % opcional, quando houver exemplar impresso

\ABNTEXacademicopretextual    % inicia a parte interna pré-textual
% folha de rosto, aprovação, resumos, listas e sumário

\ABNTEXacademicotextual       % valida os pré-textuais e mostra paginação
% introdução, desenvolvimento e conclusão

\ABNTEXacademicopostextual    % preserva a numeração
% referências, glossário, apêndices, anexos e índice
\end{document}
```

A parte externa contém a capa obrigatória e a lombada opcional. A parte
interna reúne as fases pré-textual, textual e pós-textual. Os comandos
coordenadores registram a sequência e avisam quando uma fase volta para uma
posição anterior.

## Elementos obrigatórios e opcionais

| Parte | Obrigatórios | Opcionais ou condicionais |
| --- | --- | --- |
| Externa | capa | lombada |
| Pré-textual | folha de rosto, folha de aprovação, resumo em língua vernácula, resumo em língua estrangeira e sumário | ficha catalográfica, errata, dedicatória, agradecimentos, epígrafe e listas |
| Textual | conteúdo organizado pela autoria | títulos das divisões textuais ficam a cargo da autoria |
| Pós-textual | referências | glossário, apêndices, anexos e índice |

A ficha catalográfica é um ponto de extensão: o pacote apenas posiciona o
conteúdo fornecido. A preparação desses dados permanece com profissional
habilitado. A folha de aprovação é obrigatória; o teste sem ela verifica que
a ausência é diagnosticada, não que ela possa ser omitida em uma versão
final.

## Validação

`\ABNTEXvalidateacademico` verifica:

- perfil acadêmico e tipo do trabalho;
- metadados obrigatórios;
- capa, folha de rosto e folha de aprovação;
- resumos nos dois idiomas e sumário;
- referências.

Quando qualquer comando coordenador é usado, a validação completa também
ocorre no fim do documento. Elementos opcionais ausentes não geram páginas,
espaços nem avisos.

O diagnóstico comprova completude técnica observável. Ele não examina a
qualidade intelectual do conteúdo, regras próprias de programas de
pós-graduação nem conformidade semântica das referências.

## Exemplo e processamento

[`examples/trabalho-academico.tex`](../examples/trabalho-academico.tex)
apresenta uma dissertação completa. Como o exemplo possui bibliografia, use:

```sh
pdflatex trabalho-academico
biber trabalho-academico
pdflatex trabalho-academico
pdflatex trabalho-academico
```

O exemplo usa `biblatex-abnt` por meio da opção explícita
`citacoes=autor-data`. Consulte também
[`backmatter.md`](backmatter.md) para os limites da integração bibliográfica.

## Estado normativo

Os requisitos implementados são rastreados em
[`requisitos/nbr-14724-2024.md`](requisitos/nbr-14724-2024.md). Os testes
automatizados cobrem os quatro tipos de configuração, a ordem das fases e a
presença ou ausência da ficha catalográfica e da folha de aprovação.

Ainda é necessária revisão normativa independente antes de alegar
conformidade ou encerrar formalmente o Marco 7.
