local catppuccin_palette = {
	rosewater = "#f4dbd6",
	flamingo = "#f0c6c6",
	pink = "#f5bde6",
	mauve = "#c6a0f6",
	red = "#ed8796",
	maroon = "#ee99a0",
	peach = "#f5a97f",
	yellow = "#eed49f",
	green = "#a6da95",
	teal = "#8bd5ca",
	sky = "#91d7e3",
	sapphire = "#7dc4e4",
	blue = "#8aadf4",
	lavender = "#b7bdf8",
	text = "#cad3f5",
	subtext1 = "#b8c0e0",
	subtext0 = "#a5adcb",
	overlay2 = "#939ab7",
	overlay1 = "#8087a2",
	overlay0 = "#6e738d",
	surface2 = "#5b6078",
	surface1 = "#494d64",
	surface0 = "#363a4f",
	base = "#24273a",
	mantle = "#1e2030",
	crust = "#181926",
}

local tokyonight_palette = {
	rosewater = "#f7768e", -- (Catppuccin red)
	flamingo = "#f7768e", -- (Catppuccin red)
	pink = "#f5bde6", -- (Catppuccin pink)
	mauve = "#bb9af7", -- (Catppuccin mauve)
	red = "#f7768e", -- (Catppuccin red)
	maroon = "#e0af68", -- (Catppuccin maroon)
	peach = "#f5a97f", -- (Catppuccin peach)
	yellow = "#e0af68", -- (Catppuccin yellow)
	green = "#9ece6a", -- (Catppuccin green)
	teal = "#8bd5ca", -- (Catppuccin teal)
	sky = "#91d7e3", -- (Catppuccin sky)
	sapphire = "#7aa2f7", -- (Catppuccin sapphire)
	blue = "#7aa2f7", -- (Catppuccin blue)
	lavender = "#b7bdf8", -- (Catppuccin lavender)
	text = "#a9b1d6", -- (Catppuccin text)
	subtext1 = "#c6d0f5", -- (Catppuccin subtext1)
	subtext0 = "#a5adcb", -- (Catppuccin subtext0)
	overlay2 = "#939ab7", -- (Catppuccin overlay2)
	overlay1 = "#8087a2", -- (Catppuccin overlay1)
	overlay0 = "#6e738d", -- (Catppuccin overlay0)
	surface2 = "#494d64", -- (Catppuccin surface2)
	surface1 = "#363a4f", -- (Catppuccin surface1)
	surface0 = "#282C34", -- (Catppuccin surface0)
	base = "#1f2335", -- (Catppuccin base)
	mantle = "#16161D", -- (Catppuccin mantle)
	crust = "#11111B", -- (Catppuccin crust)
}
-- Plugins
require("full-border"):setup({
	-- type = ui.Border.ROUNDED,
})

require("zoxide"):setup({
	update_db = true,
})

require("session"):setup({
	sync_yanked = true,
})

require("searchjump"):setup({
	unmatch_fg = tokyonight_palette.overlay0,
	match_str_fg = tokyonight_palette.peach,
	match_str_bg = tokyonight_palette.base,
	first_match_str_fg = tokyonight_palette.lavender,
	first_match_str_bg = tokyonight_palette.base,
	lable_fg = tokyonight_palette.green,
	lable_bg = tokyonight_palette.base,
	only_current = false, -- only search the current window
	show_search_in_statusbar = false,
	auto_exit_when_unmatch = false,
	enable_capital_lable = false,
	search_patterns = {}, -- demo:{"%.e%d+","s%d+e%d+"}
})

require("yatline"):setup({
	section_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },

	style_a = {
		fg = tokyonight_palette.mantle,
		bg_mode = {
			normal = tokyonight_palette.blue,
			select = tokyonight_palette.mauve,
			un_set = tokyonight_palette.red,
		},
	},
	style_b = { bg = tokyonight_palette.surface0, fg = tokyonight_palette.text },
	style_c = { bg = tokyonight_palette.base, fg = tokyonight_palette.text },

	permissions_t_fg = tokyonight_palette.green,
	permissions_r_fg = tokyonight_palette.yellow,
	permissions_w_fg = tokyonight_palette.red,
	permissions_x_fg = tokyonight_palette.sky,
	permissions_s_fg = tokyonight_palette.lavender,

	selected = { icon = "󰻭", fg = tokyonight_palette.yellow },
	copied = { icon = "", fg = tokyonight_palette.green },
	cut = { icon = "", fg = tokyonight_palette.red },

	total = { icon = "", fg = tokyonight_palette.yellow },
	succ = { icon = "", fg = tokyonight_palette.green },
	fail = { icon = "", fg = tokyonight_palette.red },
	found = { icon = "", fg = tokyonight_palette.blue },
	processed = { icon = "", fg = tokyonight_palette.green },

	tab_width = 20,
	tab_use_inverse = true,

	show_background = false,

	display_header_line = true,
	display_status_line = true,

	header_line = {
		left = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {
				{ type = "coloreds", custom = false, name = "githead" },
			},
			section_c = {},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "tab_path" },
			},
			section_b = {
				{ type = "coloreds", custom = false, name = "task_workload" },
			},
			section_c = {
				{ type = "coloreds", custom = false, name = "task_states" },
			},
		},
	},

	status_line = {
		left = {
			section_a = {
				{ type = "string", custom = false, name = "tab_mode" },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_size" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_name" },
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "cursor_position" },
			},
			section_b = {
				{ type = "string", custom = false, name = "cursor_percentage" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_file_extension", params = { true } },
				{ type = "coloreds", custom = false, name = "permissions" },
			},
		},
	},
})

require("yatline-githead"):setup({
	show_branch = true,
	branch_prefix = "",
	branch_symbol = "",
	branch_borders = "",

	commit_symbol = " ",

	show_behind_ahead = true,
	behind_symbol = " ",
	ahead_symbol = " ",

	show_stashes = true,
	stashes_symbol = " ",

	show_state = true,
	show_state_prefix = true,
	state_symbol = "󱅉",

	show_staged = true,
	staged_symbol = " ",

	show_unstaged = true,
	unstaged_symbol = " ",

	show_untracked = true,
	untracked_symbol = " ",

	prefix_color = tokyonight_palette.pink,
	branch_color = tokyonight_palette.pink,
	commit_color = tokyonight_palette.mauve,
	stashes_color = tokyonight_palette.teal,
	state_color = tokyonight_palette.lavender,
	staged_color = tokyonight_palette.green,
	unstaged_color = tokyonight_palette.yellow,
	untracked_color = tokyonight_palette.pink,
	ahead_color = tokyonight_palette.green,
	behind_color = tokyonight_palette.yellow,
})

require("git"):setup()
