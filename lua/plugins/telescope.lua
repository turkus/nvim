local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

local function telescope_grep_visual()
	local text = getVisualSelection()
	builtin.live_grep({ default_text = text })
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
