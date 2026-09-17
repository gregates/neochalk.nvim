local c = require("neochalk.palette")

local b = { fg = c.fg, bg = c.grey2 }
local section_c = { fg = c.grey6, bg = c.grey1 }

local function mode(bg)
  return { a = { fg = c.bg, bg = bg, gui = "bold" }, b = b, c = section_c }
end

return {
  normal = mode(c.status),
  insert = mode(c.green),
  visual = mode(c.gold),
  replace = mode(c.orange),
  command = mode(c.cyan),
  terminal = mode(c.lime),
  inactive = {
    a = { fg = c.grey5, bg = c.grey1 },
    b = { fg = c.grey5, bg = c.grey1 },
    c = { fg = c.grey5, bg = c.grey1 },
  },
}
