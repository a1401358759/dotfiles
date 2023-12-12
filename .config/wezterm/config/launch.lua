local platform = require("utils.platform")()

local options = {
	default_prog = {},
	launch_menu = {},
}

if platform.is_win then
	options.default_prog = { "pwsh" }
	options.launch_menu = {
		{ label = "PowerShell Core", args = { "pwsh" } },
		{ label = "PowerShell Desktop", args = { "powershell" } },
		{ label = "Command Prompt", args = { "cmd" } },
		{ label = "Nushell", args = { "nu" } },
		{
			label = "Git Bash",
			args = { "C:\\Users\\kevin\\scoop\\apps\\git\\current\\bin\\bash.exe" },
		},
	}
else
	options.default_prog = { "/usr/bin/fish" }
	options.launch_menu = {
		{ label = "Bash", args = { "bash" } },
		{ label = "Fish", args = { "/usr/bin/fish" } },
		{ label = "Zsh", args = { "zsh" } },
	}
end

local ssh_cmd = { "ssh" }
local ssh_config_file = "~/.ssh/config"
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
			table.insert(options.launch_menu, {
				label = "SSH " .. host,
				args = args,
			})
			-- default open vm
			if host == "vm" then
				options.default_prog = { "powershell.exe", "ssh", "vm" }
			end
		end
		line = f:read("*l")
	end
	f:close()
end

return options
