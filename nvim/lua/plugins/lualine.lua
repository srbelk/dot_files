return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- 1. Locate and read the Matugen JSON
    local colors_file = vim.fn.expand("~/.cache/matugen/colors.json")
    local colors = {
      primary = "#88aaee",
      background = "#1a1a1a",
      surface = "#2a2a2a",
      foreground = "#ffffff",
      error = "#ff5555"
    }

    if vim.fn.filereadable(colors_file) == 1 then
      local success, content = pcall(vim.fn.readfile, colors_file)
      if success then
        local ok, decoded = pcall(vim.json.decode, table.concat(content, ""))
        if ok then colors = decoded end
      end
    end

    -- 2. Define the Matugen theme
    local matugen_theme = {
      normal = {
        a = { fg = colors.background, bg = colors.primary, gui = 'bold' },
        b = { fg = colors.primary, bg = colors.surface },
        c = { fg = colors.foreground, bg = colors.background },
      },
      insert = {
        a = { fg = colors.background, bg = colors.secondary or colors.primary, gui = 'bold' },
        b = { fg = colors.foreground, bg = colors.surface },
      },
      visual = {
        a = { fg = colors.background, bg = colors.foreground, gui = 'bold' },
      },
      replace = {
        a = { fg = colors.background, bg = colors.error, gui = 'bold' },
      },
      inactive = {
        a = { fg = colors.foreground, bg = colors.background },
        b = { fg = colors.foreground, bg = colors.background },
        c = { fg = colors.foreground, bg = colors.background },
      },
    }

    -- 3. Run Setup
    require('lualine').setup({
      options = {
        theme = matugen_theme,
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
        },
        component_separators = '|',
        section_separators = '',
      },
    })
  end
}

    

