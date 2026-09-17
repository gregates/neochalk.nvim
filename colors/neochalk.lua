-- Drop cached modules so `:colorscheme neochalk` picks up edits while tweaking.
for name in pairs(package.loaded) do
  if name == "neochalk" or name:match("^neochalk%.") or name == "lualine.themes.neochalk" then
    package.loaded[name] = nil
  end
end

require("neochalk").load()
