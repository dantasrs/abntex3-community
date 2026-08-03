#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
archive="${1:-${project_dir}/abntex3-ctan.zip}"

if [[ ! -f "${archive}" ]]; then
  echo "Artefato CTAN não encontrado: ${archive}" >&2
  exit 1
fi

work_dir="$(mktemp -d)"
trap 'rm -rf "${work_dir}"' EXIT

archive_list="${work_dir}/archive-files.txt"
unzip -Z1 "${archive}" > "${archive_list}"

forbidden_pattern='(^|/)(bases|\.git)(/|$)|ABNT-NBR[^/]*\.pdf$|\.(acn|acr|alg|aux|bcf|blg|bbl|fdb_latexmk|fls|glg|glo|gls|ist|idx|ilg|ind|log|out|run\.xml|synctex\.gz|toc)$'
if grep -E "${forbidden_pattern}" "${archive_list}"; then
  echo "O artefato contém arquivos não permitidos." >&2
  exit 1
fi

installed_tree="${work_dir}/installed-texmf"
mkdir -p "${installed_tree}"
(
  cd "${project_dir}"
  l3build install --texmfhome "${installed_tree}"
)

compile_example() {
  local texmf_home="$1"
  local run_dir="$2"
  local resolved_package
  local example

  mkdir -p "${run_dir}" "${run_dir}/texmf-var"
  resolved_package="$(
    TEXMFHOME="${texmf_home}" TEXMFVAR="${run_dir}/texmf-var" \
      kpsewhich abntex3.sty
  )"
  if [[ "${resolved_package}" != "${texmf_home}"/* ]]; then
    echo "O pacote resolvido não pertence à árvore isolada: ${resolved_package}" >&2
    exit 1
  fi
  for example in \
    minimo \
    estrutura-sumario \
    layout-paginacao \
    elementos-pretextuais \
    pos-textuais-bibliografia \
    trabalho-academico \
    projeto-pesquisa \
    artigo \
    relatorio-tecnico \
    livro \
    qualidade-pdf \
    modelo-tese-completo \
    modelo-dissertacao-completo \
    modelo-tcc-completo \
    modelo-monografia-completo \
    modelo-projeto-pesquisa-completo \
    modelo-artigo-uma-coluna-completo \
    modelo-artigo-duas-colunas-completo \
    modelo-relatorio-cientifico-completo
  do
    cp "${project_dir}/examples/${example}.tex" "${run_dir}/${example}.tex"
    if [[ "${example}" == "pos-textuais-bibliografia" || \
          "${example}" == "trabalho-academico" || \
          "${example}" == "projeto-pesquisa" || \
          "${example}" == "artigo" || \
          "${example}" == "relatorio-tecnico" || \
          "${example}" == "livro" || \
          "${example}" == modelo-* ]]; then
      cp "${project_dir}/examples/referencias-exemplo.bib" \
        "${run_dir}/referencias-exemplo.bib"
    fi
    (
      cd "${run_dir}"
      TEXMFHOME="${texmf_home}" TEXMFVAR="${run_dir}/texmf-var" \
        lualatex -interaction=nonstopmode -halt-on-error \
          "${example}.tex" >/dev/null
      if [[ "${example}" == "pos-textuais-bibliografia" || \
            "${example}" == "trabalho-academico" || \
            "${example}" == "projeto-pesquisa" || \
            "${example}" == "artigo" || \
            "${example}" == "livro" || \
            "${example}" == modelo-* ]]; then
        if ! command -v biber >/dev/null 2>&1; then
          echo "biber não está disponível para o ensaio bibliográfico." >&2
          exit 1
        fi
        biber "${example}" >/dev/null
        if [[ "${example}" == "pos-textuais-bibliografia" || \
              "${example}" == "modelo-tese-completo" || \
              "${example}" == "modelo-dissertacao-completo" || \
              "${example}" == "modelo-tcc-completo" || \
              "${example}" == "modelo-monografia-completo" || \
              "${example}" == "modelo-projeto-pesquisa-completo" || \
              "${example}" == "livro" || \
              "${example}" == "modelo-relatorio-cientifico-completo" ]]; then
          makeindex "${example}" >/dev/null
        fi
        if [[ "${example}" == modelo-* || "${example}" == "livro" ]]; then
          if ! command -v makeglossaries >/dev/null 2>&1; then
            echo "makeglossaries não está disponível para os modelos canônicos." >&2
            exit 1
          fi
          makeglossaries "${example}" >/dev/null
        fi
        TEXMFHOME="${texmf_home}" TEXMFVAR="${run_dir}/texmf-var" \
          lualatex -interaction=nonstopmode -halt-on-error \
            "${example}.tex" >/dev/null
        TEXMFHOME="${texmf_home}" TEXMFVAR="${run_dir}/texmf-var" \
          lualatex -interaction=nonstopmode -halt-on-error \
            "${example}.tex" >/dev/null
      elif [[ "${example}" == "estrutura-sumario" || \
            "${example}" == "layout-paginacao" || \
            "${example}" == "elementos-pretextuais" || \
            "${example}" == "qualidade-pdf" ]]; then
        TEXMFHOME="${texmf_home}" TEXMFVAR="${run_dir}/texmf-var" \
          lualatex -interaction=nonstopmode -halt-on-error \
            "${example}.tex" >/dev/null
      fi
    )
  done
}

compile_example "${installed_tree}" "${work_dir}/installed-example"

tds_member="$(grep -E '\.tds\.zip$' "${archive_list}" | head -n 1)"
if [[ -z "${tds_member}" ]]; then
  echo "O artefato CTAN não contém um pacote TDS." >&2
  exit 1
fi

unzip -p "${archive}" "${tds_member}" > "${work_dir}/abntex3.tds.zip"
packaged_tree="${work_dir}/packaged-texmf"
mkdir -p "${packaged_tree}"
unzip -Z1 "${work_dir}/abntex3.tds.zip" > "${work_dir}/tds-files.txt"
if grep -E "${forbidden_pattern}" "${work_dir}/tds-files.txt"; then
  echo "O pacote TDS contém arquivos não permitidos." >&2
  exit 1
fi
unzip -q "${work_dir}/abntex3.tds.zip" -d "${packaged_tree}"
compile_example "${packaged_tree}" "${work_dir}/packaged-example"

echo "Distribuição validada: arquivos permitidos e exemplos compilados via instalação e TDS."
