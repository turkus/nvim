return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true,
        },
        window = {
          mappings = {
            ["/"] = "noop",
          },
        },
      },
      buffers = { follow_current_file = { enabled = true } },
    })
  end,
}
