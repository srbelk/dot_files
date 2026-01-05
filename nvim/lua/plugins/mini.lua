return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- ==========================================
    -- 1. SETUP MINI.BASE16 (Matugen Theme)
    -- ==========================================
    local colors_file = vim.fn.expand("~/.cache/matugen/colors.json")
    
    local palette = {
      base00 = "#1a1a1a", base01 = "#2a2a2a", base02 = "#3a3a3a", base03 = "#4a4a4a",
      base04 = "#5a5a5a", base05 = "#ffffff", base06 = "#eeeeee", base07 = "#dddddd",
      base08 = "#ff5555", base09 = "#ffaa00", base0A = "#ffff00", base0B = "#00ff00",
      base0C = "#00ffff", base0D = "#0000ff", base0E = "#aa00ff", base0F = "#ff00ff",
    }

    if vim.fn.filereadable(colors_file) == 1 then
      local success, content = pcall(vim.fn.readfile, colors_file)
      if success then
        local ok, decoded = pcall(vim.json.decode, table.concat(content, ""))
        if ok then
          for i = 0, 15 do
            local key = string.format("base0%X", i)
            if decoded[key] then palette[key] = decoded[key] end
          end
        end
      end
    end

    require('mini.base16').setup({
      palette = palette,
    })

    -- Force Transparency
    local hl = vim.api.nvim_set_hl
    hl(0, "Normal", { bg = "none" })
    hl(0, "NormalFloat", { bg = "none" })
    hl(0, "FloatBorder", { bg = "none" })
    hl(0, "LineNr", { fg = palette.base03, bg = "none" })

    -- ==========================================
    -- 2. SETUP MINI.PAIRS (Auto-pairs)
    -- ==========================================
    require('mini.pairs').setup({
      -- Add your custom mini.pairs options here if you have any
      -- e.g., mappings = { ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' } }
    })
    
  end
}

