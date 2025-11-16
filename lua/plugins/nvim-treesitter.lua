return {
  "nvim-treesitter/nvim-treesitter",
  -- Override LazyVim's build function to skip CLI installation
  build = ":TSUpdate",
  -- Use function to completely override ensure_installed
  opts = function()
    return {
      -- Empty to prevent any parser installation
      ensure_installed = {},
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental = "<C-h>",
        },
      },
    }
  end,
}
