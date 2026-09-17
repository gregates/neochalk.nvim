-- Colors are taken from tpope's vividchalk.vim unless noted otherwise.
return {
  bg = "#000000",
  fg = "#EEEEEE",
  white = "#FFFFFF",

  -- syntax
  purple = "#9933CC", -- Comment
  teal = "#339999", -- Constant
  green = "#66FF00", -- String
  gold = "#FFCC00", -- Identifier
  orange = "#FF6600", -- Statement
  cyan = "#AAFFFF", -- PreProc
  khaki = "#AAAA77", -- Type
  moss = "#33AA00", -- Special
  sky = "#44B4CC", -- Regexp
  lime = "#DDE93D", -- rubyMethod; only used for UI accents here
  periwinkle = "#AACCFF", -- railsUserMethod, from vividchalk 1.x
  magenta = "#FF00FF", -- Title
  yellow = "#FFFF00", -- WildMenu
  red = "#FF3333", -- not in the original, which used plain Red

  -- greys
  grey1 = "#222222", -- gutter
  grey2 = "#333333", -- CursorLine, ColorColumn
  grey3 = "#404040", -- NonText
  grey4 = "#555555", -- Search
  grey5 = "#808080",
  grey6 = "#BBBBBB",

  -- the original's UI is all blues and indigos
  visual = "#555577",
  indigo = "#110077", -- Folded bg
  paren = "#1100AA", -- MatchParen bg
  menu = "#000099", -- Pmenu bg
  menu_sel = "#5555FF", -- PmenuSel bg
  fold_fg = "#AADDEE",
  line_nr = "#DDEEFF",
  status = "#AABBEE", -- StatusLine bg
  float = "#0B0B22", -- not in the original

  -- diff backgrounds; the original used vim's stock DarkBlue/DarkMagenta/DarkCyan
  diff_add = "#0F3300",
  diff_delete = "#400A0A",
  diff_change = "#16163A",
  diff_text = "#33337A",
}
