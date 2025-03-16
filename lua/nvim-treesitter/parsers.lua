local api = vim.api
local ts = vim.treesitter

for ft, lang in pairs {
  automake = "make",
  javascriptreact = "javascript",
  ecma = "javascript",
  jsx = "javascript",
  gyp = "python",
  html_tags = "html",
  ["typescript.tsx"] = "tsx",
  ["terraform-vars"] = "terraform",
  ["html.handlebars"] = "glimmer",
  systemverilog = "verilog",
  dosini = "ini",
  confini = "ini",
  svg = "xml",
  xsd = "xml",
  xslt = "xml",
  expect = "tcl",
  mysql = "sql",
  sbt = "scala",
  neomuttrc = "muttrc",
  clientscript = "runescript",
  rs = "rust",
  ex = "elixir",
  js = "javascript",
  ts = "typescript",
  ["c-sharp"] = "csharp",
  hs = "haskell",
  py = "python",
  erl = "erlang",
  typ = "typst",
  pl = "perl",
  uxn = "uxntal",
} do
  ts.language.register(lang, ft)
end

---@class InstallInfo
---@field url string
---@field branch string|nil
---@field revision string|nil
---@field files string[]
---@field generate_requires_npm boolean|nil
---@field requires_generate_from_grammar boolean|nil
---@field location string|nil
---@field use_makefile boolean|nil
---@field cxx_standard string|nil

---@class ParserInfo
---@field install_info InstallInfo
---@field filetype string
---@field maintainers string[]
---@field experimental boolean|nil
---@field readme_name string|nil

---@type ParserInfo[]
local list = setmetatable({}, {
  __newindex = function(table, parsername, parserconfig)
    rawset(table, parsername, parserconfig)
    if parserconfig.filetype or vim.fn.has "nvim-0.11" == 0 then
      ts.language.register(parsername, parserconfig.filetype or parsername)
    end
  end,
})

local parsers_repo = "https://github.com/amgdev9/treesitter-parsers"

list.ada = {
  install_info = {
    url = parsers_repo,
    files = { "ada/parser.c" },
  },
  maintainers = { "@briot" },
}

list.agda = {
  install_info = {
    url = parsers_repo,
    files = { "agda/parser.c", "agda/scanner.c" },
  },
  maintainers = { "@Decodetalkers" },
}

list.angular = {
  install_info = {
    url = parsers_repo,
    files = { "angular/parser.c", "angular/scanner.c" },
    generate_requires_npm = true,
  },
  filetype = "htmlangular",
  maintainers = { "@dlvandenberg" },
  experimental = true,
}

list.apex = {
  install_info = {
    url = parsers_repo,
    files = { "apex/parser.c" },
    location = "apex",
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.arduino = {
  install_info = {
    url = parsers_repo,
    files = { "arduino/parser.c", "arduino/scanner.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.asm = {
  install_info = {
    url = parsers_repo,
    files = { "asm/parser.c" },
  },
  maintainers = { "@RubixDev" },
}

list.astro = {
  install_info = {
    url = parsers_repo,
    files = { "astro/parser.c", "astro/scanner.c" },
  },
  maintainers = { "@virchau13" },
}

list.authzed = {
  install_info = {
    url = parsers_repo,
    files = { "authzed/parser.c" },
  },
  maintainers = { "@mattpolzin" },
}

list.awk = {
  install_info = {
    url = parsers_repo,
    files = { "awk/parser.c", "awk/scanner.c" },
  },
}

list.bash = {
  install_info = {
    url = parsers_repo,
    files = { "bash/parser.c", "bash/scanner.c" },
  },
  filetype = "sh",
  maintainers = { "@TravonteD" },
}

list.bass = {
  install_info = {
    url = parsers_repo,
    files = { "bass/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.beancount = {
  install_info = {
    url = parsers_repo,
    files = { "beancount/parser.c", "beancount/scanner.c" },
  },
  maintainers = { "@polarmutex" },
}

list.bibtex = {
  install_info = {
    url = parsers_repo,
    files = { "bibtex/parser.c" },
  },
  filetype = "bib",
  maintainers = { "@theHamsta", "@clason" },
}

list.bicep = {
  install_info = {
    url = parsers_repo,
    files = { "bicep/parser.c", "bicep/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.bitbake = {
  install_info = {
    url = parsers_repo,
    files = { "bitbake/parser.c", "bitbake/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.blade = {
  install_info = {
    url = parsers_repo,
    files = { "blade/parser.c" },
  },
  maintainers = { "@calebdw" },
}

list.blueprint = {
  install_info = {
    url = parsers_repo,
    files = { "blueprint/parser.c" },
  },
  maintainers = { "@gabmus" },
  experimental = true,
}

list.bp = {
  install_info = {
    url = parsers_repo,
    files = { "bp/parser.c" },
  },
  maintainers = { "@ambroisie" },
}

list.c = {
  install_info = {
    url = parsers_repo,
    files = { "c/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.c_sharp = {
  install_info = {
    url = parsers_repo,
    files = { "c_sharp/parser.c", "c_sharp/scanner.c" },
  },
  filetype = "cs",
  maintainers = { "@amaanq" },
}

list.cairo = {
  install_info = {
    url = parsers_repo,
    files = { "cairo/parser.c", "cairo/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.capnp = {
  install_info = {
    url = parsers_repo,
    files = { "capnp/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.chatito = {
  install_info = {
    url = parsers_repo,
    files = { "chatito/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.circom = {
  install_info = {
    url = parsers_repo,
    files = { "circom/parser.c" },
  },
  maintainers = { "@alexandr-martirosyan" },
}

list.clojure = {
  install_info = {
    url = parsers_repo,
    files = { "clojure/parser.c" },
  },
  maintainers = { "@NoahTheDuke" },
}

list.cmake = {
  install_info = {
    url = parsers_repo,
    files = { "cmake/parser.c", "cmake/scanner.c" },
  },
  maintainers = { "@uyha" },
}

list.comment = {
  install_info = {
    url = parsers_repo,
    files = { "comment/parser.c", "comment/scanner.c" },
  },
  maintainers = { "@stsewd" },
}

list.commonlisp = {
  install_info = {
    url = parsers_repo,
    files = { "commonlisp/parser.c" },
    generate_requires_npm = true,
  },
  filetype = "lisp",
  maintainers = { "@theHamsta" },
}

list.cooklang = {
  install_info = {
    url = parsers_repo,
    files = { "cooklang/parser.c", "cooklang/scanner.c" },
  },
  maintainers = { "@addcninblue" },
  filetype = "cook",
}

list.corn = {
  install_info = {
    url = parsers_repo,
    files = { "corn/parser.c" },
  },
  maintainers = { "@jakestanger" },
}

list.cpon = {
  install_info = {
    url = parsers_repo,
    files = { "cpon/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.cpp = {
  install_info = {
    url = parsers_repo,
    files = { "cpp/parser.c", "cpp/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.css = {
  install_info = {
    url = parsers_repo,
    files = { "css/parser.c", "css/scanner.c" },
  },
  maintainers = { "@TravonteD" },
}

list.csv = {
  install_info = {
    url = parsers_repo,
    files = { "csv/parser.c" },
    location = "csv",
  },
  maintainers = { "@amaanq" },
}

list.cuda = {
  install_info = {
    url = parsers_repo,
    files = { "cuda/parser.c", "cuda/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.cue = {
  install_info = {
    url = parsers_repo,
    files = { "cue/parser.c", "cue/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.cylc = {
  install_info = {
    url = parsers_repo,
    files = { "cylc/parser.c" },
  },
  maintainers = { "@elliotfontaine" },
}

list.d = {
  install_info = {
    url = parsers_repo,
    files = { "d/parser.c", "d/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.dart = {
  install_info = {
    url = parsers_repo,
    files = { "dart/parser.c", "dart/scanner.c" },
  },
  maintainers = { "@akinsho" },
}

list.desktop = {
  install_info = {
    url = parsers_repo,
    files = { "desktop/parser.c" },
  },
  maintainers = { "@ValdezFOmar" },
}

list.devicetree = {
  install_info = {
    url = parsers_repo,
    files = { "devicetree/parser.c" },
  },
  filetype = "dts",
  maintainers = { "@jedrzejboczar" },
}

list.dhall = {
  install_info = {
    url = parsers_repo,
    files = { "dhall/parser.c", "dhall/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.diff = {
  install_info = {
    url = parsers_repo,
    files = { "diff/parser.c" },
  },
  filetype = "gitdiff",
  maintainers = { "@gbprod" },
}

list.disassembly = {
  install_info = {
    url = parsers_repo,
    files = { "disassembly/parser.c", "disassembly/scanner.c" },
  },
  maintainers = { "@ColinKennedy" },
}

list.djot = {
  install_info = {
    url = parsers_repo,
    files = { "djot/parser.c", "djot/scanner.c" },
  },
  maintainers = { "@NoahTheDuke" },
}

list.dockerfile = {
  install_info = {
    url = parsers_repo,
    files = { "dockerfile/parser.c", "dockerfile/scanner.c" },
  },
  maintainers = { "@camdencheek" },
}

list.dot = {
  install_info = {
    url = parsers_repo,
    files = { "dot/parser.c" },
  },
  maintainers = { "@rydesun" },
}

list.doxygen = {
  install_info = {
    url = parsers_repo,
    files = { "doxygen/parser.c", "doxygen/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.dtd = {
  install_info = {
    url = parsers_repo,
    files = { "dtd/parser.c", "dtd/scanner.c" },
    location = "dtd",
  },
  maintainers = { "@ObserverOfTime" },
}

list.earthfile = {
  install_info = {
    url = parsers_repo,
    files = { "earthfile/parser.c", "earthfile/scanner.c" },
  },
  maintainers = { "@glehmann" },
}

list.ebnf = {
  install_info = {
    url = parsers_repo,
    files = { "ebnf/parser.c" },
  },
  maintainers = { "@RubixDev" },
  experimental = true,
}

list.editorconfig = {
  install_info = {
    url = parsers_repo,
    files = { "editorconfig/parser.c", "editorconfig/scanner.c" },
  },
  maintainers = { "@ValdezFOmar" },
}

list.eds = {
  install_info = {
    url = parsers_repo,
    files = { "eds/parser.c" },
  },
  maintainers = { "@uyha" },
}

list.eex = {
  install_info = {
    url = parsers_repo,
    files = { "eex/parser.c" },
  },
  filetype = "eelixir",
  maintainers = { "@connorlay" },
}

list.elixir = {
  install_info = {
    url = parsers_repo,
    files = { "elixir/parser.c", "elixir/scanner.c" },
  },
  maintainers = { "@connorlay" },
}

list.elm = {
  install_info = {
    url = parsers_repo,
    files = { "elm/parser.c", "elm/scanner.c" },
  },
  maintainers = { "@zweimach" },
}

list.elsa = {
  install_info = {
    url = parsers_repo,
    files = { "elsa/parser.c" },
  },
  maintainers = { "@glapa-grossklag", "@amaanq" },
}

list.elvish = {
  install_info = {
    url = parsers_repo,
    files = { "elvish/parser.c" },
  },
  maintainers = { "@elves" },
}

list.embedded_template = {
  install_info = {
    url = parsers_repo,
    files = { "embedded_template/parser.c" },
  },
  filetype = "eruby",
}

list.enforce = {
  install_info = {
    url = parsers_repo,
    files = { "enforce/parser.c" },
  },
  maintainers = { "@simonvic" },
}

list.erlang = {
  install_info = {
    url = parsers_repo,
    files = { "erlang/parser.c", "erlang/scanner.c" },
  },
  maintainers = { "@filmor" },
}

list.facility = {
  install_info = {
    url = parsers_repo,
    files = { "facility/parser.c" },
  },
  filetype = "fsd",
  maintainers = { "@bryankenote" },
}

list.faust = {
  install_info = {
    url = parsers_repo,
    files = { "faust/parser.c" },
  },
  filetype = "dsp",
  maintainers = { "@khiner" },
}

list.fennel = {
  install_info = {
    url = parsers_repo,
    files = { "fennel/parser.c", "fennel/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@alexmozaidze" },
}

list.fidl = {
  install_info = {
    url = parsers_repo,
    files = { "fidl/parser.c" },
  },
  maintainers = { "@chaopeng" },
}

list.firrtl = {
  install_info = {
    url = parsers_repo,
    files = { "firrtl/parser.c", "firrtl/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.fish = {
  install_info = {
    url = parsers_repo,
    files = { "fish/parser.c", "fish/scanner.c" },
  },
  maintainers = { "@ram02z" },
}

list.foam = {
  install_info = {
    url = parsers_repo,
    files = { "foam/parser.c", "foam/scanner.c" },
  },
  maintainers = { "@FoamScience" },
  -- Queries might change over time on the grammar's side
  -- Otherwise everything runs fine
  experimental = true,
}

list.forth = {
  install_info = {
    url = parsers_repo,
    files = { "forth/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.fortran = {
  install_info = {
    url = parsers_repo,
    files = { "fortran/parser.c", "fortran/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.fsh = {
  install_info = {
    url = parsers_repo,
    files = { "fsh/parser.c" },
  },
  maintainers = { "@mgramigna" },
}

list.fsharp = {
  install_info = {
    url = parsers_repo,
    files = { "fsharp/parser.c", "fsharp/scanner.c" },
    location = "fsharp",
  },
  maintainers = { "@nsidorenco" },
}

list.func = {
  install_info = {
    url = parsers_repo,
    files = { "func/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.fusion = {
  install_info = {
    url = parsers_repo,
    files = { "fusion/parser.c", "fusion/scanner.c" },
  },
  maintainers = { "@jirgn" },
}

list.gap = {
  install_info = {
    url = parsers_repo,
    files = { "gap/parser.c", "gap/scanner.c" },
  },
  maintainers = { "@reiniscirpons" },
  readme_name = "GAP system",
}

list.gaptst = {
  install_info = {
    url = parsers_repo,
    files = { "gaptst/parser.c", "gaptst/scanner.c" },
  },
  maintainers = { "@reiniscirpons" },
  readme_name = "GAP system test files",
}

list.gdscript = {
  install_info = {
    url = parsers_repo,
    files = { "gdscript/parser.c", "gdscript/scanner.c" },
  },
  maintainers = { "@PrestonKnopp" },
  readme_name = "Godot (gdscript)",
}

list.gdshader = {
  install_info = {
    url = parsers_repo,
    files = { "gdshader/parser.c" },
  },
  filetype = "gdshaderinc",
  maintainers = { "@godofavacyn" },
}

list.git_rebase = {
  install_info = {
    url = parsers_repo,
    files = { "git_rebase/parser.c" },
  },
  filetype = "gitrebase",
  maintainers = { "@gbprod" },
}

list.gitattributes = {
  install_info = {
    url = parsers_repo,
    files = { "gitattributes/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.gitcommit = {
  install_info = {
    url = parsers_repo,
    files = { "gitcommit/parser.c", "gitcommit/scanner.c" },
  },
  maintainers = { "@gbprod" },
}

list.git_config = {
  install_info = {
    url = parsers_repo,
    files = { "git_config/parser.c" },
  },
  filetype = "gitconfig",
  maintainers = { "@amaanq" },
  readme_name = "git_config",
}

list.gitignore = {
  install_info = {
    url = parsers_repo,
    files = { "gitignore/parser.c" },
  },
  maintainers = { "@theHamsta" },
}

list.gleam = {
  install_info = {
    url = parsers_repo,
    files = { "gleam/parser.c", "gleam/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.glimmer = {
  install_info = {
    url = parsers_repo,
    files = { "glimmer/parser.c", "glimmer/scanner.c" },
  },
  filetype = "handlebars",
  maintainers = { "@NullVoxPopuli" },
  readme_name = "Glimmer and Ember",
}

list.glimmer_javascript = {
  install_info = {
    url = parsers_repo,
    files = { "glimmer_javascript/parser.c", "glimmer_javascript/scanner.c" },
    generate_requires_npm = true,
  },
  filetype = "javascript.glimmer",
  maintainers = { "@NullVoxPopuli" },
}

list.glimmer_typescript = {
  install_info = {
    url = parsers_repo,
    files = { "glimmer_typescript/parser.c", "glimmer_typescript/scanner.c" },
    generate_requires_npm = true,
  },
  filetype = "typescript.glimmer",
  maintainers = { "@NullVoxPopuli" },
}

list.glsl = {
  install_info = {
    url = parsers_repo,
    files = { "glsl/parser.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.gn = {
  install_info = {
    url = parsers_repo,
    files = { "gn/parser.c", "gn/scanner.c" },
  },
  maintainers = { "@amaanq" },
  readme_name = "GN (Generate Ninja)",
}

list.gnuplot = {
  install_info = {
    url = parsers_repo,
    files = { "gnuplot/parser.c" },
  },
  maintainers = { "@dpezto" },
}

list.go = {
  install_info = {
    url = parsers_repo,
    files = { "go/parser.c" },
  },
  maintainers = { "@theHamsta", "@WinWisely268" },
}

list.goctl = {
  install_info = {
    url = parsers_repo,
    files = { "goctl/parser.c" },
  },
  maintainers = { "@chaozwn" },
}

list.godot_resource = {
  install_info = {
    url = parsers_repo,
    files = { "godot_resource/parser.c", "godot_resource/scanner.c" },
  },
  filetype = "gdresource",
  maintainers = { "@pierpo" },
  readme_name = "Godot Resources (gdresource)",
}

list.gomod = {
  install_info = {
    url = parsers_repo,
    files = { "gomod/parser.c" },
  },
  maintainers = { "@camdencheek" },
}

list.gosum = {
  install_info = {
    url = parsers_repo,
    files = { "gosum/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.gowork = {
  install_info = {
    url = parsers_repo,
    files = { "gowork/parser.c" },
  },
  maintainers = { "@omertuc" },
}

list.gotmpl = {
  install_info = {
    url = parsers_repo,
    files = { "gotmpl/parser.c" },
  },
  maintainers = { "@qvalentin" },
}

list.gpg = {
  install_info = {
    url = parsers_repo,
    files = { "gpg/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.gren = {
  install_info = {
    files = { "gren/parser.c", "gren/scanner.c" },
    url = parsers_repo,
  },
  maintainers = { "@MaeBrooks" },
}

list.groovy = {
  install_info = {
    url = parsers_repo,
    files = { "groovy/parser.c" },
  },
  maintainers = { "@murtaza64" },
}

list.graphql = {
  install_info = {
    url = parsers_repo,
    files = { "graphql/parser.c" },
  },
  maintainers = { "@bkegley" },
}

list.gstlaunch = {
  install_info = {
    url = parsers_repo,
    files = { "gstlaunch/parser.c" },
  },
  maintainers = { "@theHamsta" },
}

list.hack = {
  install_info = {
    url = parsers_repo,
    files = { "hack/parser.c", "hack/scanner.c" },
  },
}

list.hare = {
  install_info = {
    url = parsers_repo,
    files = { "hare/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.haskell = {
  install_info = {
    url = parsers_repo,
    files = { "haskell/parser.c", "haskell/scanner.c" },
  },
  maintainers = { "@mrcjkb" },
}

list.haskell_persistent = {
  install_info = {
    url = parsers_repo,
    files = { "haskell_persistent/parser.c", "haskell_persistent/scanner.c" },
  },
  filetype = "haskellpersistent",
  maintainers = { "@lykahb" },
}

list.hcl = {
  install_info = {
    url = parsers_repo,
    files = { "hcl/parser.c", "hcl/scanner.c" },
  },
  maintainers = { "@MichaHoffmann" },
}

list.heex = {
  install_info = {
    url = parsers_repo,
    files = { "heex/parser.c" },
  },
  maintainers = { "@connorlay" },
}

list.helm = {
  install_info = {
    url = parsers_repo,
    files = { "helm/parser.c" },
  },
  maintainers = { "@qvalentin" },
}

list.hjson = {
  install_info = {
    url = parsers_repo,
    files = { "hjson/parser.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@winston0410" },
}

list.hlsl = {
  install_info = {
    url = parsers_repo,
    files = { "hlsl/parser.c", "hlsl/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.hocon = {
  install_info = {
    url = parsers_repo,
    files = { "hocon/parser.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@antosha417" },
}

list.hoon = {
  install_info = {
    url = parsers_repo,
    files = { "hoon/parser.c", "hoon/scanner.c" },
  },
  maintainers = { "@urbit-pilled" },
  experimental = true,
}

list.html = {
  install_info = {
    url = parsers_repo,
    files = { "html/parser.c", "html/scanner.c" },
  },
  maintainers = { "@TravonteD" },
}

list.htmldjango = {
  install_info = {
    url = parsers_repo,
    files = { "htmldjango/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
  experimental = true,
}

list.http = {
  install_info = {
    url = parsers_repo,
    files = { "http/parser.c" },
  },
  maintainers = { "@amaanq", "@NTBBloodbath" },
}

list.hurl = {
  install_info = {
    url = parsers_repo,
    files = { "hurl/parser.c" },
  },
  maintainers = { "@pfeiferj" },
}

list.hyprlang = {
  install_info = {
    url = parsers_repo,
    files = { "hyprlang/parser.c" },
  },
  maintainers = { "@luckasRanarison" },
}

list.idl = {
  install_info = {
    url = parsers_repo,
    files = { "idl/parser.c" },
  },
  maintainers = { "@cathaysia" },
}

list.idris = {
  install_info = {
    url = parsers_repo,
    files = { "idris/parser.c", "idris/scanner.c" },
  },
  filetype = "idris2",
  maintainers = { "@srghma" },
}

list.ini = {
  install_info = {
    url = parsers_repo,
    files = { "ini/parser.c" },
  },
  maintainers = { "@theHamsta" },
  experimental = true,
}

list.inko = {
  install_info = {
    url = parsers_repo,
    files = { "inko/parser.c" },
  },
  maintainers = { "@yorickpeterse" },
}

list.ipkg = {
  install_info = {
    url = parsers_repo,
    files = { "ipkg/parser.c", "ipkg/scanner.c" },
  },
  maintainers = { "@srghma" },
}

list.ispc = {
  install_info = {
    url = parsers_repo,
    files = { "ispc/parser.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@fab4100" },
}

list.janet_simple = {
  install_info = {
    url = parsers_repo,
    files = { "janet_simple/parser.c", "janet_simple/scanner.c" },
  },
  filetype = "janet",
  maintainers = { "@sogaiu" },
}

list.java = {
  install_info = {
    url = parsers_repo,
    files = { "java/parser.c" },
  },
  maintainers = { "@p00f" },
}

list.javascript = {
  install_info = {
    url = parsers_repo,
    files = { "javascript/parser.c", "javascript/scanner.c" },
  },
  maintainers = { "@steelsojka" },
}

list.jinja = {
  install_info = {
    url = parsers_repo,
    files = { "jinja/parser.c", "jinja/scanner.c" },
  },
  maintainers = { "@cathaysia" },
}

list.jinja_inline = {
  install_info = {
    url = parsers_repo,
    files = { "jinja_inline/parser.c", "jinja_inline/scanner.c" },
  },
  maintainers = { "@cathaysia" },
}

list.jq = {
  install_info = {
    url = parsers_repo,
    files = { "jq/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.jsdoc = {
  install_info = {
    url = parsers_repo,
    files = { "jsdoc/parser.c", "jsdoc/scanner.c" },
  },
  maintainers = { "@steelsojka" },
}

list.json = {
  install_info = {
    url = parsers_repo,
    files = { "json/parser.c" },
  },
  maintainers = { "@steelsojka" },
}

list.json5 = {
  install_info = {
    url = parsers_repo,
    files = { "json5/parser.c" },
  },
  maintainers = { "@Joakker" },
}

list.jsonc = {
  install_info = {
    url = parsers_repo,
    files = { "jsonc/parser.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@WhyNotHugo" },
  readme_name = "JSON with comments",
}

list.jsonnet = {
  install_info = {
    url = parsers_repo,
    files = { "jsonnet/parser.c", "jsonnet/scanner.c" },
  },
  maintainers = { "@nawordar" },
}

list.julia = {
  install_info = {
    url = parsers_repo,
    files = { "julia/parser.c", "julia/scanner.c" },
  },
  maintainers = { "@fredrikekre" },
}

list.just = {
  install_info = {
    url = parsers_repo,
    files = { "just/parser.c", "just/scanner.c" },
  },
  maintainers = { "@Hubro" },
}

list.kcl = {
  install_info = {
    url = parsers_repo,
    files = { "kcl/parser.c", "kcl/scanner.c" },
  },
  maintainers = { "@bertbaron" },
}

list.kconfig = {
  install_info = {
    url = parsers_repo,
    files = { "kconfig/parser.c", "kconfig/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.kdl = {
  install_info = {
    url = parsers_repo,
    files = { "kdl/parser.c", "kdl/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.kotlin = {
  install_info = {
    url = parsers_repo,
    files = { "kotlin/parser.c", "kotlin/scanner.c" },
  },
  maintainers = { "@SalBakraa" },
}

list.koto = {
  install_info = {
    url = parsers_repo,
    files = { "koto/parser.c", "koto/scanner.c" },
  },
  maintainers = { "@irh" },
}

list.kusto = {
  install_info = {
    url = parsers_repo,
    files = { "kusto/parser.c" },
  },
  maintainers = { "@Willem-J-an" },
}

list.lalrpop = {
  install_info = {
    url = parsers_repo,
    files = { "lalrpop/parser.c", "lalrpop/scanner.c" },
  },
  maintainers = { "@traxys" },
}

list.latex = {
  install_info = {
    url = parsers_repo,
    files = { "latex/parser.c", "latex/scanner.c" },
    requires_generate_from_grammar = true,
  },
  filetype = "tex",
  maintainers = { "@theHamsta", "@clason" },
}

list.ledger = {
  install_info = {
    url = parsers_repo,
    files = { "ledger/parser.c" },
  },
  maintainers = { "@cbarrete" },
}

list.leo = {
  install_info = {
    url = parsers_repo,
    files = { "leo/parser.c" },
  },
  maintainers = { "@r001" },
}

list.llvm = {
  install_info = {
    url = parsers_repo,
    files = { "llvm/parser.c" },
  },
  maintainers = { "@benwilliamgraham" },
}

list.linkerscript = {
  install_info = {
    url = parsers_repo,
    files = { "linkerscript/parser.c" },
  },
  filetype = "ld",
  maintainers = { "@amaanq" },
}

list.liquid = {
  install_info = {
    url = parsers_repo,
    files = { "liquid/parser.c", "liquid/scanner.c" },
  },
  maintainers = { "@hankthetank27" },
}

list.liquidsoap = {
  install_info = {
    url = parsers_repo,
    files = { "liquidsoap/parser.c", "liquidsoap/scanner.c" },
  },
  maintainers = { "@toots" },
}

list.lua = {
  install_info = {
    url = parsers_repo,
    files = { "lua/parser.c", "lua/scanner.c" },
  },
  maintainers = { "@muniftanjim" },
}

list.luadoc = {
  install_info = {
    url = parsers_repo,
    files = { "luadoc/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.luap = {
  install_info = {
    url = parsers_repo,
    files = { "luap/parser.c" },
  },
  maintainers = { "@amaanq" },
  readme_name = "lua patterns",
}

list.luau = {
  install_info = {
    url = parsers_repo,
    files = { "luau/parser.c", "luau/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.hlsplaylist = {
  install_info = {
    url = parsers_repo,
    files = { "hlsplaylist/parser.c" },
  },
  maintainers = { "@Freed-Wu" },
}

list.m68k = {
  install_info = {
    url = parsers_repo,
    files = { "m68k/parser.c" },
  },
  filetype = "asm68k",
  maintainers = { "@grahambates" },
}

list.make = {
  install_info = {
    url = parsers_repo,
    files = { "make/parser.c" },
  },
  maintainers = { "@lewis6991" },
}

list.markdown = {
  install_info = {
    url = parsers_repo,
    location = "tree-sitter-markdown",
    files = { "markdown/parser.c", "markdown/scanner.c" },
  },
  maintainers = { "@MDeiml" },
  readme_name = "markdown (basic highlighting)",
  experimental = true,
}

list.markdown_inline = {
  install_info = {
    url = parsers_repo,
    location = "tree-sitter-markdown-inline",
    files = { "markdown_inline/parser.c", "markdown_inline/scanner.c" },
  },
  maintainers = { "@MDeiml" },
  readme_name = "markdown_inline (needed for full highlighting)",
  experimental = true,
}

list.matlab = {
  install_info = {
    url = parsers_repo,
    files = { "matlab/parser.c", "matlab/scanner.c" },
  },
  maintainers = { "@acristoffers" },
}

list.menhir = {
  install_info = {
    url = parsers_repo,
    files = { "menhir/parser.c", "menhir/scanner.c" },
  },
  maintainers = { "@Kerl13" },
}

list.mermaid = {
  install_info = {
    url = parsers_repo,
    files = { "mermaid/parser.c" },
  },
  experimental = true,
}

list.meson = {
  install_info = {
    url = parsers_repo,
    files = { "meson/parser.c" },
  },
  maintainers = { "@Decodetalkers" },
}

list.mlir = {
  install_info = {
    url = parsers_repo,
    files = { "mlir/parser.c" },
    requires_generate_from_grammar = true,
  },
  experimental = true,
  maintainers = { "@artagnon" },
}

list.muttrc = {
  install_info = {
    url = parsers_repo,
    files = { "muttrc/parser.c" },
  },
  maintainers = { "@Freed-Wu" },
}

list.nasm = {
  install_info = {
    url = parsers_repo,
    files = { "nasm/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.nginx = {
  install_info = {
    url = parsers_repo,
    files = { "nginx/parser.c", "nginx/scanner.c" },
  },
  maintainers = { "@opa-oz" },
}

list.nickel = {
  install_info = {
    url = parsers_repo,
    files = { "nickel/parser.c", "nickel/scanner.c" },
  },
}

list.nim = {
  install_info = {
    url = parsers_repo,
    files = { "nim/parser.c", "nim/scanner.c" },
  },
  maintainers = { "@aMOPel" },
}

list.nim_format_string = {
  install_info = {
    url = parsers_repo,
    files = { "nim_format_string/parser.c" },
  },
  maintainers = { "@aMOPel" },
}

list.ninja = {
  install_info = {
    url = parsers_repo,
    files = { "ninja/parser.c" },
  },
  maintainers = { "@alemuller" },
}

list.nix = {
  install_info = {
    url = parsers_repo,
    files = { "nix/parser.c", "nix/scanner.c" },
  },
  maintainers = { "@leo60228" },
}

list.norg = {
  install_info = {
    url = parsers_repo,
    files = { "norg/parser.c", "norg/scanner.cc" },
    cxx_standard = "c++14",
    use_makefile = true,
  },
  maintainers = { "@JoeyGrajciar", "@vhyrro" },
}

list.nqc = {
  install_info = {
    url = parsers_repo,
    files = { "nqc/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.nu = {
  install_info = {
    url = parsers_repo,
    files = { "nu/parser.c", "nu/scanner.c" },
  },
  maintainers = { "@abhisheksingh0x558" },
}

list.objc = {
  install_info = {
    url = parsers_repo,
    files = { "objc/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.objdump = {
  install_info = {
    url = parsers_repo,
    files = { "objdump/parser.c", "objdump/scanner.c" },
  },
  maintainers = { "@ColinKennedy" },
}

list.ocaml = {
  install_info = {
    url = parsers_repo,
    files = { "ocaml/parser.c", "ocaml/scanner.c" },
    location = "grammars/ocaml",
  },
  maintainers = { "@undu" },
}

list.ocaml_interface = {
  install_info = {
    url = parsers_repo,
    files = { "ocaml_interface/parser.c", "ocaml_interface/scanner.c" },
    location = "grammars/interface",
  },
  filetype = "ocamlinterface",
  maintainers = { "@undu" },
}

list.ocamllex = {
  install_info = {
    url = parsers_repo,
    files = { "ocamllex/parser.c", "ocamllex/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@undu" },
}

list.odin = {
  install_info = {
    url = parsers_repo,
    files = { "odin/parser.c", "odin/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.pascal = {
  install_info = {
    url = parsers_repo,
    files = { "pascal/parser.c" },
  },
  maintainers = { "@Isopod" },
}

list.passwd = {
  install_info = {
    url = parsers_repo,
    files = { "passwd/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.pem = {
  install_info = {
    url = parsers_repo,
    files = { "pem/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.perl = {
  install_info = {
    url = parsers_repo,
    files = { "perl/parser.c", "perl/scanner.c" },
    branch = "release",
  },
  maintainers = { "@RabbiVeesh", "@LeoNerd" },
}

list.php = {
  install_info = {
    url = parsers_repo,
    files = { "php/parser.c", "php/scanner.c" },
  },
  maintainers = { "@tk-shirasaka", "@calebdw" },
}

list.php_only = {
  install_info = {
    url = parsers_repo,
    files = { "php_only/parser.c", "php_only/scanner.c" },
  },
  maintainers = { "@tk-shirasaka", "@calebdw" },
}

-- Parsers for injections
list.phpdoc = {
  install_info = {
    url = parsers_repo,
    files = { "phpdoc/parser.c", "phpdoc/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@mikehaertl" },
  experimental = true,
}

list.pioasm = {
  install_info = {
    url = parsers_repo,
    files = { "pioasm/parser.c", "pioasm/scanner.c" },
  },
  maintainers = { "@leo60228" },
}

list.po = {
  install_info = {
    url = parsers_repo,
    files = { "po/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.pod = {
  install_info = {
    url = parsers_repo,
    files = { "pod/parser.c", "pod/scanner.c" },
    branch = "release",
  },
  maintainers = { "@RabbiVeesh", "@LeoNerd" },
}

list.poe_filter = {
  install_info = {
    url = parsers_repo,
    files = { "poe_filter/parser.c" },
  },
  filetype = "poefilter",
  maintainers = { "@ObserverOfTime" },
  readme_name = "Path of Exile item filter",
  experimental = true,
}

list.pony = {
  install_info = {
    url = parsers_repo,
    files = { "pony/parser.c", "pony/scanner.c" },
  },
  maintainers = { "@amaanq", "@mfelsche" },
}

list.powershell = {
  install_info = {
    url = parsers_repo,
    files = { "powershell/parser.c", "powershell/scanner.c" },
  },
  filetype = "ps1",
  maintainers = { "@L2jLiga" },
}

list.printf = {
  install_info = {
    url = parsers_repo,
    files = { "printf/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.prisma = {
  install_info = {
    url = parsers_repo,
    files = { "prisma/parser.c" },
  },
  maintainers = { "@elianiva" },
}

list.problog = {
  install_info = {
    url = parsers_repo,
    files = { "problog/parser.c" },
  },
  maintainers = { "@foxyseta" },
}

list.prolog = {
  install_info = {
    url = parsers_repo,
    files = { "prolog/parser.c" },
  },
  maintainers = { "@foxyseta" },
}

list.promql = {
  install_info = {
    url = parsers_repo,
    files = { "promql/parser.c" },
    experimental = true,
  },
  maintainers = { "@MichaHoffmann" },
}

list.properties = {
  install_info = {
    url = parsers_repo,
    files = { "properties/parser.c", "properties/scanner.c" },
  },
  filetype = "jproperties",
  maintainers = { "@ObserverOfTime" },
}

list.proto = {
  install_info = {
    url = parsers_repo,
    files = { "proto/parser.c" },
  },
  maintainers = { "@treywood" },
}

list.prql = {
  install_info = {
    url = parsers_repo,
    files = { "prql/parser.c" },
  },
  maintainers = { "@matthias-Q" },
}

list.psv = {
  install_info = {
    url = parsers_repo,
    files = { "psv/parser.c" },
    location = "psv",
  },
  maintainers = { "@amaanq" },
}

list.pug = {
  install_info = {
    url = parsers_repo,
    files = { "pug/parser.c", "pug/scanner.c" },
  },
  maintainers = { "@zealot128" },
  experimental = true,
}

list.puppet = {
  install_info = {
    url = parsers_repo,
    files = { "puppet/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.purescript = {
  install_info = {
    url = parsers_repo,
    files = { "purescript/parser.c", "purescript/scanner.c" },
  },
  maintainers = { "@postsolar" },
}

list.pymanifest = {
  install_info = {
    url = parsers_repo,
    files = { "pymanifest/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
  readme_name = "PyPA manifest",
}

list.python = {
  install_info = {
    url = parsers_repo,
    files = { "python/parser.c", "python/scanner.c" },
  },
  maintainers = { "@stsewd", "@theHamsta" },
}

list.ql = {
  install_info = {
    url = parsers_repo,
    files = { "ql/parser.c" },
  },
  maintainers = { "@pwntester" },
}

list.qmldir = {
  install_info = {
    url = parsers_repo,
    files = { "qmldir/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.qmljs = {
  install_info = {
    url = parsers_repo,
    files = { "qmljs/parser.c", "qmljs/scanner.c" },
  },
  filetype = "qml",
  maintainers = { "@Decodetalkers" },
}

list.query = {
  install_info = {
    url = parsers_repo,
    files = { "query/parser.c" },
  },
  maintainers = { "@steelsojka" },
  readme_name = "Tree-Sitter query language",
}

list.r = {
  install_info = {
    url = parsers_repo,
    files = { "r/parser.c", "r/scanner.c" },
  },
  maintainers = { "@ribru17" },
}

list.racket = {
  install_info = {
    url = parsers_repo,
    files = { "racket/parser.c", "racket/scanner.c" },
  },
}

list.ralph = {
  install_info = {
    url = parsers_repo,
    files = { "ralph/parser.c" },
  },
  maintainers = { "@tdroxler" },
}

list.rasi = {
  install_info = {
    url = parsers_repo,
    files = { "rasi/parser.c" },
  },
  maintainers = { "@Fymyte" },
}

list.razor = {
  install_info = {
    url = parsers_repo,
    files = { "razor/parser.c", "razor/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@tris203" },
}

list.rbs = {
  install_info = {
    url = parsers_repo,
    files = { "rbs/parser.c" },
  },
  maintainers = { "@joker1007" },
}

list.re2c = {
  install_info = {
    url = parsers_repo,
    files = { "re2c/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.readline = {
  install_info = {
    url = parsers_repo,
    files = { "readline/parser.c" },
  },
  maintainers = { "@ribru17" },
}

list.regex = {
  install_info = {
    url = parsers_repo,
    files = { "regex/parser.c" },
  },
  maintainers = { "@theHamsta" },
}

list.rego = {
  install_info = {
    url = parsers_repo,
    files = { "rego/parser.c" },
  },
  maintainers = { "@FallenAngel97" },
}

list.requirements = {
  install_info = {
    url = parsers_repo,
    files = { "requirements/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
  readme_name = "pip requirements",
}

list.rescript = {
  install_info = {
    url = parsers_repo,
    files = { "rescript/parser.c", "rescript/scanner.c" },
  },
  maintainers = { "@ribru17" },
}

list.rnoweb = {
  install_info = {
    url = parsers_repo,
    files = { "rnoweb/parser.c", "rnoweb/scanner.c" },
  },
  maintainers = { "@bamonroe" },
}

list.robot = {
  install_info = {
    url = parsers_repo,
    files = { "robot/parser.c" },
  },
  maintainers = { "@Hubro" },
}

list.robots = {
  install_info = {
    url = parsers_repo,
    files = { "robots/parser.c", "robots/scanner.c" },
  },
  maintainers = { "@opa-oz" },
}

list.roc = {
  install_info = {
    url = parsers_repo,
    files = { "roc/parser.c", "roc/scanner.c" },
  },
  maintainers = { "@nat-418" },
}

list.ron = {
  install_info = {
    url = parsers_repo,
    files = { "ron/parser.c", "ron/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.rst = {
  install_info = {
    url = parsers_repo,
    files = { "rst/parser.c", "rst/scanner.c" },
  },
  maintainers = { "@stsewd" },
}

list.ruby = {
  install_info = {
    url = parsers_repo,
    files = { "ruby/parser.c", "ruby/scanner.c" },
  },
  maintainers = { "@TravonteD" },
}

list.runescript = {
  install_info = {
    url = parsers_repo,
    files = { "runescript/parser.c", "runescript/scanner.c" },
  },
  maintainers = { "@2004Scape" },
}

list.rust = {
  install_info = {
    url = parsers_repo,
    files = { "rust/parser.c", "rust/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.scala = {
  install_info = {
    url = parsers_repo,
    files = { "scala/parser.c", "scala/scanner.c" },
  },
  maintainers = { "@stevanmilic" },
}

list.scfg = {
  install_info = {
    url = parsers_repo,
    files = { "scfg/parser.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@WhyNotHugo" },
}

list.scheme = {
  install_info = {
    url = parsers_repo,
    files = { "scheme/parser.c" },
  },
}

list.scss = {
  install_info = {
    url = parsers_repo,
    files = { "scss/parser.c", "scss/scanner.c" },
  },
  maintainers = { "@elianiva" },
}

list.sflog = {
  install_info = {
    url = parsers_repo,
    files = { "sflog/parser.c" },
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.slang = {
  install_info = {
    url = parsers_repo,
    files = { "slang/parser.c", "slang/scanner.c" },
    generate_requires_npm = true,
  },
  filetype = "shaderslang",
  maintainers = { "@theHamsta" },
  experimental = true,
}

list.slim = {
  install_info = {
    url = parsers_repo,
    files = { "slim/parser.c", "slim/scanner.c" },
  },
  maintainers = { "@theoo" },
}

list.slint = {
  install_info = {
    url = parsers_repo,
    files = { "slint/parser.c" },
  },
  maintainers = { "@hunger" },
}

list.smali = {
  install_info = {
    url = parsers_repo,
    files = { "smali/parser.c", "smali/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.snakemake = {
  install_info = {
    url = parsers_repo,
    files = { "snakemake/parser.c", "snakemake/scanner.c" },
  },
  maintainer = { "@osthomas" },
  experimental = true,
}

list.smithy = {
  install_info = {
    url = parsers_repo,
    files = { "smithy/parser.c" },
  },
  maintainers = { "@amaanq", "@keynmol" },
}

list.solidity = {
  install_info = {
    url = parsers_repo,
    files = { "solidity/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.soql = {
  install_info = {
    url = parsers_repo,
    files = { "soql/parser.c" },
    location = "soql",
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.sosl = {
  install_info = {
    url = parsers_repo,
    files = { "sosl/parser.c" },
    location = "sosl",
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.sourcepawn = {
  install_info = {
    url = parsers_repo,
    files = { "sourcepawn/parser.c", "sourcepawn/scanner.c" },
  },
  maintainers = { "@Sarrus1" },
  tier = 3,
}

list.sparql = {
  install_info = {
    url = parsers_repo,
    files = { "sparql/parser.c" },
  },
  maintainers = { "@GordianDziwis" },
}

list.sql = {
  install_info = {
    url = parsers_repo,
    files = { "sql/parser.c", "sql/scanner.c" },
    branch = "gh-pages",
  },
  maintainers = { "@derekstride" },
}

list.squirrel = {
  install_info = {
    url = parsers_repo,
    files = { "squirrel/parser.c", "squirrel/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.ssh_config = {
  install_info = {
    url = parsers_repo,
    files = { "ssh_config/parser.c" },
  },
  filetype = "sshconfig",
  maintainers = { "@ObserverOfTime" },
}

list.starlark = {
  install_info = {
    url = parsers_repo,
    files = { "starlark/parser.c", "starlark/scanner.c" },
  },
  filetype = "bzl",
  maintainers = { "@amaanq" },
}

list.strace = {
  install_info = {
    url = parsers_repo,
    files = { "strace/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.styled = {
  install_info = {
    url = parsers_repo,
    files = { "styled/parser.c", "styled/scanner.c" },
  },
  maintainers = { "@mskelton" },
}

list.supercollider = {
  install_info = {
    url = parsers_repo,
    files = { "supercollider/parser.c", "supercollider/scanner.c" },
  },
  maintainers = { "@madskjeldgaard" },
}

list.superhtml = {
  install_info = {
    url = parsers_repo,
    files = {
      "superhtml/parser.c",
      "superhtml/scanner.c",
    },
  },
  maintainers = { "@rockorager" },
}

list.surface = {
  install_info = {
    url = parsers_repo,
    files = { "surface/parser.c" },
  },
  filetype = "sface",
  maintainers = { "@connorlay" },
}

list.svelte = {
  install_info = {
    url = parsers_repo,
    files = { "svelte/parser.c", "svelte/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.sway = {
  install_info = {
    url = parsers_repo,
    files = { "sway/parser.c", "sway/scanner.c" },
  },
  maintainers = { "@ribru17" },
}

list.swift = {
  install_info = {
    url = parsers_repo,
    files = { "swift/parser.c", "swift/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@alex-pinkus" },
}

list.sxhkdrc = {
  install_info = {
    url = parsers_repo,
    files = { "sxhkdrc/parser.c" },
  },
  maintainers = { "@RaafatTurki" },
}

list.systemtap = {
  install_info = {
    url = parsers_repo,
    files = { "systemtap/parser.c" },
  },
  maintainers = { "@ok-ryoko" },
}

list.t32 = {
  install_info = {
    url = parsers_repo,
    files = { "t32/parser.c", "t32/scanner.c" },
  },
  filetype = "trace32",
  maintainers = { "@xasc" },
}

list.tablegen = {
  install_info = {
    url = parsers_repo,
    files = { "tablegen/parser.c", "tablegen/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.tact = {
  install_info = {
    url = parsers_repo,
    files = { "tact/parser.c" },
  },
  maintainers = { "@novusnota" },
}

list.teal = {
  install_info = {
    url = parsers_repo,
    files = { "teal/parser.c", "teal/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@euclidianAce" },
}

list.tcl = {
  install_info = {
    url = parsers_repo,
    files = { "tcl/parser.c", "tcl/scanner.c" },
  },
  maintainers = { "@lewis6991" },
}

list.tera = {
  install_info = {
    url = parsers_repo,
    files = { "tera/parser.c", "tera/scanner.c" },
  },
  maintainers = { "@uncenter" },
}

list.terraform = {
  install_info = {
    url = parsers_repo,
    files = { "terraform/parser.c", "terraform/scanner.c" },
    location = "dialects/terraform",
  },
  maintainers = { "@MichaHoffmann" },
}

list.textproto = {
  install_info = {
    url = parsers_repo,
    files = { "textproto/parser.c" },
  },
  filetype = "pbtxt",
  maintainers = { "@Porter" },
}

list.thrift = {
  install_info = {
    url = parsers_repo,
    files = { "thrift/parser.c" },
  },
  maintainers = { "@amaanq", "@duskmoon314" },
}

list.tiger = {
  install_info = {
    url = parsers_repo,
    files = { "tiger/parser.c", "tiger/scanner.c" },
  },
  maintainers = { "@ambroisie" },
}

list.tlaplus = {
  install_info = {
    url = parsers_repo,
    files = { "tlaplus/parser.c", "tlaplus/scanner.c" },
  },
  filetype = "tla",
  maintainers = { "@ahelwer", "@susliko" },
}

list.tmux = {
  install_info = {
    url = parsers_repo,
    files = { "tmux/parser.c" },
  },
  maintainers = { "@Freed-Wu" },
}

list.todotxt = {
  install_info = {
    url = parsers_repo,
    files = { "todotxt/parser.c" },
  },
  maintainers = { "@arnarg" },
  experimental = true,
}

list.toml = {
  install_info = {
    url = parsers_repo,
    files = { "toml/parser.c", "toml/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@tk-shirasaka" },
}

list.tsv = {
  install_info = {
    url = parsers_repo,
    files = { "tsv/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.tsx = {
  install_info = {
    url = parsers_repo,
    files = { "tsx/parser.c", "tsx/scanner.c" },
    generate_requires_npm = true,
  },
  filetype = "typescriptreact",
  maintainers = { "@steelsojka" },
}

list.turtle = {
  install_info = {
    url = parsers_repo,
    files = { "turtle/parser.c" },
  },
  maintainers = { "@GordianDziwis" },
}

list.twig = {
  install_info = {
    url = parsers_repo,
    files = { "twig/parser.c" },
  },
  maintainers = { "@gbprod" },
}

list.typescript = {
  install_info = {
    url = parsers_repo,
    files = { "typescript/parser.c", "typescript/scanner.c" },
    location = "typescript",
    generate_requires_npm = true,
  },
  maintainers = { "@steelsojka" },
}

list.typespec = {
  install_info = {
    url = parsers_repo,
    files = { "typespec/parser.c" },
  },
  maintainers = { "@happenslol" },
}

list.typoscript = {
  install_info = {
    url = parsers_repo,
    files = { "typoscript/parser.c" },
  },
  maintainers = { "@Teddytrombone" },
}

list.typst = {
  install_info = {
    url = parsers_repo,
    files = { "typst/parser.c", "typst/scanner.c" },
  },
  maintainers = { "@uben0", "@RaafatTurki" },
}

list.udev = {
  install_info = {
    url = parsers_repo,
    files = { "udev/parser.c" },
  },
  filetype = "udevrules",
  maintainers = { "@ObserverOfTime" },
}

list.ungrammar = {
  install_info = {
    url = parsers_repo,
    files = { "ungrammar/parser.c" },
  },
  maintainers = { "@Philipp-M", "@amaanq" },
}

list.unison = {
  install_info = {
    url = parsers_repo,
    files = { "unison/parser.c", "unison/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@tapegram" },
}

list.usd = {
  install_info = {
    url = parsers_repo,
    files = { "usd/parser.c" },
  },
  maintainers = { "@ColinKennedy" },
}

list.uxntal = {
  install_info = {
    url = parsers_repo,
    files = { "uxntal/parser.c", "uxntal/scanner.c" },
  },
  filetype = "tal",
  maintainers = { "@amaanq" },
  readme_name = "uxn tal",
}

list.v = {
  install_info = {
    url = parsers_repo,
    files = { "v/parser.c" },
    location = "tree_sitter_v",
  },
  filetype = "vlang",
  maintainers = { "@kkharji", "@amaanq" },
}

list.vala = {
  install_info = {
    url = parsers_repo,
    files = { "vala/parser.c" },
  },
  maintainers = { "@Prince781" },
}

list.vento = {
  install_info = {
    url = parsers_repo,
    files = { "vento/parser.c", "vento/scanner.c" },
  },
  filetype = "vto",
  maintainers = { "@wrapperup", "@oscarotero" },
}

list.verilog = {
  install_info = {
    url = parsers_repo,
    files = { "verilog/parser.c" },
  },
  maintainers = { "@zhangwwpeng" },
}

list.vhdl = {
  install_info = {
    url = parsers_repo,
    files = { "vhdl/parser.c", "vhdl/scanner.c" },
  },
  maintainers = { "@jpt13653903" },
}

list.vhs = {
  install_info = {
    url = parsers_repo,
    files = { "vhs/parser.c" },
  },
  filetype = "tape",
  maintainers = { "@caarlos0" },
}

list.vim = {
  install_info = {
    url = parsers_repo,
    files = { "vim/parser.c", "vim/scanner.c" },
  },
  maintainers = { "@clason" },
}

list.vimdoc = {
  install_info = {
    url = parsers_repo,
    files = { "vimdoc/parser.c" },
  },
  filetype = "help",
  maintainers = { "@clason" },
}

list.vrl = {
  install_info = {
    url = parsers_repo,
    files = { "vrl/parser.c" },
  },
  maintainers = { "@belltoy" },
}

list.vue = {
  install_info = {
    url = parsers_repo,
    files = { "vue/parser.c", "vue/scanner.c" },
    branch = "main",
  },
  maintainers = { "@WhyNotHugo", "@lucario387" },
}

list.wgsl = {
  install_info = {
    url = parsers_repo,
    files = { "wgsl/parser.c", "wgsl/scanner.c" },
  },
  maintainers = { "@szebniok" },
}

list.wgsl_bevy = {
  install_info = {
    url = parsers_repo,
    files = { "wgsl_bevy/parser.c", "wgsl_bevy/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.wing = {
  install_info = {
    url = parsers_repo,
    files = { "wing/parser.c", "wing/scanner.c" },
  },
  maintainers = { "@gshpychka", "@MarkMcCulloh" },
}

list.wit = {
  install_info = {
    url = parsers_repo,
    files = { "wit/parser.c" },
  },
  maintainers = { "@liamwh" },
}

list.xcompose = {
  install_info = {
    url = parsers_repo,
    files = { "xcompose/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.xml = {
  install_info = {
    url = parsers_repo,
    files = { "xml/parser.c", "xml/scanner.c" },
    location = "xml",
  },
  maintainers = { "@ObserverOfTime" },
}

list.xresources = {
  install_info = {
    url = parsers_repo,
    files = { "xresources/parser.c" },
  },
  filetype = "xdefaults",
  maintainers = { "@ValdezFOmar" },
}

list.yaml = {
  install_info = {
    url = parsers_repo,
    files = { "yaml/parser.c", "yaml/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.yang = {
  install_info = {
    url = parsers_repo,
    files = { "yang/parser.c" },
  },
  maintainers = { "@Hubro" },
}

list.yuck = {
  install_info = {
    url = parsers_repo,
    files = { "yuck/parser.c", "yuck/scanner.c" },
  },
  maintainers = { "@Philipp-M", "@amaanq" },
}

list.zathurarc = {
  install_info = {
    url = parsers_repo,
    files = { "zathurarc/parser.c" },
  },
  maintainers = { "@Freed-Wu" },
}

list.zig = {
  install_info = {
    url = parsers_repo,
    files = { "zig/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.ziggy = {
  install_info = {
    url = parsers_repo,
    files = { "ziggy/parser.c" },
  },
  maintainers = { "@rockorager" },
}

list.ziggy_schema = {
  install_info = {
    url = parsers_repo,
    files = { "ziggy_schema/parser.c" },
  },
  maintainers = { "@rockorager" },
}

list.templ = {
  install_info = {
    url = parsers_repo,
    files = { "templ/parser.c", "templ/scanner.c" },
  },
  maintainers = { "@vrischmann" },
}

local M = {
  list = list,
}

function M.ft_to_lang(ft)
  local result = ts.language.get_lang(ft)
  if result then
    return result
  else
    ft = vim.split(ft, ".", { plain = true })[1]
    return ts.language.get_lang(ft) or ft
  end
end

-- Get a list of all available parsers
---@return string[]
function M.available_parsers()
  local parsers = vim.tbl_keys(M.list)
  table.sort(parsers)
  if vim.fn.executable "tree-sitter" == 1 and vim.fn.executable "node" == 1 then
    return parsers
  else
    return vim.tbl_filter(function(p) ---@param p string
      return not M.list[p].install_info.requires_generate_from_grammar
    end, parsers)
  end
end

function M.get_parser_configs()
  return M.list
end

local parser_files

function M.reset_cache()
  parser_files = setmetatable({}, {
    __index = function(tbl, key)
      rawset(tbl, key, api.nvim_get_runtime_file("parser/" .. key .. ".*", false))
      return rawget(tbl, key)
    end,
  })
end

M.reset_cache()

function M.has_parser(lang)
  lang = lang or M.get_buf_lang(api.nvim_get_current_buf())

  if not lang or #lang == 0 then
    return false
  end
  -- HACK: nvim internal API
  if vim._ts_has_language(lang) then
    return true
  end
  return #parser_files[lang] > 0
end

function M.get_parser(bufnr, lang)
  bufnr = bufnr or api.nvim_get_current_buf()
  lang = lang or M.get_buf_lang(bufnr)

  if M.has_parser(lang) then
    return ts.get_parser(bufnr, lang)
  end
end

-- @deprecated This is only kept for legacy purposes.
--             All root nodes should be accounted for.
function M.get_tree_root(bufnr)
  bufnr = bufnr or api.nvim_get_current_buf()
  return M.get_parser(bufnr):parse()[1]:root()
end

-- Gets the language of a given buffer
---@param bufnr number? or current buffer
---@return string
function M.get_buf_lang(bufnr)
  bufnr = bufnr or api.nvim_get_current_buf()
  return M.ft_to_lang(api.nvim_buf_get_option(bufnr, "ft"))
end

return M
