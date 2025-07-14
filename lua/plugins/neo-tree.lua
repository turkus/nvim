return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        window = {
          mappings = {
            ["/"] = "noop",
          },
        },
      },
      buffers = {
        follow_current_file = { enabled = true },
      },
      close_if_last_window = false,
    })

    vim.keymap.set("n", "<leader>e", function()
      require("neo-tree.command").execute({ action = "show", source = "filesystem", reveal = true })
    end, { desc = "Reveal file in Neo-tree" })
  end,
}
