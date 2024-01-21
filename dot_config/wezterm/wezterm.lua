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
config.font_size = 18

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox dark, soft (base16)"
-- config.color_scheme = "Gruvbox light, soft (base16)"

-- disable tab bar
config.enable_tab_bar = false

config.keys = {
	{
		key = "f",
		mods = "CTRL|CMD",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- and finally, return the configuration to wezterm
return config
