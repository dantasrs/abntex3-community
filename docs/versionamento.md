# Política de versionamento e releases

## Formato

O projeto adota o Versionamento Semântico 2.0.0:

```text
MAJOR.MINOR.PATCH
```

- `MAJOR`: mudança incompatível na API pública;
- `MINOR`: funcionalidade nova compatível;
- `PATCH`: correção compatível.

Tags Git usarão o prefixo `v`, por exemplo `v1.2.3`. O número exposto pelo
pacote LaTeX e pelos metadados de release não usará esse prefixo.

## Fase anterior à versão 1.0

Versões `0.x.y` representam desenvolvimento:

- `0.MINOR.0` pode alterar a API;
- `0.MINOR.PATCH` corrige a linha menor sem incompatibilidade intencional;
- toda incompatibilidade deve ser registrada no changelog e no guia de
  migração;
- uma API só será declarada estável após revisão, testes e documentação.

A primeira candidata alfa é `0.1.0-alpha.1`. A passagem para `1.0.0` exige o
cumprimento do Marco 15 do roadmap.

## API pública

Fazem parte do contrato de compatibilidade:

- comandos, ambientes, opções e chaves documentados;
- nomes de perfis publicados;
- formatos de configuração declarados estáveis;
- comportamentos normativos expressamente cobertos.

Comandos internos, arquivos de build, detalhes de implementação e nomes
marcados como experimentais não fazem parte da API estável.

## Pré-releases

Identificadores aceitos:

- `0.1.0-alpha.1`;
- `0.1.0-beta.1`;
- `1.0.0-rc.1`.

Pré-releases não recebem garantia de compatibilidade com a seguinte
pré-release. Metadados de build podem ser usados em artefatos locais, mas não
substituem tags oficiais.

## Depreciação

Após `1.0.0`, uma interface pública obsoleta deverá:

1. ser marcada na documentação e no changelog;
2. emitir aviso claro com a substituição indicada;
3. permanecer funcional até a próxima versão principal, salvo motivo de
   segurança ou impossibilidade técnica;
4. ter teste que cubra o período de transição.

## Alterações normativas

Uma nova edição ou emenda de norma não determina sozinha o tipo da versão:

- correção compatível de interpretação: `PATCH`;
- nova opção ou perfil compatível: `MINOR`;
- alteração necessária que mude a saída padrão ou remova API: `MAJOR`.

A edição anterior pode permanecer disponível como perfil de compatibilidade
quando houver demanda, capacidade de manutenção e ausência de conflito.

## Fontes de versão

A versão e a data canônicas ficam em `release_version` e `release_date`, no
`build.lua`, e são verificadas por `scripts/check-release.sh`. Em cada release
devem ser sincronizados:

- cabeçalho `\ProvidesPackage`;
- `CHANGELOG.md`;
- `CITATION.cff`;
- manual e README;
- tag e GitHub Release;
- metadados submetidos ao CTAN.

Uma versão publicada é imutável. Qualquer correção produz uma nova versão.

## Processo de pré-release

1. Preparar a candidata em uma branch, sincronizando todos os metadados.
2. Executar `scripts/check-release.sh` e as validações técnicas completas.
3. Mesclar o PR na `main` protegida e sincronizar o checkout local.
4. Criar uma tag anotada `v<versão>` apontando exatamente para a `main`.
5. Enviar somente a tag; `.github/workflows/release.yml` valida novamente,
   gera os ZIPs CTAN e TDS, calcula SHA-256 e publica uma pré-release.

O workflow rejeita tags divergentes do `build.lua`. Tags e artefatos
publicados não devem ser movidos, substituídos nem enviados com `--force`.
Falhas produzem uma nova execução ou uma nova candidata, nunca a alteração de
uma versão já publicada. A linha alfa não é submetida ao CTAN.

## Suporte

Até `1.0.0`, apenas a linha de desenvolvimento corrente recebe correções.
Depois de `1.0.0`, a versão principal corrente recebe correções compatíveis.
Suporte estendido a uma versão principal anterior será anunciado
explicitamente; na ausência de anúncio, não deve ser presumido.
