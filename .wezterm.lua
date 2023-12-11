-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
	top = "15px",
	right = "5px",
	bottom = "5px",
	left = "5px",
}
config.color_scheme = "GruvboxDark"
config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "DemiBold",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 12
config.line_height = 1.2
config.enable_wayland = false
config.front_end = "OpenGL"
config.use_fancy_tab_bar = true
config.enable_tab_bar = true
config.show_tabs_in_tab_bar = true
config.check_for_updates = false
config.hide_tab_bar_if_only_one_tab = false
config.window_background_opacity = 0.8
config.adjust_window_size_when_changing_font_size = false -- If you use a tiling window manager then you may wish to set this to false
config.automatically_reload_config = true
config.tab_bar_at_bottom = false
config.tab_max_width = 20
config.term = "xterm-256color"
config.set_environment_variables = {}
config.tiling_desktop_environments = {
	"X11 LG3D",
	"X11 bspwm",
	"X11 i3",
	"X11 dwm",
	"Wayland hyprland",
}
config.mouse_bindings = {
	-- 右键粘贴
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
	-- Change the default click behavior so that it only selects
	-- text and doesn't open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action({ CompleteSelection = "PrimarySelection" }),
	},
	-- and make CTRL-Click open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = "OpenLinkAtMouseCursor",
	},
}

for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
	if gpu.backend == "Vulkan" and gpu.device_type == "IntegratedGpu" then
		config.webgpu_preferred_adapter = gpu
		config.front_end = "WebGpu"
		break
	end
end

local act = wezterm.action
config.keys = {
	{
		key = "R",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{ key = "1", mods = "CTRL", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "CTRL", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "CTRL", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "CTRL", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "CTRL", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "CTRL", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "CTRL", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "CTRL", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "CTRL", action = wezterm.action({ ActivateTab = 8 }) },
	{ key = "LeftArrow", mods = "CTRL", action = wezterm.action({ MoveTabRelative = -1 }) },
	{ key = "RightArrow", mods = "CTRL", action = wezterm.action({ MoveTabRelative = 1 }) },
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "h", mods = "SHIFT|CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "SHIFT|CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "SHIFT|CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "SHIFT|CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "v", mods = "SHIFT|CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "c", mods = "SHIFT|CTRL", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "q", mods = "SHIFT|CTRL", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "x", mods = "SHIFT|CTRL", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "-", mods = "CTRL", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "\\", mods = "CTRL", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },
}

local launch_menu = {}
config.launch_menu = launch_menu
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.front_end = "Software" -- OpenGL doesn't work quite well with RDP.
	config.term = "" -- Set to empty so FZF works on windows
	config.default_prog = { "cmd.exe" }
	table.insert(config.launch_menu, { label = "PowerShell", args = { "powershell.exe", "-NoLogo" } })
	table.insert(config.launch_menu, {
		label = "Bash",
		args = { "bash.exe" },
	})
	table.insert(config.launch_menu, {
		label = "CMD",
		args = { "cmd.exe" },
	})
	-- Find installed visual studio version(s) and add their compilation
	-- environment command prompts to the menu
	for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
		local year = vsvers:gsub("Microsoft Visual Studio/", "")
		table.insert(config.launch_menu, {
			label = "x64 Native Tools VS " .. year,
			args = {
				"cmd.exe",
				"/k",
				"C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat",
			},
		})
	end
else
	table.insert(config.launch_menu, { label = "bash", args = { "bash", "-l" } })
	table.insert(config.launch_menu, { label = "zsh", args = { "zsh", "-l" } })
	table.insert(config.launch_menu, { label = "fish", args = { "fish", "-l" } })
end

local ssh_cmd = { "ssh" }
local ssh_config_file = wezterm.home_dir .. "/.ssh/config"
local f = io.open(ssh_config_file)
if f then
	local line = f:read("*l")
	while line do
		if line:find("Host ") == 1 then
			local host = line:gsub("Host ", "")
			local args = {}
			for i, v in pairs(ssh_cmd) do
				args[i] = v
			end
			args[#args + 1] = host
			table.insert(launch_menu, {
				label = "SSH " .. host,
				args = args,
			})
			-- default open vm
			if host == "vm" then
				config.default_prog = { "powershell.exe", "ssh", "vm" }
			end
		end
		line = f:read("*l")
	end
	f:close()
end

wezterm.on("gui-startup", function()
	local _, _, window = wezterm.mux.spawn_window({})
	window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
