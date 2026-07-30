module = "abntex3"

sourcefiledir = "source"
testfiledir = "testfiles"
checksuppfiles = {"*.sty"}

sourcefiles = {"*.dtx", "*.ins"}
unpackfiles = {"*.ins"}
installfiles = {"*.sty"}
typesetfiles = {"*.dtx"}
demofiles = {"examples/*.tex", "examples/*.bib"}
docfiles = {
  "docs/api.md",
  "docs/backmatter.md",
  "docs/frontmatter.md",
  "docs/layout.md",
  "docs/modelos-canonicos.md",
  "docs/profile-academic.md",
  "docs/profile-project.md",
  "docs/profile-article.md",
  "docs/profile-report.md",
  "docs/structure.md",
  "docs/requisitos/*.md"
}
textfiles = {"README.md", "CHANGELOG.md", "LICENSE", "manifest.txt"}

checkengines = {"pdftex", "luatex", "xetex"}
stdengine = "pdftex"
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
