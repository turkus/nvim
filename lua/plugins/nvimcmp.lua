return  {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    luasnip.filetype_extend("javascript", { "javascriptreact" })
    luasnip.filetype_extend("typescript", { "typescriptreact" })

    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      performance = {
        max_view_entries = 20,
        debounce = 150,
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "crates" },
        -- https://github.com/hrsh7th/cmp-buffer
        {
          name = "buffer",
          keyword_length = 4,
          max_item_count = 10,
          option = {
            get_bufnrs = function()
              local buf = vim.api.nvim_get_current_buf()
              local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
              if byte_size > 1024 * 1024 then -- 1 Megabyte max
                return {}
              end
              return { buf }
            end,
            indexing_interval = 1000,
          },
        },
      }),
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      experimental = {
        ghost_text = true,
      },
    }
  end,
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  event = "InsertEnter",
  cmd = "CmpStatus",
} 
