local settings = require 'core.settings'

if settings.theme == 'onedark' then
  return {
    'navarasu/onedark.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  }
else
  print("Invalid theme option")
  os.exit()
end
