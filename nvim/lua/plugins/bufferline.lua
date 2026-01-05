return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    -- 1. Read Matugen colors (Reuse logic from Lualine)
    local colors_file = vim.fn.expand("~/.cache/matugen/colors.json")
    local colors = {
      primary = "#88aaee",
      background = "#1a1a1a",
      surface = "#2a2a2a",
      surface_variant = "#3a3a3a",
      foreground = "#ffffff",
    }

    if vim.fn.filereadable(colors_file) == 1 then
      local success, content = pcall(vim.fn.readfile, colors_file)
      if success then
        local ok, decoded = pcall(vim.json.decode, table.concat(content, ""))
        if ok then colors = decoded end
      end
    end

    -- 2. Setup Bufferline with Matugen Highlights
    require("bufferline").setup({
      options = {
        mode = "buffers",
	always_show_bufferline = false, -- Only show when more than one buffer is open
        auto_toggle_bufferline = true,  -- Automatically hide/show the bar
        separator_style = "thin",
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", text_align = "left", separator = true }
        },
      },
      highlights = {
        fill = {
          bg = colors.background, -- Background of the bar
        },
        background = {
          fg = colors.foreground,
          bg = colors.surface, -- Background of inactive tabs
        },
        buffer_selected = {
          fg = colors.primary,
          bg = colors.background, -- Background of the active tab
          bold = true,
          italic = false,
        },
        separator = {
          fg = colors.surface_variant,
          bg = colors.surface,
        },
        separator_selected = {
          fg = colors.surface_variant,
          bg = colors.background,
        },
        indicator_selected = {
          fg = colors.primary,
          bg = colors.background,
        },
      },
    })
  end,
}

