require("mason").setup()
require("mason-lspconfig").setup()

local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = function()
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition [LSP]", buffer = bufnr })
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition [LSP]", buffer = bufnr })
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration [LSP]", buffer = bufnr })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation [LSP]", buffer = bufnr })
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
			vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
			vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
			vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
			vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
			vim.keymap.set("n", "<leader>vco", function() vim.lsp.buf.code_action({
        filter = function(code_action)
            if not code_action or not code_action.data then
                return false
            end

            local data = code_action.data.id
            return string.sub(data, #data - 1, #data) == ":0"
        end,
        apply = true
    }) end)
			vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end)
			vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
			vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

require'lspconfig'.clangd.setup(config())

require'lspconfig'.tsserver.setup(config())

require'lspconfig'.eslint.setup(config())

require'lspconfig'.lua_ls.setup(config({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}))

