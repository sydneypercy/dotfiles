local bg_col = "#1e1e2e"
local toggle_bg_picture = false

local primary_col = "#cba6f7"
local secondary_col = "#89dceb"

local ninbot_anchor = "right" -- topleft, top, topright, left, right, bottomleft, bottomright
local ninbot_opacity = 0.8 -- 0 to 1

local res_1440 = false

local e_count = { enabled = true, x = 1340, y = 300, size = 5, colorkey = true }
local thin_pie = { enabled = true, x = 1250, y = 500, size = 4, colorkey = true }
local thin_percent = { enabled = true, x = 1300, y = 850, size = 6 }
local tall_pie = { enabled = true, x = 1250, y = 500, size = 4, colorkey = true } -- Leave same as thin for seamlessness
local tall_percent = { enabled = true, x = 1300, y = 850, size = 6 } -- Leave same as thin for seamlessness

local thin_key = "*-T"
local wide_key = "Ctrl-B"
local tall_key = "Ctrl-MMB"
local show_ninbot_key = "Ctrl-H"
local open_ninbot_key = "Ctrl-Shift-N"
local atum_reset_key = "Ctrl-Shift-D"
local reset_wall_key = "Ctrl-R"

-- DON'T CHANGE ANYTHING AFTER THIS UNLESS YOU KNOW WHAT YOU"RE DOING

local waywall_config_path = os.getenv("HOME") .. "/.config/waywall/"
local bg_path = waywall_config_path .. "resources/background.png"

local nb_path = waywall_config_path .. "resources/Ninjabrain-Bot-1.5.1.jar"
local overlay_path = waywall_config_path .. "resources/boatoverlay.png"

local waywall = require("waywall")
local helpers = require("waywall.helpers")

local config = {
	input = {
		layout = "us",
		repeat_rate = 40,
		repeat_delay = 300,
		sensitivity = 4.633257950030503,
		confine_pointer = false,
	},
	theme = {
		background = bg_col,
		background_png = toggle_bg_picture and bg_path or nil,
		ninb_anchor = ninbot_anchor,
		ninb_opacity = ninbot_opacity,
	},
	experimental = {
		debug = false,
		jit = false,
		tearing = false,
		scene_add_text = true,
	},
}

--*********************************************************************************************** NINJABRAIN
local is_ninb_running = function()
	local handle = io.popen("pgrep -f 'Ninjabrain.*jar'")
	local result = handle:read("*l")
	handle:close()
	return result ~= nil
end

local exec_ninb = function()
	if not is_ninb_running() then
		waywall.exec("java -Dawt.useSystemAAFontSettings=on -jar " .. nb_path)
	end
end

--*********************************************************************************************** MIRRORS
local make_mirror = function(options)
	local this = nil

	return function(enable)
		if enable and not this then
			this = waywall.mirror(options)
		elseif this and not enable then
			this:close()
			this = nil
		end
	end
end

local mirrors = {
	e_counter = make_mirror({
		src = { x = 13, y = 37, w = 37, h = 9 },
		dst = { x = e_count.x, y = e_count.y, w = 37 * e_count.size, h = 9 * e_count.size },
		color_key = e_count.colorkey and {
			input = "#dddddd",
			output = primary_col,
		} or nil,
	}),

	thin_pie_all = make_mirror({
		src = res_1440 and { x = 10, y = 694, w = 340, h = 221 } or { x = 0, y = 674, w = 340, h = 221 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420 * thin_pie.size / 4, h = 273 * thin_pie.size / 4 },
	}),

	thin_pie_entities = make_mirror({
		src = res_1440 and { x = 10, y = 694, w = 340, h = 178 } or { x = 0, y = 674, w = 340, h = 178 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420 * thin_pie.size / 4, h = 423 * thin_pie.size / 4 },
		color_key = {
			input = "#E446C4",
			output = secondary_col,
		},
	}),
	thin_pie_unspecified = make_mirror({
		src = res_1440 and { x = 10, y = 694, w = 340, h = 178 } or { x = 0, y = 674, w = 340, h = 178 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420 * thin_pie.size / 4, h = 423 * thin_pie.size / 4 },
		color_key = {
			input = "#46CE66",
			output = secondary_col,
		},
	}),
	thin_pie_blockentities = make_mirror({
		src = res_1440 and { x = 10, y = 694, w = 340, h = 178 } or { x = 0, y = 674, w = 340, h = 178 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420 * thin_pie.size / 4, h = 423 * thin_pie.size / 4 },
		color_key = {
			input = "#ec6e4e",
			output = primary_col,
		},
	}),
	thin_pie_destroyProgress = make_mirror({
		src = res_1440 and { x = 10, y = 694, w = 340, h = 178 } or { x = 0, y = 674, w = 340, h = 178 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420 * thin_pie.size / 4, h = 423 * thin_pie.size / 4 },
		color_key = {
			input = "#CC6C46",
			output = secondary_col,
		},
	}),
	thin_pie_prepare = make_mirror({
		src = res_1440 and { x = 10, y = 694, w = 340, h = 178 } or { x = 0, y = 674, w = 340, h = 178 },
		dst = { x = thin_pie.x, y = thin_pie.y, w = 420 * thin_pie.size / 4, h = 423 * thin_pie.size / 4 },
		color_key = {
			input = "#464C46",
			output = secondary_col,
		},
	}),

	thin_percent_all = make_mirror({
		src = res_1440 and { x = 257, y = 879, w = 33, h = 25 } or { x = 247, y = 859, w = 33, h = 25 },
		dst = { x = thin_percent.x, y = thin_percent.y, w = 33 * thin_percent.size, h = 25 * thin_percent.size },
	}),
	thin_percent_blockentities = make_mirror({
		src = res_1440 and { x = 257, y = 879, w = 33, h = 25 } or { x = 247, y = 859, w = 33, h = 25 },
		dst = { x = thin_percent.x, y = thin_percent.y, w = 33 * thin_percent.size, h = 25 * thin_percent.size },
		color_key = {
			input = "#e96d4d",
			output = secondary_col,
		},
	}),
	thin_percent_unspecified = make_mirror({
		src = res_1440 and { x = 257, y = 879, w = 33, h = 25 } or { x = 247, y = 859, w = 33, h = 25 },
		dst = { x = thin_percent.x, y = thin_percent.y, w = 33 * thin_percent.size, h = 25 * thin_percent.size },
		color_key = {
			input = "#45cb65",
			output = secondary_col,
		},
	}),

	tall_pie_all = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 221 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420 * tall_pie.size / 4, h = 273 * tall_pie.size / 4 },
	}),
	tall_pie_entities = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420 * tall_pie.size / 4, h = 423 * tall_pie.size / 4 },
		color_key = {
			input = "#E446C4",
			output = secondary_col,
		},
	}),
	tall_pie_unspecified = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420 * tall_pie.size / 4, h = 423 * tall_pie.size / 4 },
		color_key = {
			input = "#46CE66",
			output = secondary_col,
		},
	}),
	tall_pie_blockentities = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420 * tall_pie.size / 4, h = 423 * tall_pie.size / 4 },
		color_key = {
			input = "#ec6e4e",
			output = primary_col,
		},
	}),
	tall_pie_destroyProgress = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420 * tall_pie.size / 4, h = 423 * tall_pie.size / 4 },
		color_key = {
			input = "#CC6C46",
			output = secondary_col,
		},
	}),
	tall_pie_prepare = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = tall_pie.x, y = tall_pie.y, w = 420 * tall_pie.size / 4, h = 423 * tall_pie.size / 4 },
		color_key = {
			input = "#464C46",
			output = secondary_col,
		},
	}),

	tall_percent_all = make_mirror({
		src = { x = 291, y = 16163, w = 33, h = 25 },
		dst = { x = tall_percent.x, y = tall_percent.y, w = 33 * tall_percent.size, h = 25 * tall_percent.size },
	}),
	tall_percent_blockentities = make_mirror({
		src = { x = 291, y = 16163, w = 33, h = 25 },
		dst = { x = tall_percent.x, y = tall_percent.y, w = 33 * tall_percent.size, h = 25 * tall_percent.size },
		color_key = {
			input = "#e96d4d",
			output = secondary_col,
		},
	}),
	tall_percent_unspecified = make_mirror({
		src = { x = 291, y = 16163, w = 33, h = 25 },
		dst = { x = tall_percent.x, y = tall_percent.y, w = 33 * tall_percent.size, h = 25 * tall_percent.size },
		color_key = {
			input = "#45cb65",
			output = secondary_col,
		},
	}),

	eye_measure = make_mirror({
		src = { x = 162, y = 7902, w = 60, h = 580 },
		dst = res_1440 and { x = 94, y = 470, w = 900, h = 500 } or { x = 30, y = 340, w = 700, h = 400 },
	}),
}

--*********************************************************************************************** BOATEYE
local make_image = function(path, dst)
	local this = nil

	return function(enable)
		if enable and not this then
			this = waywall.image(path, dst)
		elseif this and not enable then
			this:close()
			this = nil
		end
	end
end

local images = {
	measuring_overlay = make_image(overlay_path, {
		dst = res_1440 and { x = 94, y = 470, w = 900, h = 500 } or { x = 30, y = 340, w = 700, h = 400 },
	}),
}

--*********************************************************************************************** MANAGING MIRRORS
local show_mirrors = function(eye, f3, tall, thin)
	images.measuring_overlay(eye)
	mirrors.eye_measure(eye)
	if eye == true then
		waywall.set_sensitivity(0.31255680978290534)
	else
		waywall.set_sensitivity(0)
	end

	if e_count.enabled then
		mirrors.e_counter(f3)
	end

	if thin_pie.enabled then
		if thin_pie.colorkey then
			mirrors.thin_pie_entities(thin)
			mirrors.thin_pie_unspecified(thin)
			mirrors.thin_pie_blockentities(thin)
			mirrors.thin_pie_destroyProgress(thin)
			mirrors.thin_pie_prepare(thin)
		else
			mirrors.thin_pie_all(thin)
		end
	end

	if thin_percent.enabled then
		if thin_percent.colorkey then
			mirrors.thin_percent_blockentities(thin)
			mirrors.thin_percent_unspecified(thin)
		else
			-- mirrors.thin_percent_all(thin)
		end
	end

	if tall_pie.enabled then
		if tall_pie.colorkey then
			mirrors.tall_pie_entities(tall)
			mirrors.tall_pie_unspecified(tall)
			mirrors.tall_pie_blockentities(tall)
			mirrors.tall_pie_destroyProgress(tall)
			mirrors.tall_pie_prepare(tall)
		else
			mirrors.tall_pie_all(tall)
		end
	end

	if tall_percent.enabled then
		if tall_percent.colorkey then
			mirrors.tall_percent_blockentities(tall)
			mirrors.tall_percent_unspecified(tall)
		else
			-- mirrors.tall_percent_all(tall)
		end
	end
end

--*********************************************************************************************** STATES
local thin_enable = function()
	show_mirrors(false, true, false, true)
end

local tall_enable = function()
	show_mirrors(true, true, true, false)
end
local wide_enable = function()
	show_mirrors(false, false, false, false)
end

local res_disable = function()
	show_mirrors(false, false, false, false)
end

--*********************************************************************************************** RESOLUTIONS
local make_res = function(width, height, enable, disable)
	return function()
		local active_width, active_height = waywall.active_res()

		if active_width == width and active_height == height then
			waywall.set_resolution(0, 0)
			disable()
		else
			waywall.set_resolution(width, height)
			enable()
		end
	end
end

local resolutions = {
	thin = make_res(res_1440 and 350 or 340, res_1440 and 1100 or 1080, thin_enable, res_disable),
	tall = make_res(384, 16384, tall_enable, res_disable),
	wide = make_res(res_1440 and 2560 or 1920, res_1440 and 400 or 300, wide_enable, res_disable),
}
--*********************************************************************************************** MISCELLANEOUS

local atum_reset = function()
	waywall.press_key("F12")
	waywall.set_resolution(0, 0)
end

local reset_wall = function()
	waywall.press_key("T")
end

--*********************************************************************************************** KEYBINDS
config.actions = {
	[thin_key] = function()
		resolutions.thin()
	end,

	[wide_key] = function()
		resolutions.wide()
	end,

	[tall_key] = function()
		resolutions.tall()
	end,

	[show_ninbot_key] = function()
		helpers.toggle_floating()
	end,

	[open_ninbot_key] = function()
		exec_ninb()
	end,

	[atum_reset_key] = function()
		atum_reset()
	end,

	[reset_wall_key] = function()
		reset_wall()
	end,
}

return config
