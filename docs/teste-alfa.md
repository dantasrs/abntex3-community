# Teste público da versão alfa

O objetivo da linha `0.1.0-alpha` é recolher experiências reais de instalação,
uso e migração antes do congelamento progressivo da API. Não use a alfa como
declaração automática de conformidade normativa.

## Baixar e verificar

Na página de Releases, baixe `abntex3.tds.zip` e `SHA256SUMS`. No diretório em
que os arquivos foram salvos, confira a integridade no Linux:

```sh
sha256sum --check SHA256SUMS --ignore-missing
```

No macOS:

```sh
grep 'abntex3.tds.zip' SHA256SUMS | shasum -a 256 --check
```

No PowerShell do Windows:

```powershell
$esperado = (Select-String 'abntex3.tds.zip' SHA256SUMS).Line.Split(' ')[0]
$obtido = (Get-FileHash abntex3.tds.zip -Algorithm SHA256).Hash.ToLower()
if ($obtido -ne $esperado) { throw 'O resumo SHA-256 não confere.' }
```

O ZIP TDS pode ser extraído em uma árvore TeX local de ensaio. Evite substituir
uma instalação de produção. Em sistemas Unix, por exemplo:

```sh
mkdir -p /caminho/temporario/texmf
unzip abntex3.tds.zip -d /caminho/temporario/texmf
TEXMFHOME=/caminho/temporario/texmf lualatex documento.tex
```

LuaLaTeX é o único motor suportado. Bibliografias devem usar `biber` e
`biblatex-abnt`.

## Exemplo mínimo

```tex
\documentclass{report}
\usepackage[brazilian]{babel}
\usepackage[perfil=academico,tipo-trabalho=dissertacao]{abntex3}

\ABNTEXsetup{
  titulo={Documento de ensaio},
  autoria={Nome da autoria},
  instituicao={Instituição},
  natureza={Dissertação},
  objetivo={apresentada para obtenção do título},
  area={Área de concentração},
  orientacao={Nome da orientação},
  local={Cidade},
  data={2026}
}

\begin{document}
\ABNTEXacademicoexterna
\ABNTEXacademicopretextual
\ABNTEXfolhaderosto
\ABNTEXsumario
\ABNTEXacademicotextual
\chapter{Introdução}
Texto do ensaio.
\end{document}
```

## Enviar um relato útil

Use o formulário **Relato de uso ou migração** nas issues e informe:

- versão exata e origem do artefato;
- sistema operacional e versão do TeX Live;
- classe-base e perfil usados;
- experiência anterior com abnTeX2, quando houver;
- comandos que precisaram ser adaptados;
- um exemplo mínimo sem dados pessoais nem conteúdo protegido.

Erros reproduzíveis continuam no formulário de bug. Divergências normativas
devem usar o formulário próprio e indicar norma, edição e item sem transcrever
trechos extensos.
