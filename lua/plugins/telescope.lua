local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- Function to search the visual selection
local function telescope_grep_visual()
  -- Get the visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])

  -- Extract the selected text
  lines[1] = string.sub(lines[1], start_pos[3], -1)
  lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
  local search_text = table.concat(lines, "\n")

  -- Call Telescope with the selected text
  builtin.grep_string({ search = search_text })
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope find string' })
vim.keymap.set('v', '<leader>fw', telescope_grep_visual, { desc = 'Search visual selection' })

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sharkdp/fd",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<C-w>"] = actions.select_horizontal,
          },
          n = {
            ["<C-w>"] = actions.select_horizontal,
          },
        },
      }
    })
  end
}
