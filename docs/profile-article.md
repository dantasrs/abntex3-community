# Perfil de artigo

O perfil `artigo` coordena a estrutura da ABNT NBR 6022:2018 sem reutilizar
comandos próprios do perfil acadêmico. Ele admite uma ou várias autorias e
separa os dados editoriais dos metadados bibliográficos.

```tex
\usepackage[perfil=artigo,artigo-colunas=duas,citacoes=autor-data]{abntex3}
\ABNTEXsetup{titulo={Título},subtitulo={Subtítulo}}
\ABNTEXartigoSetup{
  titulo-outro-idioma={Title},
  resumo={Texto do resumo.},
  palavras-chave={normalização; artigo},
  resumo-outro-idioma={Abstract text.},
  palavras-chave-outro-idioma={standardization; article},
  data-submissao={10 de janeiro de 2026},
  data-aprovacao={20 de março de 2026},
  identificacao-disponibilidade={DOI: 10.0000/exemplo}
}
\ABNTEXartigoautor
  {Ana Silva}{Doutora em Ciência da Informação}
  {Universidade Exemplo}{ana@example.org}
```

`titulo-outro-idioma`, o resumo estrangeiro e a identificação de acesso são
opcionais. Título, pelo menos uma autoria, resumo, palavras-chave e as duas
datas editoriais são validados. O argumento opcional dos três comandos
textuais permite adaptar seus títulos:

```tex
\ABNTEXartigopretextual
\ABNTEXartigotextual
\ABNTEXartigointroducao[Contexto]{...}
\ABNTEXartigodesenvolvimento[Resultados e discussão]{...}
\ABNTEXartigoconsideracoesfinais{...}
\ABNTEXartigopostextual
\ABNTEXbibliografia
\ABNTEXartigoagradecimentos{...}
```

Os agradecimentos devem ser o último elemento. A opção `artigo-colunas=uma`
é o padrão; `duas` é uma escolha editorial, não uma regra normativa.
