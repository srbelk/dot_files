return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require("cmp")
    
    -- 1. ADVERTISE capabilities to LSPs (Crucial for Neovim 0.11+)
    -- This tells the LSP that cmp-nvim-lsp will handle the completion UI
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    
    -- 2. APPLY these capabilities globally to the new native LSP config
    -- This replaces the old loop that called .setup{} for every server
    vim.lsp.config("*", { capabilities = capabilities })

    -- 3. Standard cmp setup
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- Core LSP completion
        { name = "path" },     -- File system paths
      }, {
        { name = "buffer" },   -- Text from current buffer
      }),
    })
  end,
}

