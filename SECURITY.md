# Política de segurança

## Versões atendidas

O projeto ainda não possui versão pública utilizável. Enquanto estiver na fase
de fundação, somente a branch `main` recebe correções de segurança.

Após a versão `1.0.0`, esta tabela será atualizada para indicar explicitamente
as linhas mantidas.

| Versão | Suporte |
| --- | --- |
| `main` | Sim |
| versões ainda não publicadas | Não se aplica |

## Como relatar uma vulnerabilidade

Não abra uma issue pública para vulnerabilidades que possam expor usuários,
artefatos, infraestrutura de release ou cadeia de fornecimento.

Use preferencialmente um
[relato privado de vulnerabilidade no GitHub](https://github.com/dantasrs/abntex3-community/security/advisories/new).
Se esse recurso não estiver disponível, escreva para
`recifersd@gmail.com` com o assunto `Segurança — abntex3-community`.

Inclua, quando possível:

- descrição e impacto esperado;
- versão, commit e ambiente afetados;
- passos mínimos para reprodução;
- prova de conceito sem dados sensíveis;
- sugestões de mitigação;
- forma segura de contato.

## Processo de resposta

O mantenedor procurará:

1. confirmar o recebimento em até sete dias;
2. avaliar impacto e reprodutibilidade;
3. combinar divulgação coordenada quando a vulnerabilidade for confirmada;
4. preparar correção, testes e aviso de segurança;
5. creditar a pessoa relatora, se ela desejar.

Os prazos de correção dependerão da gravidade e da complexidade. Informações
sobre vulnerabilidades confirmadas permanecerão restritas até que exista uma
mitigação razoável.

## Escopo

São especialmente relevantes:

- execução inesperada de comandos durante build, testes ou instalação;
- inclusão indevida de arquivos nos artefatos CTAN/TDS;
- comprometimento de dependências ou automações de release;
- escrita fora das árvores de build documentadas;
- vulnerabilidades em exemplos que possam ser copiadas por usuários.

Erros de formatação ou divergências normativas sem impacto de segurança devem
ser relatados pelos templates comuns de issue.
