-- null-ls plugin is disabled
return {}

-- return {
--   "jose-elias-alvarez/null-ls.nvim",
--   dependencies = { "nvim-lua/plenary.nvim" },
--   config = function()
--     local null_ls = require("null-ls")
--     null_ls.setup({
--       sources = {
--         null_ls.builtins.diagnostics.eslint_d.with({
--           filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
--         }),
--         null_ls.builtins.formatting.eslint_d.with({
--           filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
--         }),
--       },
--     })
--   end,
-- }
