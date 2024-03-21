local lspconfig = require'lspconfig'
local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers 
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'rust_analyzer',
		'lua_ls',
	},
	handlers = {
		lsp.default_setup,
	},
})

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}, -- This line adds 'vim' to the globals
      },
    },
  },
}
