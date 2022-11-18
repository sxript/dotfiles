local Remap = require("sxript.keymaps")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = function()
            nnoremap("gd", vim.lsp.buf.definition, { desc = "Go to definition [LSP]", buffer = bufnr })
            nnoremap("gt", vim.lsp.buf.type_definition, { desc = "Go to type definition [LSP]", buffer = bufnr })
            nnoremap("gD", vim.lsp.buf.declaration, { desc = "Go to declaration [LSP]", buffer = bufnr })
            nnoremap("gi", vim.lsp.buf.implementation, { desc = "Go to implementation [LSP]", buffer = bufnr })
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
        filter = function(code_action)
            if not code_action or not code_action.data then
                return false
            end

            local data = code_action.data.id
            return string.sub(data, #data - 1, #data) == ":0"
        end,
        apply = true
    }) end)
			nnoremap("<leader>rr", function() vim.lsp.buf.references() end)
			nnoremap("<leader>rn", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
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
