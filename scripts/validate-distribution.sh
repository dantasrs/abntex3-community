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

forbidden_pattern='(^|/)(bases|\.git)(/|$)|ABNT-NBR[^/]*\.pdf$|\.(aux|bcf|blg|bbl|fdb_latexmk|fls|glo|gls|idx|ilg|ind|log|out|run\.xml|synctex\.gz|toc)$'
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
  for example in minimo estrutura-sumario layout-paginacao; do
    cp "${project_dir}/examples/${example}.tex" "${run_dir}/${example}.tex"
    (
      cd "${run_dir}"
      TEXMFHOME="${texmf_home}" TEXMFVAR="${run_dir}/texmf-var" \
        pdflatex -interaction=nonstopmode -halt-on-error \
          "${example}.tex" >/dev/null
      if [[ "${example}" == "estrutura-sumario" || \
            "${example}" == "layout-paginacao" ]]; then
        TEXMFHOME="${texmf_home}" TEXMFVAR="${run_dir}/texmf-var" \
          pdflatex -interaction=nonstopmode -halt-on-error \
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
