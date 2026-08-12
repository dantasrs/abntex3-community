module = "abntex3"

release_version = "0.1.0-alpha.1"
release_date = "2026-08-03"

sourcefiledir = "source"
testfiledir = "testfiles"
checksuppfiles = {"*.sty"}

sourcefiles = {"*.dtx", "*.ins"}
unpackfiles = {"*.ins"}
installfiles = {"*.sty"}
typesetfiles = {"*.dtx"}
typesetexe = "lualatex"
demofiles = {"examples/*.tex", "examples/*.bib"}
docfiles = {
  "docs/api.md",
  "docs/estabilidade-api.md",
  "docs/auditorias/*.md",
  "docs/backmatter.md",
  "docs/frontmatter.md",
  "docs/layout.md",
  "docs/modelos-canonicos.md",
  "docs/profile-academic.md",
  "docs/profile-project.md",
  "docs/profile-article.md",
  "docs/profile-report.md",
  "docs/profile-book.md",
  "docs/compatibilidade.md",
  "docs/qualidade-portabilidade.md",
  "docs/teste-alfa.md",
  "docs/releases/*.md",
  "docs/structure.md",
  "docs/requisitos/*.md"
}
textfiles = {"README.md", "CHANGELOG.md", "LICENSE", "manifest.txt"}

checkengines = {"luatex"}
stdengine = "luatex"
checkruns = 1
typesetruns = 2

ctanreadme = "README.md"
packtdszip = true
flatten = false

excludefiles = {
  "*~",
  "build.lua",
  "config-*.lua",
  "bases/**",
  ".git/**",
  ".github/**",
  "build/**"
}
