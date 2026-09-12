-- load snippets from path/of/your/nvim/config/snippets/adrien
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/adrien" } })
