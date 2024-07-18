-- In lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    -- See `:help cmp`
    local cmp = require("cmp")

    cmp.setup({
      completion = { completeopt = "menu,menuone,noinsert" },

      window = {
        completion = cmp.config.window.bordered(),
      },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert({
        -- Select the [n]ext item
        -- ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        --["<C-p>"] = cmp.mapping.select_prev_item(),

        -- Scroll the documentation window [b]ack / [f]orward
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        -- ["<C-y>"] = cmp.mapping.confirm({ select = true }),

        -- If you prefer more traditional completion keymaps,
        -- you can uncomment the following lines
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<Down>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ["<Up>"] = cmp.mapping.select_prev_item(),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ["<C-Space>"] = cmp.mapping.complete({}),

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "copilot" },
      },
    })
  end,
}
