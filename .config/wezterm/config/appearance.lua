local wezterm = require("wezterm")
local colors = require("colors.custom")
local my_gruvbox = wezterm.color.get_builtin_schemes()["GruvboxDark"]

-- transparent tab_bar
my_gruvbox.tab_bar = {
	background = "rgba(0,0,0,0)",
}

return {
	animation_fps = 60,
	max_fps = 60,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	line_height = 1.2,
	enable_wayland = false,
	adjust_window_size_when_changing_font_size = false, -- If you use a tiling window manager then you may wish to set this to false
	tab_bar_at_bottom = true,
	term = "xterm-256color",
	window_background_opacity = 0.8,
	color_schemes = {
		-- Override the builtin GruvboxDark scheme with our modification.
		["GruvboxDark"] = my_gruvbox,
		-- We can also give it a different name if we don't want to override the default
		["GruvboxCustom"] = my_gruvbox,
	},

	-- set color scheme
	-- colors = colors,
	color_scheme = "GruvboxCustom",

	-- set background
	background = {
		-- {
		--  source = { File = wezterm.config_dir .. "/backdrops/astro-jelly.jpg" },
		-- },
		{
			source = { Color = colors.background },
			height = "100%",
			width = "100%",
			opacity = 0.90,
		},
	},

	-- scrollbar
	enable_scroll_bar = false,

	-- tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	use_fancy_tab_bar = false,
	tab_max_width = 25,
	show_tab_index_in_tab_bar = false,
	switch_to_last_active_tab_when_closing_tab = true,
	show_new_tab_button_in_tab_bar = false,

	-- window
	window_padding = {
		left = 5,
		right = 5,
		top = 12,
		bottom = 0,
	},
	window_close_confirmation = "NeverPrompt",
	window_frame = {
		active_titlebar_bg = "#090909",
		-- font = fonts.font,
		-- font_size = fonts.font_size,
	},
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}
