local actions = require("telescope.actions")
return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-w>"] = actions.select_horizontal,
          },
          n = {
            ["<C-w>"] = actions.select_horizontal,
          },
        },
      },
    })
  end,
}
