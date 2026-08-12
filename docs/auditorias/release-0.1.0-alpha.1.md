# Auditoria da release `0.1.0-alpha.1`

- Data da auditoria: 2026-08-09
- Release: [`v0.1.0-alpha.1`](https://github.com/dantasrs/abntex3-community/releases/tag/v0.1.0-alpha.1)
- Natureza: verificação técnica de integridade, licença, atribuição e conteúdo

Esta auditoria registra o que pôde ser verificado objetivamente nos artefatos
publicados. Ela não é parecer jurídico nem revisão normativa independente.

## Artefatos examinados

| Arquivo | Tamanho publicado | SHA-256 |
| --- | ---: | --- |
| `abntex3-ctan.zip` | 2 131 785 bytes | `eef5e5864a408d1001be94fe133912f0accd8f87bf922302b865c08c304d488e` |
| `abntex3.tds.zip` | 1 084 917 bytes | `93bbd123d85642ce394b275ca5a98b789cfd391c03f9091cfe668306ac93bbdb` |
| `SHA256SUMS` | 165 bytes | `e6ca7117153526c0e470bcde98d5991d9a5d94e82fe44bb96bd69cbc8388e358` |

Os resumos expostos pela API do GitHub coincidem com `SHA256SUMS`; a
verificação local por `sha256sum -c` aprovou os dois ZIPs.

## Conteúdo e integridade

- `unzip -t` aprovou todos os membros dos ZIPs CTAN e TDS;
- o TDS contém os treze pacotes `.sty` esperados nascidos das fontes `.dtx`;
- fontes, documentação, exemplos e matrizes de requisitos acompanham o pacote;
- `LICENSE` e `manifest.txt` estão presentes na documentação distribuída;
- não foram encontrados `bases/`, `.git/`, PDFs de normas ABNT nem resíduos de
  compilação proibidos pela validação de distribuição;
- os PDFs encontrados são exclusivamente documentação gerada pelo projeto.

## Licença e atribuição

O trabalho declara LPPL 1.3c ou posterior, estado `maintained` e o mantenedor
atual no `manifest.txt`. O README identifica o projeto como continuação
comunitária independente, atribui a origem histórica ao `abntex3` original e
o antecedente técnico ao `abntex2`, e afirma não incorporar código desses
projetos nesta fase. Não há dependências vendorizadas no artefato.

## Resultado e limites

A distribuição publicada é íntegra e coerente com as salvaguardas técnicas do
projeto. A auditoria de licença, atribuições e conteúdo dos artefatos da
primeira alfa está concluída. Continuam pendentes a experiência de usuários,
a revisão normativa independente das doze matrizes e qualquer avaliação
jurídica externa que venha a ser considerada necessária.
