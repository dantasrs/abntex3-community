# ADR 0006 — Matriz de qualidade e portabilidade

- **Estado:** aceita
- **Data:** 2026-08-03

## Contexto

Uma suíte executada apenas em contêiner Linux não detecta diferenças de
caminhos, processos e ferramentas presentes no Windows e no macOS. Ao mesmo
tempo, repetir todas as versões anuais do TeX Live em todos os sistemas teria
custo desproporcional e ampliaria bastante o tempo da CI.

Metadados corretos e ausência de erro de compilação também não bastam para
afirmar acessibilidade, estabilidade visual ou desempenho aceitável.

## Decisão

1. Manter a matriz histórica do TeX Live 2024, 2025 e 2026 em Linux.
2. Executar a suíte completa no TeX Live 2026 corrente em Windows e macOS.
3. Manter uma auditoria Linux separada para estrutura do PDF, idiomas,
   mensagens, dependências, tempo e regressão visual.
4. Tratar PDF/UA apenas como estudo até existir marcação semântica completa e
   auditoria humana.
5. Isolar a lista mínima de coleções TeX Live em
   `.github/texlive-packages`.

## Consequências

- Cada mudança técnica passa por cinco combinações de sistema e versão, sem
  multiplicar três versões anuais por três sistemas.
- O job de distribuição continua responsável pelo pacote CTAN/TDS; os jobs de
  portabilidade não duplicam esse empacotamento.
- Métricas usam tetos de regressão, não metas comparáveis entre runners.
- A baseline visual é atualizada somente após inspeção de uma mudança
  intencional.
- A instalação multiplataforma depende temporariamente de uma ação obsoleta,
  pois a sucessora recomendada ainda não demonstra cobertura pública no
  Windows. A substituição é uma tarefa de manutenção contínua.
