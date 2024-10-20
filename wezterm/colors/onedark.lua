local M = {}

-- onedark colors from https://github.com/LalitMaganti/base16-onedark-scheme
local colors_base16 = {
  base00 = "#282c34",
  base01 = "#353b45",
  base02 = "#3e4451",
  base03 = "#545862",
  base04 = "#565c64",
  base05 = "#abb2bf",
  base06 = "#b6bdca",
  base07 = "#c8ccd4",
  base08 = "#e06c75",
  base09 = "#d19a66",
  base0A = "#e5c07b",
  base0B = "#98c379",
  base0C = "#56b6c2",
  base0D = "#61afef",
  base0E = "#c678dd",
  base0F = "#be5046",
}

local colors = {
  blue = "#74ADE9",
  base = colors_base16.base00,
}

-- M.scheme = {
--   foreground = colors.text,
--   background = colors.base,
--   cursor_bg = colors.rosewater,
--   cursor_border = colors.rosewater,
--   cursor_fg = colors.crust,
--   selection_bg = colors.surface2,
--   selection_fg = colors.text,
--   ansi = {
--     colors.surface1,
--     colors.red,
--     colors.green,
--     colors.yellow,
--     colors.blue,
--     colors.pink,
--     colors.teal,
--     colors.subtext1,
--   },
--   brights = {
--     colors.surface2,
--     colors.red,
--     colors.green,
--     colors.yellow,
--     colors.blue,
--     colors.pink,
--     colors.teal,
--     colors.subtext0,
--   },
--   tab_bar = {
--     background = colors.crust,
--     active_tab = {
--       bg_color = "none",
--       fg_color = colors.subtext1,
--       intensity = "Bold",
--     },
--     inactive_tab = {
--       bg_color = colors.crust,
--       fg_color = colors.surface2,
--     },
--     inactive_tab_hover = {
--       bg_color = colors.mantle,
--       fg_color = colors.subtext0,
--     },
--     new_tab = {
--       bg_color = colors.mantle,
--       fg_color = colors.subtext0,
--     },
--     new_tab_hover = {
--       bg_color = colors.crust,
--       fg_color = colors.subtext0,
--     },
--   },
--   visual_bell = colors.surface0,
--   indexed = {
--     [16] = colors.peach,
--     [17] = colors.rosewater,
--   },
--   scrollbar_thumb = colors.surface2,
--   split = colors.overlay0,
--   -- nightbuild only
--   compose_cursor = colors.flamingo,
-- }

M.colors = colors

return M
