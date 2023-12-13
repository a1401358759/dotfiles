local wezterm = require("wezterm")
local platform = require("utils.platform")

local font = {
	family = "JetBrainsMono Nerd Font",
	weight = "Medium",
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
}
-- local font_size = platform().is_mac and 12 or 9
local font_size = 12

return {
	font = wezterm.font(font),
	font_size = font_size,
}
