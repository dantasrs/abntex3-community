#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
baseline="${project_dir}/testfiles/visual/qualidade-pdf-pagina-1.png"
metrics_dir="${project_dir}/build/quality"
work_dir="$(mktemp -d)"
trap 'rm -rf "${work_dir}"' EXIT

for tool in lualatex pdfinfo pdftotext pdftoppm qpdf compare; do
  if ! command -v "${tool}" >/dev/null 2>&1; then
    echo "Ferramenta obrigatória ausente: ${tool}" >&2
    exit 1
  fi
done

(
  cd "${project_dir}"
  l3build unpack >/dev/null
)

cp "${project_dir}/examples/qualidade-pdf.tex" "${work_dir}/"
mkdir -p "${work_dir}/texmf-var"
start_seconds="$(date +%s)"
(
  cd "${work_dir}"
  for pass in 1 2; do
    if ! TEXMFVAR="${work_dir}/texmf-var" \
      TEXINPUTS="${project_dir}/build/unpacked//:" \
      lualatex -interaction=nonstopmode -halt-on-error -recorder \
        qualidade-pdf.tex > "compilacao-${pass}.txt" 2>&1; then
      cat "compilacao-${pass}.txt" >&2
      exit 1
    fi
  done
)
elapsed_seconds="$(( $(date +%s) - start_seconds ))"

pdfinfo "${work_dir}/qualidade-pdf.pdf" > "${work_dir}/pdfinfo.txt"
pdftotext "${work_dir}/qualidade-pdf.pdf" "${work_dir}/conteudo.txt"
qpdf --json "${work_dir}/qualidade-pdf.pdf" > "${work_dir}/estrutura.json"

grep -Fq 'Title:           Auditoria de qualidade do PDF' \
  "${work_dir}/pdfinfo.txt"
grep -Fq 'Author:          Equipe abnTeX3 Community' \
  "${work_dir}/pdfinfo.txt"
grep -Fq 'Subject:         Portabilidade, metadados e acessibilidade' \
  "${work_dir}/pdfinfo.txt"
grep -Fq 'Keywords:        LaTeX, PDF, qualidade, portabilidade' \
  "${work_dir}/pdfinfo.txt"
grep -Fq 'Creator:         abnTeX3 Community com LuaLaTeX' \
  "${work_dir}/pdfinfo.txt"
grep -Fq 'Tagged:          no' "${work_dir}/pdfinfo.txt"

grep -Fq 'ações, órgãos e informações' "${work_dir}/conteudo.txt"
grep -Fq 'This paragraph verifies a second language' \
  "${work_dir}/conteudo.txt"
grep -Fq '"/Lang": "u:pt-BR"' "${work_dir}/estrutura.json"
grep -Fq '"/Outlines"' "${work_dir}/estrutura.json"
grep -Fq '"/URI": "u:https://github.com/dantasrs/abntex3-community"' \
  "${work_dir}/estrutura.json"
grep -Fq '"/DisplayDocTitle": true' "${work_dir}/estrutura.json"

if grep -Eq \
  'LaTeX Warning|Package .* Warning|Overfull|Underfull|undefined references|Rerun to' \
  "${work_dir}/qualidade-pdf.log"; then
  echo "O exemplo de qualidade produziu avisos bloqueadores:" >&2
  grep -En \
    'LaTeX Warning|Package .* Warning|Overfull|Underfull|undefined references|Rerun to' \
    "${work_dir}/qualidade-pdf.log" >&2
  exit 1
fi

cp "${project_dir}/testfiles/support/quality-messages.tex" "${work_dir}/"
(
  cd "${work_dir}"
  TEXMFVAR="${work_dir}/texmf-var" \
    TEXINPUTS="${project_dir}/build/unpacked//:" \
    lualatex -interaction=nonstopmode -halt-on-error \
      quality-messages.tex >/dev/null
)
grep -A 4 '^Package abntex3 Warning' "${work_dir}/quality-messages.log" \
  > "${work_dir}/mensagens-publicas.txt"
if grep -Eq '__abntex|[gl]__abntex' "${work_dir}/mensagens-publicas.txt"; then
  echo "Uma mensagem pública vazou identificador interno do pacote." >&2
  cat "${work_dir}/mensagens-publicas.txt" >&2
  exit 1
fi

dependency_count="$({
  sed -n -E 's/^INPUT (.*\.(cls|sty))$/\1/p' \
    "${work_dir}/qualidade-pdf.fls" | sort -u
} | wc -l)"
dependency_count="${dependency_count//[[:space:]]/}"
if (( dependency_count > 120 )); then
  echo "Dependências carregadas acima do limite: ${dependency_count} > 120." >&2
  exit 1
fi
if (( elapsed_seconds > 120 )); then
  echo "Compilação acima do limite: ${elapsed_seconds}s > 120s." >&2
  exit 1
fi

pdftoppm -f 1 -singlefile -png -r 96 \
  "${work_dir}/qualidade-pdf.pdf" "${work_dir}/pagina-1" >/dev/null 2>&1

if [[ "${1:-}" == "--update-visual-baseline" ]]; then
  mkdir -p "$(dirname "${baseline}")"
  cp "${work_dir}/pagina-1.png" "${baseline}"
fi
if [[ ! -f "${baseline}" ]]; then
  echo "Baseline visual ausente: ${baseline}" >&2
  exit 1
fi

set +e
visual_difference="$(
  compare -metric AE -fuzz 5% "${baseline}" \
    "${work_dir}/pagina-1.png" null: 2>&1
)"
compare_status="$?"
set -e
visual_difference="${visual_difference%% *}"
if [[ ! "${visual_difference}" =~ ^[0-9]+$ ]]; then
  echo "Métrica visual inválida: ${visual_difference}" >&2
  exit 1
fi
if (( compare_status > 1 || visual_difference > 500 )); then
  echo "Regressão visual acima do limite: ${visual_difference} pixels." >&2
  exit 1
fi

mkdir -p "${metrics_dir}"
{
  echo "motor=$(lualatex --version | sed -n '1p')"
  echo "paginas=$(sed -n -E 's/^Pages:[[:space:]]+//p' "${work_dir}/pdfinfo.txt")"
  echo "dependencias-cls-sty=${dependency_count}"
  echo "compilacao-duas-passagens-segundos=${elapsed_seconds}"
  echo "diferenca-visual-pixels=${visual_difference}"
  echo "pdf-tagged=no"
} > "${metrics_dir}/metrics.txt"

echo "Auditoria de qualidade aprovada."
cat "${metrics_dir}/metrics.txt"
