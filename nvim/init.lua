-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- https://github.com/nvarner/typst-lsp?tab=readme-ov-file
require'lspconfig'.typst_lsp.setup{
	settings = {
		exportPdf = "onType" -- Choose onType, onSave or never.
        -- serverPath = "" -- Normally, there is no need to uncomment it.
	}
}


