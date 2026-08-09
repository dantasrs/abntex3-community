#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
build_file="${project_dir}/build.lua"

release_version="$(
  sed -n -E 's/^release_version = "([^"]+)"$/\1/p' "${build_file}"
)"
release_date="$(
  sed -n -E 's/^release_date = "([^"]+)"$/\1/p' "${build_file}"
)"

if [[ -z "${release_version}" || -z "${release_date}" ]]; then
  echo "Versão ou data canônica ausente em build.lua." >&2
  exit 1
fi
if [[ ! "${release_version}" =~ ^0\.[0-9]+\.[0-9]+-(alpha|beta)\.[0-9]+$ ]]; then
  echo "A candidata não usa um identificador alfa ou beta válido: ${release_version}" >&2
  exit 1
fi
if [[ ! "${release_date}" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
  echo "Data de release inválida: ${release_date}" >&2
  exit 1
fi

requested_tag="${1:-}"
if [[ -n "${requested_tag}" && "${requested_tag}" != "v${release_version}" ]]; then
  echo "A tag ${requested_tag} diverge da versão v${release_version}." >&2
  exit 1
fi

for source_file in "${project_dir}"/source/*.dtx; do
  if ! grep -Fq "\\date{${release_date} v${release_version}}" "${source_file}"; then
    echo "Cabeçalho de documentação divergente: ${source_file}" >&2
    exit 1
  fi
  if grep -Fq '%<*package>' "${source_file}"; then
    if ! grep -Fq "{${release_date}}{${release_version}}" "${source_file}"; then
      echo "Metadado de pacote divergente: ${source_file}" >&2
      exit 1
    fi
  fi
done

grep -Fqx "version: ${release_version}" "${project_dir}/CITATION.cff"
grep -Fqx "date-released: ${release_date}" "${project_dir}/CITATION.cff"
grep -Fq "## [${release_version}] - ${release_date}" \
  "${project_dir}/CHANGELOG.md"
grep -Fq "${release_version}" "${project_dir}/README.md"
grep -Fq "# abnTeX3 Community ${release_version}" \
  "${project_dir}/docs/releases/${release_version}.md"

if rg -n '0\.0\.0' "${project_dir}" \
  --glob '!bases/**' --glob '!build/**' --glob '!.git/**' \
  --glob '!scripts/check-release.sh'; then
  echo "A versão provisória 0.0.0 ainda aparece em arquivo versionado." >&2
  exit 1
fi

ctan_zip="${project_dir}/abntex3-ctan.zip"
tds_zip="${project_dir}/abntex3.tds.zip"
if [[ -f "${ctan_zip}" || -f "${tds_zip}" ]]; then
  if [[ ! -f "${ctan_zip}" || ! -f "${tds_zip}" ]]; then
    echo "Apenas um dos dois artefatos esperados foi encontrado." >&2
    exit 1
  fi
  if ! unzip -p "${tds_zip}" tex/latex/abntex3/abntex3.sty \
    | grep -F "{${release_date}}{${release_version}}" >/dev/null; then
    echo "O pacote principal no TDS não contém a versão esperada." >&2
    exit 1
  fi
  if ! unzip -l "${ctan_zip}" \
    | grep -F "abntex3/${release_version}.md" >/dev/null; then
    echo "As notas da candidata não estão no ZIP CTAN." >&2
    exit 1
  fi
fi

echo "Metadados da candidata v${release_version} estão sincronizados."
