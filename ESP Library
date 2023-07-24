--< variables >--


-- global
local v3n = Vector3.new
local v3z = Vector3.zero

local v2n = Vector2.new
local v2z = Vector2.zero

local cfn = CFrame.new
local cfz = CFrame.zero

local c3n = Color3.new
local c3rgb = Color3.fromRGB
local c3hsb = Color3.fromHSV

local un = UDim.new
local u2n = UDim2.new

local t_insert = table.insert
local t_clear = table.clear
local t_unpack = table.unpack
local t_find = table.find

-- local
local uis = game:GetService('UserInputService')
local tween = game:GetService('TweenService')
local rs = game:GetService('RunService')
local ts = game:GetService('TextService')

local mouse = game:GetService('Players').LocalPlayer:GetMouse()

local library = {
	connections = {},
	reg = {},
	ui_open = false,
	gui = Instance.new('ScreenGui', game.CoreGui)
}
library.theme = {
	main = c3rgb(30, 30, 30),
	bg = c3rgb(20, 20, 20),

	dark_main = c3rgb(15, 15, 15),
	dark_bg = c3rgb(10, 10, 10),

	outline = c3rgb(50, 50, 50),
	accent = c3rgb(170, 130, 255),

	n_text = c3rgb(255, 255, 255),
	a_text = c3rgb(255, 255, 255),
	i_text = c3rgb(150, 150, 150)
}

--< functions >--

-- special
local special = {}

function special:keybind(properties)
	local keybind = {}

	local bind = properties.bind or 'none'
	local watching = false

	local shortened = {
		[Enum.KeyCode.LeftAlt] = 'LAlt',
		[Enum.KeyCode.RightAlt] = 'RAlt',
		[Enum.KeyCode.LeftShift] = 'LShift',
		[Enum.KeyCode.RightShift] = 'RShift',
		[Enum.KeyCode.LeftControl] = 'LCtrl',
		[Enum.KeyCode.RightControl] = 'RCtrl',
		[Enum.KeyCode.One] = '1',
		[Enum.KeyCode.Two] = '2',
		[Enum.KeyCode.Three] = '3',
		[Enum.KeyCode.Four] = '4',
		[Enum.KeyCode.Five] = '5',
		[Enum.KeyCode.Six] = '6',
		[Enum.KeyCode.Seven] = '7',
		[Enum.KeyCode.Eight] = '8',
		[Enum.KeyCode.Nine] = '9',
		[Enum.KeyCode.Zero] = '0'
	}
	local key_word = {
		['LAlt'] = Enum.KeyCode.LeftAlt,
		['RAlt'] = Enum.KeyCode.RightAlt,
		['LShift'] = Enum.KeyCode.LeftShift,
		['RShift'] = Enum.KeyCode.RightShift,
		['LCtrl'] = Enum.KeyCode.LeftControl,
		['RCtrl'] = Enum.KeyCode.RightControl,
		['1'] = Enum.KeyCode.One,
		['2'] = Enum.KeyCode.Two,
		['3'] = Enum.KeyCode.Three,
		['4'] = Enum.KeyCode.Four,
		['5'] = Enum.KeyCode.Five,
		['6'] = Enum.KeyCode.Six,
		['7'] = Enum.KeyCode.Seven,
		['8'] = Enum.KeyCode.Eight,
		['9'] = Enum.KeyCode.Nine,
		['0'] = Enum.KeyCode.Zero,
		
		['End'] = Enum.KeyCode.End
	}
	
	local blacklisted = {
		Enum.KeyCode.Slash,
		Enum.KeyCode.Escape,
		Enum.KeyCode.Space
	}
	local mouse_keys = {
		[Enum.UserInputType.MouseButton1] = 'MB1',
		[Enum.UserInputType.MouseButton2] = 'MB2',
		[Enum.UserInputType.MouseButton3] = 'MB3'
	}

	-- create elements
	local keybind_label = library:create('text', {
		Position = u2n(1.15, 0, 0, 0),
		Size = u2n(.2, 0, 1, 0),
		Text = '[none]',
		TextColor3 = library.theme.i_text,
		TextXAlignment = Enum.TextXAlignment.Right,
		Parent = self.Instance
	})
	
	if bind ~= 'none' then
		if type(bind) == 'string' then
			if key_word[bind] then
				keybind_label.Text = '[' .. bind .. ']'
				bind = key_word[bind]
			else bind = 'none' end
		else
			if shortened[bind] then keybind_label.Text = '[' .. shortened[bind] .. ']'
			elseif bind.Name then keybind_label.Text = '[' .. bind.Name .. ']' end
		end
	end

	-- add to registry
	library:add_to_registry(keybind_label, {
		['TextColor3'] = 'i_text'
	})

	-- functions
	library:conn(uis.InputBegan, function(i, gpe)
		if not gpe then
			if watching then
				if i.UserInputType == Enum.UserInputType.Keyboard then
					if not t_find(blacklisted, i.KeyCode) then
						bind = i.KeyCode
						keybind_label.Text = shortened[i.KeyCode] and '[' .. shortened[i.KeyCode] .. ']' or '[' .. i.KeyCode.Name .. ']'
						watching = false
					end
				end
			else
				if i.KeyCode == bind then
					if properties.callback then properties.callback() end
					if self.change_val then
						self:change_val(not self.value)
						self.callback(self.value)
					end
				end
			end
		end
	end)

	library:conn(keybind_label.InputBegan, function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			keybind_label.Text = '[...]'
			bind = nil
			watching = true
		end
	end)

	-- return
	keybind.Instance = keybind_label
	return keybind
end
function special:color(properties)
	local color = {}

	local value = properties.default or properties.color or c3rgb(255, 255, 255)

	-- create elements
	local color_outer = library:create('frame', {
		BackgroundColor3 = library.theme.outline,
		BorderColor3 = c3rgb(0, 0, 0),
		Position = u2n(1.25, 0, 0, 0),
		Size = u2n(0, 15, 0, 15),
		Parent = self.Instance
	})
	local color_inner = library:create('frame', {
		BackgroundColor3 = value,
		BorderColor3 = c3rgb(0, 0, 0),
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = color_outer
	})

	local content_outer = library:create('frame', {
		BackgroundColor3 = library.theme.bg,
		BorderColor3 = c3rgb(0, 0, 0),
		Position = u2n(0, 0, 1, 0),
		Size = u2n(1, 0, 0, 110),
		Visible = false,
		ZIndex = 5,
		Parent = self.Instance
	})
	local content_inner = library:create('frame', {
		BackgroundColor3 = library.theme.main,
		BorderColor3 = c3rgb(0, 0, 0),
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		ZIndex = 6,
		Parent = content_outer
	})
	local layout = library:create('layout', {
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = content_inner
	})

	for i=1,3 do
		local dragging = false

		-- create elements
		local slider_frame = library:create('frame', {
			BackgroundTransparency = 1,
			Size = u2n(1, 0, 0, 35),
			ZIndex = 7,
			Parent = content_inner
		})
		local slider_outer = library:create('frame', {
			BackgroundColor3 = library.theme.bg,
			BorderColor3 = c3rgb(0, 0, 0),
			Position = u2n(0, 0, .5, 0),
			Size = u2n(1, 0, 0, 15),
			ZIndex = 8,
			Parent = slider_frame
		})
		local slider_inner = library:create('frame', {
			BackgroundColor3 = library.theme.dark_main,
			BorderColor3 = c3rgb(0, 0, 0),
			BorderMode = Enum.BorderMode.Inset,
			Position = u2n(0, 1, 0, 1),
			Size = u2n(1, -2, 1, -2),
			ZIndex = 9,
			Parent = slider_outer
		})
		local slider_color = library:create('frame', {
			BackgroundColor3 = library.theme.accent,
			BorderSizePixel = 0,
			Size = u2n(value.R / 1, 0, 1, 0),
			ZIndex = 10,
			Parent = slider_inner
		})
		local slider_title = library:create('text', {
			Size = u2n(1, 0, 0, 20),
			Text = 'R: ' .. tostring(value.R * 255),
			TextColor3 = library.theme.a_text,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 8,
			Parent = slider_frame
		})

		if i == 2 then 
			slider_title.Text = 'G: ' .. tostring(value.G * 255)
			slider_color.Size = u2n(value.G / 1, 0, 1, 0)
		elseif i == 3 then 
			slider_title.Text = 'B: ' .. tostring(value.B * 255) 
			slider_color.Size = u2n(value.B / 1, 0, 1, 0)

		end

		-- add to registry
		library:add_to_registry(slider_outer, {
			['BackgroundColor3'] = 'bg'
		})
		library:add_to_registry(slider_inner, {
			['BackgroundColor3'] = 'dark_main'
		})
		library:add_to_registry(slider_color, {
			['BackgroundColor3'] = 'accent'
		})
		library:add_to_registry(slider_title, {
			['TextColor3'] = 'a_text'
		})

		-- functions
		local function value_changed()
			slider_color.Size = u2n(0, math.clamp((mouse.x - slider_inner.AbsolutePosition.X), 0, slider_inner.AbsolutePosition.X), 1, 0)

			local new_value = (slider_color.Size.X.Offset / slider_inner.AbsoluteSize.X) * (255 - 0) + 0
			local nvalue = math.clamp(1 * math.floor(new_value / 1), 0, 255)

			slider_color.Size = u2n(nvalue / 255, 0, 1, 0)

			if i == 1 then
				value = c3rgb(nvalue, value.G * 255, value.B * 255)

				slider_title.Text = 'R: ' .. tostring(math.round(value.R * 255))
				color_inner.BackgroundColor3 = value
				if properties.callback then properties.callback(value) end
			elseif i == 2 then 
				value = c3rgb(value.R * 255, nvalue, value.B * 255)

				slider_title.Text = 'G: ' .. tostring(math.round(value.G * 255))
				color_inner.BackgroundColor3 = value
				if properties.callback then properties.callback(value) end
			elseif i == 3 then 
				value = c3rgb(value.R * 255, value.G * 255, nvalue)

				slider_title.Text = 'B: ' .. tostring(math.round(value.B * 255))
				color_inner.BackgroundColor3 = value
				if properties.callback then properties.callback(value) end
			end
		end

		library:mousedown(slider_outer, function()
			dragging = true
			value_changed()
		end, false)
		library:mouseup(slider_outer, function()
			dragging = false
		end)
		library:conn(mouse.Move, function()
			if dragging then value_changed() end
		end)
	end

	-- add to registry
	library:add_to_registry(color_outer, {
		['BackgroundColor3'] = 'outline'
	})
	library:add_to_registry(content_outer, {
		['BackgroundColor3'] = 'bg'
	})
	library:add_to_registry(content_inner, {
		['BackgroundColor3'] = 'main'
	})

	-- functions
	library:mousedown(color_outer, function()
		content_outer.Visible = not content_outer.Visible
		library.ui_open = content_outer.Visible
	end, false)

	library:highlight(color_outer, color_outer, 'BackgroundColor3', 'accent', 'outline')

	-- return
	color.Color_Instance = color_outer
	return color
end

special.__index = special
special.__namecall = function(A, B, ...) return A[B](...) end


-- normal
local base = {}

function base:label(properties)
	local label = {}

	-- create elements
	local label_instance = library:create('text', {
		Size = u2n(.75, 0, 0, 20),
		Text = properties.text,
		TextColor3 = library.theme.n_text,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 2,
		Parent = self.container
	})

	-- add to registry
	library:add_to_registry(label_instance, {
		['TextColor3'] = 'n_text'
	})

	-- functions
	function label:update(new_properties)
		if new_properties.text then label_instance.Text = new_properties.text end
	end

	-- return
	label.Instance = label_instance
	setmetatable(label, special)
	return label
end
function base:button(properties)
	local button = {}

	-- create elements
	local button_outer = library:create('frame', {
		BackgroundColor3 = c3rgb(0, 0, 0),
		BorderSizePixel = 0,
		Size = u2n(1, 0, 0, 20),
		Parent = self.container
	})
	local button_inner = library:create('frame', {
		BackgroundColor3 = library.theme.main,
		BorderColor3 = library.theme.outline,
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = button_outer
	})
	local button_title = library:create('text', {
		Size = u2n(1, 0, 1, 0),
		Text = properties.text,
		TextColor3 = library.theme.n_text,
		Parent = button_inner
	})

	-- add to registry
	library:add_to_registry(button_inner, {
		['BackgroundColor3'] = 'main',
		['BorderColor3'] = 'outline'
	})
	library:add_to_registry(button_title, {
		['TextColor3'] = 'n_text'
	})

	-- functions
	function button:update(new_properties)
		if new_properties.callback then properties.callback = new_properties.callback end
		if new_properties.text then button_title.Text = new_properties.text end
	end

	library:mousedown(button_outer, function()
		if properties.callback then properties.callback() end
	end, true)
	library:highlight(button_outer, button_inner, 'BorderColor3', 'accent', 'outline', true)

	-- return
	button.Instance = button_outer
	return button
end
function base:toggle(properties)
	local toggle = {}
	local value = properties.default or false

	-- create elements
	local toggle_frame = library:create('frame', {
		BackgroundTransparency = 1,
		Size = u2n(.75, 0, 0, 15),
		Parent = self.container
	})
	local toggle_outer = library:create('frame', {
		BackgroundColor3 = c3rgb(0, 0, 0),
		BorderSizePixel = 0,
		Size = u2n(0, 15, 1, 0),
		Parent = toggle_frame
	})
	local toggle_inner = library:create('frame', {
		BackgroundColor3 = library.theme.bg,
		BorderColor3 = value and library.theme.accent or library.theme.outline,
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = toggle_outer
	})
	local toggle_color = library:create('frame', {
		BackgroundColor3 = value and library.theme.accent or library.theme.main,
		BorderColor3 = c3rgb(0, 0, 0),
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = toggle_inner
	})

	local toggle_title = library:create('text', {
		Position = u2n(0, 20, 0, -1),
		Size = u2n(1, -20, 1, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
		Text = properties.text,
		TextColor3 = value and library.theme.a_text or library.theme.i_text,
		Parent = toggle_frame
	})

	-- add to registry
	library:add_to_registry(toggle_inner, {
		['BackgroundColor3'] = 'bg',
		['BorderColor3'] = value and 'accent' or 'outline'
	})
	library:add_to_registry(toggle_color, {
		['BackgroundColor3'] = value and 'accent' or 'main'
	})
	library:add_to_registry(toggle_title, {
		['TextColor3'] = value and 'a_text' or 'i_text'
	})

	-- functions
	function toggle:update(new_properties)
		if new_properties.callback then properties.callback = new_properties.callback end
		if new_properties.text then toggle_title.Text = new_properties.text end
	end
	function toggle:change_func(new)
		properties.callback = new
	end
	function toggle:change_val(new)
		value = new
		toggle.value = value

		toggle_color.BackgroundColor3 = value and library.theme.accent or library.theme.main
		library.reg[toggle_color].Properties['BackgroundColor3'] = value and 'accent' or 'main'

		toggle_title.TextColor3 = value and library.theme.a_text or library.theme.i_text
		library.reg[toggle_title].Properties['TextColor3'] = value and 'a_text' or 'i_text'

		toggle_inner.BorderColor3 = value and library.theme.accent or library.theme.outline
		library.reg[toggle_inner].Properties['BorderColor3'] = value and 'accent' or 'outline'
	end

	library:mousedown(toggle_frame, function()
		value = not value

		toggle_color.BackgroundColor3 = value and library.theme.accent or library.theme.main
		library.reg[toggle_color].Properties['BackgroundColor3'] = value and 'accent' or 'main'

		toggle_title.TextColor3 = value and library.theme.a_text or library.theme.i_text
		library.reg[toggle_title].Properties['TextColor3'] = value and 'a_text' or 'i_text'

		if properties.callback then 
			properties.callback(value)
			toggle.value = value
		end
	end, true)
	library:highlight(toggle_frame, toggle_inner, 'BorderColor3', 'accent', 'outline', true)

	-- return
	toggle.Instance = toggle_frame
	toggle.value = value
	toggle.callback = properties.callback
	setmetatable(toggle, special)
	return toggle
end
function base:slider(properties)
	local slider = {}

	local value = properties.default or 0
	local min = properties.min or 0
	local max = properties.max or 100
	local prefix = properties.prefix or ''
	local increment = properties.inc or properties.increment or 1

	local dragging = false

	-- create elements
	local slider_frame = library:create('frame', {
		BackgroundTransparency = 1,
		Size = u2n(1, 0, 0, 35),
		Parent = self.container
	})
	local slider_outer = library:create('frame', {
		BackgroundColor3 = library.theme.outline,
		BorderColor3 = c3rgb(0, 0, 0),
		Position = u2n(0 ,0, .5, 0),
		Size = u2n(1, 0, 0, 12),
		Parent = slider_frame
	})
	local slider_inner = library:create('frame', {
		BackgroundColor3 = library.theme.main,
		BorderColor3 = c3rgb(0, 0, 0),
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = slider_outer
	})
	local slider_color = library:create('frame', {
		BackgroundColor3 = library.theme.accent,
		BorderSizePixel = 0,
		Size = u2n(value / max, 0, 1, 0),
		Parent = slider_inner
	})

	local slider_title = library:create('text', {
		Size = u2n(1, 0, 0, 20),
		Text = properties.text .. ': ' .. tostring(value) .. prefix,
		TextColor3 = library.theme.n_text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = slider_frame
	})

	-- add to registry
	library:add_to_registry(slider_outer, {
		['BackgroundColor3'] = 'outline'
	})
	library:add_to_registry(slider_inner, {
		['BackgroundColor3'] = 'main'
	})
	library:add_to_registry(slider_color, {
		['BackgroundColor3'] = 'accent'
	})
	library:add_to_registry(slider_title, {
		['TextColor3'] = 'n_text'
	})

	-- functions
	local function value_changed()
		slider_color.Size = u2n(0, math.clamp((mouse.x - slider_inner.AbsolutePosition.X), 0, slider_inner.AbsolutePosition.X), 1, 0)

		local new_value = (slider_color.Size.X.Offset / slider_inner.AbsoluteSize.X) * (max - min) + min
		value = math.clamp(increment * math.floor(new_value / increment), min, max)

		slider_title.Text = properties.text .. ': ' .. tostring(value) .. prefix
		slider_color.Size = u2n(value / max, 0, 1, 0)

		if properties.callback then properties.callback(value) end
	end

	function slider:update(new_properties)
		if new_properties.callback then properties.callback = new_properties.callback end
		if new_properties.value then value = new_properties.value value_changed() end
	end

	library:mousedown(slider_outer, function()
		dragging = true
		value_changed()
	end, true)
	library:mouseup(slider_outer, function()
		dragging = false
	end)
	library:conn(mouse.Move, function()
		if dragging then value_changed() end
	end)
	library:highlight(slider_outer, slider_outer, 'BackgroundColor3', 'accent', 'outline', true)

	-- return
	slider.Instance = slider_frame
	return slider
end
function base:dropdown(properties)
	local dropdown = {}

	local values = properties.values
	local value_buttons = {}
	local chosen = properties.default or 'none'

	-- create elements
	local dropdown_frame = library:create('frame', {
		BackgroundTransparency = 1,
		Size = u2n(1, 0, 0, 40),
		Parent = self.container
	})
	local dropdown_button_outer = library:create('frame', {
		BackgroundColor3 = library.theme.outline,
		BorderColor3 = c3rgb(0, 0, 0),
		Position = u2n(0, 0, 0, 20),
		Size = u2n(1, 0, 0, 18),
		Parent = dropdown_frame
	})
	local dropdown_button_inner = library:create('frame', {
		BackgroundColor3 = library.theme.main,
		BorderColor3 = c3rgb(0, 0, 0),
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = dropdown_button_outer
	})
	local dropdown_button_image = library:create('image', {
		BackgroundTransparency = 1,
		Position = u2n(1, -20, 0, -2),
		Size = u2n(0, 20, 0, 20),
		Image = 'rbxassetid://3926307971',
		ImageRectOffset = v2n(324, 524),
		ImageRectSize = v2n(36, 36),
		Parent = dropdown_button_outer
	})
	local dropdown_value = library:create('text', {
		Position = u2n(0, 3, 0, 0),
		Size = u2n(1, -6, 0, 15),
		Text = chosen,
		TextColor3 = library.theme.a_text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = dropdown_button_outer
	})
	local dropdown_title = library:create('text', {
		Size = u2n(1, 0, 0, 15),
		Text = properties.text,
		TextColor3 = library.theme.a_text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = dropdown_frame
	})

	local dropdown_content_outer = library:create('frame', {
		BackgroundColor3 = library.theme.outline,
		BorderColor3 = c3rgb(0, 0, 0),
		Position = u2n(0, 0, 0, 40),
		Size = u2n(1, 0, 0, (#values * 15) + 4),
		Visible = false,
		ZIndex = 2,
		Parent = dropdown_frame
	})
	local dropdown_content_inner = library:create('frame', {
		BackgroundColor3 = library.theme.dark_main,
		BorderColor3 = c3rgb(0, 0, 0),
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		ZIndex = 99,
		Parent = dropdown_content_outer
	})
	local dropdown_content_layout = library:create('layout', {
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = dropdown_content_inner
	})
	for i,v in pairs(values) do
		local btn = {}

		-- create elements
		local btn_frame = library:create('frame', {
			BackgroundTransparency = 1,
			BackgroundColor3 = library.theme.main,
			BorderSizePixel = 0,
			Size = u2n(1, 0, 0, 15),
			ZIndex = 99,
			Parent = dropdown_content_inner
		})
		local btn_title = library:create('text', {
			Position = u2n(0, 3, 0, -1),
			Size = u2n(1, -6, 1, 0),
			Text = v,
			TextColor3 = library.theme.i_text,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 99,
			Parent = btn_frame
		})

		-- add to registry
		library:add_to_registry(btn_frame, {
			['BackgroundColor3'] = 'main'
		})
		library:add_to_registry(btn_title, {
			['TextColor3'] = 'i_text'
		})

		if chosen == v then
			btn_frame.BackgroundTransparency = 0

			btn_title.TextColor3 = library.theme.a_text
			library.reg[btn_title].Properties['TextColor3'] = 'a_text'
		end

		-- functions
		function btn:Hide()
			btn_frame.BackgroundTransparency = 1

			btn_title.TextColor3 = library.theme.i_text
			library.reg[btn_title].Properties['TextColor3'] = 'i_text'
		end
		function btn:Show()
			btn_frame.BackgroundTransparency = 0

			btn_title.TextColor3 = library.theme.a_text
			library.reg[btn_title].Properties['TextColor3'] = 'a_text'
		end

		library:mousedown(btn_frame, function()
			for i,v in pairs(value_buttons) do v:Hide() end
			btn:Show()

			chosen = v
			dropdown_value.Text = v
			if properties.callback then properties.callback(v) end
		end, false)

		-- return
		btn.Instance = btn_frame
		value_buttons[v] = btn
	end

	-- add to registry
	library:add_to_registry(dropdown_button_outer, {
		['BackgroundColor3'] = 'outline'
	})
	library:add_to_registry(dropdown_button_inner, {
		['BackgroundColor3'] = 'main'
	})
	library:add_to_registry(dropdown_value, {
		['TextColor3'] = 'a_text'
	})
	library:add_to_registry(dropdown_title, {
		['TextColor3'] = 'a_text'
	})
	library:add_to_registry(dropdown_content_outer, {
		['BackgroundColor3'] = 'outline'
	})
	library:add_to_registry(dropdown_content_inner, {
		['BackgroundColor3'] = 'dark_main'
	})

	-- functions
	function dropdown:update(new_properties)
		if new_properties.callback then properties.callback = new_properties.callback end
		if new_properties.text then dropdown_title.Text = new_properties.text end
		if new_properties.value then
			if value_buttons[new_properties.value] then
				chosen = new_properties.value
				dropdown_value.Text = new_properties.value

				for i,v in pairs(value_buttons) do v:Hide() end
				value_buttons[new_properties.value]:Show()
			end
		end
	end

	library:mousedown(dropdown_button_outer, function()
		if library.ui_open and dropdown_content_outer.Visible == false then return end
		
		dropdown_content_outer.Visible = not dropdown_content_outer.Visible
		library.ui_open = dropdown_content_outer.Visible
	end, false)
	library:highlight(dropdown_button_outer, dropdown_button_outer, 'BackgroundColor3', 'accent', 'outline', false)

	-- return
	dropdown.Instance = dropdown_frame
	return dropdown
end
function base:dropdown_multi(properties)
	local dropdown = {}
	
	local values = properties.values
	local value_buttons = {}
	local chosen = properties.default or { '' }
	local chosen_str = ''
	
	for i,v in pairs(chosen) do
		if chosen_str == '' then
			chosen_str = chosen_str .. v
		else
			chosen_str = chosen_str .. ', ' .. v
		end
	end
	
	-- create elements
	local dropdown_frame = library:create('frame', {
		BackgroundTransparency = 1,
		Size = u2n(1, 0, 0, 40),
		Parent = self.container
	})
	local dropdown_button_outer = library:create('frame', {
		BackgroundColor3 = library.theme.outline,
		BorderColor3 = c3rgb(0, 0, 0),
		Position = u2n(0, 0, 0, 20),
		Size = u2n(1, 0, 0, 18),
		Parent = dropdown_frame
	})
	local dropdown_button_inner = library:create('frame', {
		BackgroundColor3 = library.theme.main,
		BorderColor3 = c3rgb(0, 0, 0),
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = dropdown_button_outer
	})
	local dropdown_button_image = library:create('image', {
		BackgroundTransparency = 1,
		Position = u2n(1, -20, 0, -2),
		Size = u2n(0, 20, 0, 20),
		Image = 'rbxassetid://3926307971',
		ImageRectOffset = v2n(324, 524),
		ImageRectSize = v2n(36, 36),
		Parent = dropdown_button_outer
	})
	local dropdown_value = library:create('text', {
		Position = u2n(0, 3, 0, 0),
		Size = u2n(1, -6, 0, 15),
		Text = chosen_str,
		TextColor3 = library.theme.a_text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = dropdown_button_outer
	})
	local dropdown_title = library:create('text', {
		Size = u2n(1, 0, 0, 15),
		Text = properties.text,
		TextColor3 = library.theme.a_text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = dropdown_frame
	})

	local dropdown_content_outer = library:create('frame', {
		BackgroundColor3 = library.theme.outline,
		BorderColor3 = c3rgb(0, 0, 0),
		Position = u2n(0, 0, 0, 40),
		Size = u2n(1, 0, 0, (#values * 15) + 4),
		Visible = false,
		ZIndex = 2,
		Parent = dropdown_frame
	})
	local dropdown_content_inner = library:create('frame', {
		BackgroundColor3 = library.theme.dark_main,
		BorderColor3 = c3rgb(0, 0, 0),
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		ZIndex = 99,
		Parent = dropdown_content_outer
	})
	local dropdown_content_layout = library:create('layout', {
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = dropdown_content_inner
	})
	
	chosen_str = ''
	local function createButton(v)
		local btn = {}

		-- create elements
		local btn_frame = library:create('frame', {
			BackgroundTransparency = 1,
			BackgroundColor3 = library.theme.main,
			BorderSizePixel = 0,
			Size = u2n(1, 0, 0, 15),
			ZIndex = 99,
			Parent = dropdown_content_inner
		})
		local btn_title = library:create('text', {
			Position = u2n(0, 3, 0, -1),
			Size = u2n(1, -6, 1, 0),
			Text = v,
			TextColor3 = library.theme.i_text,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 99,
			Parent = btn_frame
		})

		-- add to registry
		library:add_to_registry(btn_frame, {
			['BackgroundColor3'] = 'main'
		})
		library:add_to_registry(btn_title, {
			['TextColor3'] = 'i_text'
		})

		for i2,v2 in pairs(chosen) do
			if v2 == v then
				btn_frame.BackgroundTransparency = 0

				btn_title.TextColor3 = library.theme.a_text
				library.reg[btn_title].Properties['TextColor3'] = 'a_text'
			end
		end

		-- functions
		function btn:Hide()
			btn_frame.BackgroundTransparency = 1

			btn_title.TextColor3 = library.theme.i_text
			library.reg[btn_title].Properties['TextColor3'] = 'i_text'
		end
		function btn:Show()
			btn_frame.BackgroundTransparency = 0

			btn_title.TextColor3 = library.theme.a_text
			library.reg[btn_title].Properties['TextColor3'] = 'a_text'
		end

		library:mousedown(btn_frame, function()
			for i,v in pairs(value_buttons) do
				print('Instance nil: ' .. tostring(v.Instance == nil) .. ' | Children: ' .. #v.Instance:GetChildren())
				if string.find(chosen_str, v.Instance:FindFirstChild('TextLabel').Text) then 
					v:Show()
					break
				end
			end

			if btn_frame.BackgroundTransparency == 1 then 
				btn:Show()

				library:in_table(chosen, v, nil, function(_i) table.insert(chosen, v) end)

				local nText = ''
				dropdown_value.Text = '...'


				for i2, v2 in pairs(chosen) do
					if nText == '' then
						nText = nText .. v2
					else
						nText = nText .. ', ' .. v2
					end
				end

				if library:text_bounds(nText, 14) < dropdown_value.AbsoluteSize.X then dropdown_value.Text = nText end
			elseif btn_frame.BackgroundTransparency == 0 then
				btn:Hide()

				local nText = ''
				dropdown_value.Text = '...'
				
				library:in_table(chosen, v, function(_i) table.remove(chosen, _i) end, nil)
				for i2,v2 in pairs(chosen) do
					if nText == '' then
						nText = nText .. v2
					else
						nText = nText .. ', ' .. v2
					end
				end

				if library:text_bounds(nText, 14) < dropdown_value.AbsoluteSize.X then dropdown_value.Text = nText end
			end

			if properties.callback then properties.callback(chosen) end
		end, false)

		-- return
		btn.Instance = btn_frame
		value_buttons[v] = btn
	end
	for i,v in pairs(values) do
		createButton(v)
	end
	
	-- add to registry
	library:add_to_registry(dropdown_button_outer, {
		['BackgroundColor3'] = 'outline'
	})
	library:add_to_registry(dropdown_button_inner, {
		['BackgroundColor3'] = 'main'
	})
	library:add_to_registry(dropdown_value, {
		['TextColor3'] = 'a_text'
	})
	library:add_to_registry(dropdown_title, {
		['TextColor3'] = 'a_text'
	})
	library:add_to_registry(dropdown_content_outer, {
		['BackgroundColor3'] = 'outline'
	})
	library:add_to_registry(dropdown_content_inner, {
		['BackgroundColor3'] = 'dark_main'
	})

	-- functions
	function dropdown:update(new_properties)
		if new_properties.callback then properties.callback = new_properties.callback end
		if new_properties.text then dropdown_title.Text = new_properties.text end
		if new_properties.value then
			chosen = new_properties.Value
			dropdown_value.Text = ''
			for i,v in pairs(chosen) do
				if dropdown_value.Text == '' then
					dropdown_value.Text = dropdown_value.Text .. v
					chosen_str = chosen_str .. v
				else
					dropdown_value.Text = dropdown_value.Text .. ', ' .. v
					chosen_str = chosen_str .. ', ' .. v
				end
			end
			for i,v in pairs(value_buttons) do
				if string.find(chosen_str, v.Instance.TextLabel.Text) then v:Show()
				else v:Hide() end
			end
		end
		if new_properties.values then
			for i,v in pairs(new_properties.values) do
				if not value_buttons[v] then createButton(v) end
			end
			for i,v in pairs(values) do
				if not library:in_table(new_properties.values, v, nil, nil) then
					value_buttons[v].Instance:Destroy()
					table.remove(value_buttons, i)
				end
			end
			
			values = new_properties.values
			dropdown_content_outer.Size = u2n(1, 0, 0, (#values * 15) + 4)
		end
	end

	library:mousedown(dropdown_button_outer, function()
		if library.ui_open and dropdown_content_outer.Visible == false then return end

		dropdown_content_outer.Visible = not dropdown_content_outer.Visible
		library.ui_open = dropdown_content_outer.Visible
	end, false)
	library:highlight(dropdown_button_outer, dropdown_button_outer, 'BackgroundColor3', 'accent', 'outline', false)

	-- return
	dropdown.Instance = dropdown_frame
	return dropdown
end

base.__index = base
base.__namecall = function(A, B, ...) return A[B](...) end


-- library
function library:unload()
	for i,v in pairs(self.connections) do
		v:Disconnect()
	end

	if library.gui then library.gui:Destroy() end
	if library.unload_callback then library.unload_callback() end

	t_clear(library)
	_G.Sentra = nil
end
function library:create(class, ...)
	local Args = t_unpack({...})
	local Shortened = {
		['frame'] = 'Frame',
		['Text'] = 'TextLabel',
		['text'] = 'TextLabel',
		['Layout'] = 'UIListLayout',
		['layout'] = 'UIListLayout',
		['Image'] = 'ImageLabel',
		['image'] = 'ImageLabel'
	}

	if type(class) ~= 'string' then return 'class was not a <string>' end

	class = Shortened[class]

	local i = Instance.new(class)
	for Property, Value in pairs(Args) do
		i[Property] = Value
	end

	if class == 'TextLabel' then
		if not Args['BackgroundTransparency'] then i['BackgroundTransparency'] = 1 end
		i['Font'] = Enum.Font.RobotoMono
		i['TextSize'] = 14
		i['TextStrokeTransparency'] = 0
	end

	return i
end

function library:conn(conn, callback)
	table.insert(library.connections, conn:Connect(callback))
end
function library:highlight(inst, instc, pn, acn, icn, ui)
	library:conn(inst.MouseEnter, function()
		if ui and not library.ui_open or not ui then
			instc[pn] = library.theme[acn]
			library.reg[instc].Properties[pn] = acn
		end
	end)
	library:conn(inst.MouseLeave, function()
		if ui and not library.ui_open or not ui then
			instc[pn] = library.theme[icn]
			library.reg[instc].Properties[pn] = icn
		end
	end)
end
function library:mousedown(inst, callback, ui)
	library:conn(inst.InputBegan, function(i)
		if ui and not library.ui_open or not ui then
			if i.UserInputType == Enum.UserInputType.MouseButton1 then
				callback()
			end
		end
	end)
end
function library:mouseup(inst, callback)
	library:conn(inst.InputEnded, function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			callback()
		end
	end)
end
function library:draggable(inst)
	inst.Active = true

	library:conn(inst.InputBegan, function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			local pos = v2n(mouse.X - inst.AbsolutePosition.X, mouse.Y - inst.AbsolutePosition.Y)
			if pos.Y > 15 then return end

			while uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
				local new_pos = u2n(0, mouse.x - pos.X + (inst.Size.X.Offset * inst.AnchorPoint.X), 0, mouse.Y - pos.Y + (inst.Size.Y.Offset * inst.AnchorPoint.Y))

				if new_pos.X.Offset < 2 then new_pos = u2n(0, 2, 0, new_pos.Y.Offset) end
				if new_pos.X.Offset + inst.Size.X.Offset > 1918 then new_pos = u2n(0, 1918 - inst.Size.X.Offset, 0, new_pos.Y.Offset) end
				if new_pos.Y.Offset < -34 then new_pos = u2n(0, new_pos.X.Offset, 0, -34) end
				if new_pos.Y.Offset + inst.Size.Y.Offset > 1042 then new_pos = u2n(0, new_pos.X.Offset, 0, 1042 - inst.Size.Y.Offset) end

				inst.Position = new_pos

				rs.RenderStepped:Wait()
			end
		end
	end)
end

function library:add_to_registry(inst, prop)
	local data = {
		Instance = inst,
		Properties = prop, -- { 'TextColor3' = 'FontColor' }
		Index = #library.reg + 1
	}

	library.reg[inst] = data
end
function library:remove_from_registry(inst)
	table.remove(library.reg, library.reg[inst].Index)
end

function library:update_theme(new_theme)
	for Object, Data in pairs(library.reg) do -- { Inner = <Table> Data = { <Instance> Instance, <Table> Properties, <Number> Index } }
		for Property, ColorIdx in pairs(Data.Properties) do -- { ['BackgroundColor3'] = 'accent', ['BorderColor3'] = 'main' }
			Data.Instance[Property] = new_theme[ColorIdx]
		end
	end
	library.theme = new_theme
end
function library:new_theme(color_name, color)
	library.theme[color_name] = color
	library:update_theme(library.theme)
end
function library:reset_theme()
	library.theme = {
		main = c3rgb(30, 30, 30),
		bg = c3rgb(20, 20, 20),

		dark_main = c3rgb(15, 15, 15),
		dark_bg = c3rgb(10, 10, 10),

		outline = c3rgb(50, 50, 50),
		accent = c3rgb(170, 130, 255),

		n_text = c3rgb(255, 255, 255),
		a_text = c3rgb(255, 255, 255),
		i_text = c3rgb(150, 150, 150)
	}
	library:update_theme(library.theme)
end
function library:apply_settings(tab)
	assert(tab.section, 'library:apply_settings() takes {tab} as an argument.')
	
	-- create sections
	local s_theme = tab:section('theme', 0)
	local m_theme = tab:section('main', 1)
	local theme_stuff = {}
	
	-- create s_theme stuff
	for i,v in pairs(library.theme) do
		local btn = s_theme:label({ text = i }):color({ default = v, callback = function(val) library:update_theme(i, val) end })
		table.insert(theme_stuff, {
			Table = btn,
			Name = i
		})
	end
	local reset_button = s_theme:button({ text = 'reset to default', callback = function()
		library:reset_theme()
		for i,v in pairs(theme_stuff) do
			v.Table.Color_Instance.Frame.BackgroundColor3 = library.theme[v.Name]
		end
	end })
	
	-- create m_theme stuff
	m_theme:button({ text = 'unload', function() library:unload() end })
	m_theme:label({ text = 'unload bind' }):keybind({ bind = 'End', callback = function() library:unload() end })
	m_theme:label({ text = 'toggle ui bind' }):keybind({ bind = 'RAlt', callback = function() library.menu:toggle() end })
end

function library:in_table(Table, ValueToSearch, FoundCallback, NotFoundCallback)
	local found = false
	
	for i,v in pairs(Table) do
		if v == ValueToSearch then
			found = true
			if FoundCallback then FoundCallback(i) end
			break
		end
	end
	if not found and NotFoundCallback then NotFoundCallback() end
	
	return found
end
function library:text_bounds(Text, Size)
	return ts:GetTextSize(Text, Size, Enum.Font.RobotoMono, v2n(1920, 1080)).X
end

function library:menu(title)
	local menu = {
		tabs = {}
	}

	-- create elements
	local outer = library:create('frame', {
		BackgroundColor3 = c3rgb(0, 0, 0),
		BorderSizePixel = 0,
		Position = u2n(0, 400, 0, 50),
		Size = u2n(0, 550, 0, 600),
		Parent = library.gui
	})
	local inner = library:create('frame', {
		BackgroundColor3 = library.theme.main,
		BorderColor3 = library.theme.accent,
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = outer
	})
	local main_outer = library:create('frame', {
		BackgroundColor3 = library.theme.bg,
		BorderColor3 = library.theme.outline,
		Position = u2n(0, 5, 0, 20),
		Size = u2n(1, -10, 1, -25),
		Parent = inner
	})
	local main_inner = library:create('frame', {
		BackgroundColor3 = library.theme.bg,
		BorderColor3 = c3rgb(0, 0, 0),
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = main_outer
	})

	local button_area_outer = library:create('frame', {
		BackgroundColor3 = c3rgb(0, 0, 0),
		BorderSizePixel = 0,
		Position = u2n(0, 5, 0, 5),
		Size = u2n(1, -10, 0, 35),
		Parent = main_inner
	})
	local button_area_inner = library:create('frame', {
		BackgroundColor3 = library.theme.bg,
		BorderColor3 = library.theme.outline,
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = button_area_outer
	})

	local section_area_outer = library:create('frame', {
		BackgroundColor3 = c3rgb(0, 0, 0),
		BorderSizePixel = 0,
		Position = u2n(0, 5, 0, 41),
		Size = u2n(1, -10, 1, -46),
		Parent = main_inner
	})
	local section_area_inner = library:create('frame', {
		BackgroundColor3 = library.theme.main,
		BorderColor3 = library.theme.outline,
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = section_area_outer
	})

	local title = library:create('text', {
		Position = u2n(0, 5, 0, 0),
		Size = u2n(1, -10, 0, 20),
		Text = title,
		TextColor3 = library.theme.n_text,
		Parent = inner
	})

	local button_layout = library:create('layout', {
		FillDirection = Enum.FillDirection.Horizontal,
		Parent = button_area_inner
	})

	library:draggable(outer)

	-- add to registry
	library:add_to_registry(inner, {
		['BackgroundColor3'] = 'main',
		['BorderColor3'] = 'accent'
	})
	library:add_to_registry(main_outer, {
		['BackgroundColor3'] = 'bg',
		['BorderColor3'] = 'outline',
	})
	library:add_to_registry(main_inner, {
		['BackgroundColor3'] = 'bg',
	})

	library:add_to_registry(button_area_inner, {
		['BackgroundColor3'] = 'bg',
		['BorderColor3'] = 'outline',
	})

	library:add_to_registry(section_area_inner, {
		['BackgroundColor3'] = 'main',
		['BorderColor3'] = 'outline',
	})

	library:add_to_registry(title, {
		['TextColor3'] = 'n_text'
	})



	-- functions
	function menu:toggle()
		library.gui.Enabled = not library.gui.Enabled
	end
	function menu:tab(name)
		local tab = {}

		-- get text bounds
		local size = library:text_bounds(name, 14)

		-- create elements
		local tab_frame = library:create('frame', {
			BackgroundColor3 = library.theme.dark_bg,
			BorderColor3 = library.theme.outline,
			Size = u2n(0, size + 30, 1, 0),
			Parent = button_area_inner
		})
		local tab_title = library:create('text', {
			Size = u2n(1, 0, 1, 0),
			Text = name,
			TextColor3 = library.theme.i_text,
			Parent = tab_frame
		})

		local tab_content_frame = library:create('frame', {
			BackgroundTransparency = 1,
			Size = u2n(1, 0, 1, 0),
			Visible = false,
			Parent = section_area_inner
		})
		local left_side = library:create('frame', {
			BackgroundTransparency = 1,
			Position = u2n(0, 8, 0, 8),
			Size = u2n(.5, -16, 1, -16),
			Parent = tab_content_frame
		})
		local right_side = library:create('frame', {
			BackgroundTransparency = 1,
			Position = u2n(.5, 8, 0, 8),
			Size = u2n(.5, -16, 1, -16),
			Parent = tab_content_frame
		})

		local left_layout = library:create('layout', {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = un(0, 10),
			Parent = left_side
		})

		local right_layout = left_layout:Clone()
		right_layout.Parent	= right_side

		-- add to registry
		library:add_to_registry(tab_frame, {
			['BackgroundColor3'] = 'dark_bg',
			['BorderColor3'] = 'outline'
		})
		library:add_to_registry(tab_title, {
			['TextColor3'] = 'i_text'
		})


		-- functions
		function tab:show()
			for i,v in pairs(menu.tabs) do
				v:hide()
			end

			tab_frame.BackgroundColor3 = library.theme.dark_main
			tab_title.TextColor3 = library.theme.accent

			library.reg[tab_frame].Properties['BackgroundColor3'] = 'dark_main'
			library.reg[tab_title].Properties['TextColor3'] = 'accent'

			tab_content_frame.Visible = true
		end
		function tab:hide()
			tab_frame.BackgroundColor3 = library.theme.dark_bg
			tab_title.TextColor3 = library.theme.i_text

			library.reg[tab_frame].Properties['BackgroundColor3'] = 'dark_bg'
			library.reg[tab_title].Properties['TextColor3'] = 'i_text'

			tab_content_frame.Visible = false
		end
		function tab:section(name, side)
			local section = {}

			local size2 = library:text_bounds(name, 14)

			-- create elements
			local section_outer = library:create('frame', {
				BackgroundColor3 = c3rgb(0, 0, 0),
				BorderSizePixel = 0,
				Size = u2n(1, 0, 0, 50),
				Parent = side == 0 and left_side or right_side
			})
			local section_inner = library:create('frame', {
				BackgroundColor3 = library.theme.bg,
				BorderColor3 = library.theme.outline,
				Position = u2n(0, 1, 0, 1),
				Size = u2n(1, -2, 1, -2),
				ZIndex = 1,
				Parent = section_outer
			})

			local blocker = library:create('frame', {
				BackgroundColor3 = library.theme.main,
				BorderSizePixel = 0,
				Position = u2n(0, 15, 0, -2),
				Size = u2n(0, size2 + 10, 0, 4),
				ZIndex = 3,
				Parent = section_inner
			})
			local accent = library:create('frame', {
				BackgroundColor3 = library.theme.accent,
				BorderSizePixel = 0,
				Position = u2n(0, 1, 0, 1),
				Size = u2n(1, -2, 0, 1),
				ZIndex = 2,
				Parent = section_inner
			})
			local section_title = library:create('text', {
				Position = u2n(0, 20, 0, -1),
				Size = u2n(0, size2, 0, 1),
				Text = name,
				TextColor3 = library.theme.n_text,
				ZIndex = 4,
				Parent = section_inner
			})

			local content = library:create('frame', {
				BackgroundTransparency = 1,
				Position = u2n(0, 5, 0, 10),
				Size = u2n(1, -10, 1, -20),
				Parent = section_inner
			})
			local layout = library:create('layout', {
				Padding = un(0, 3),
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = content
			})

			-- add to registry
			library:add_to_registry(section_inner, {
				['BackgroundColor3'] = 'bg',
				['BorderColor3'] = 'outline'
			})
			library:add_to_registry(blocker, {
				['BackgroundColor3'] = 'main'
			})
			library:add_to_registry(accent, {
				['BackgroundColor3'] = 'accent'
			})
			library:add_to_registry(section_title, {
				['TextColor3'] = 'n_text'
			})


			-- functions
			local function resize()
				section_outer.Size = u2n(1, 0, 0, layout.AbsoluteContentSize.Y + 15)
			end

			function section:seperator(properties)
				local seperator = {}

				-- create elements
				local seperator_frame = library:create('frame', {
					BackgroundTransparency = 1,
					Size = u2n(1, 0, 0, 20),
					Parent = content
				})
				local seperator_accent = library:create('frame', {
					BackgroundColor3 = library.theme.accent,
					BorderSizePixel = 0,
					Position = u2n(0, 0, .5, 0),
					Size = u2n(1, 0, 0, 1),
					Parent = seperator_frame
				})
				local seperator_title = library:create('text', {
					BackgroundTransparency = 0,
					BackgroundColor3 = library.theme.bg,
					BorderSizePixel = 0,
					Position = u2n(.2, 15, 0, -2),
					Size = u2n(0, library:text_bounds(properties.text, 14) + 10, 1, 0),
					Text = properties.text,
					TextColor3 = library.theme.a_text,
					Parent = seperator_frame
				})

				-- add to registry
				library:add_to_registry(seperator_accent, {
					['BackgroundColor3'] = 'accent'
				})
				library:add_to_registry(seperator_title, {
					['BackgroundColor3'] = 'bg',
					['TextColor3'] = 'n_text'
				})

				-- functions
				function seperator:update(new_properties)
					seperator_title.Text = new_properties.text
				end

				-- return
				seperator.Instance = seperator_frame
				return seperator
			end

			library:conn(layout:GetPropertyChangedSignal('AbsoluteContentSize'), resize)
			section.container = content
			setmetatable(section, base)

			-- return
			return section
		end


		library:conn(tab_frame.InputBegan, function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then tab:show() end end)
		if #button_area_inner:GetChildren() == 2 then tab:show() end
		menu.tabs[name] = tab

		-- return
		return tab
	end
	
	library.menu = menu
	return menu
end
function library:custom_window(title, properties)
	local window = {}

	-- create elements
	local outer = library:create('frame', {
		BackgroundColor3 = library.theme.main,
		BorderSizePixel = 0,
		BackgroundTransparency = properties.bt or 0,
		Position = properties.position or u2n(0, 0, 0, 0),
		Size = properties.size or u2n(0, 0, 0, 0),
		ZIndex = 2,
		Parent = library.gui
	})
	local accent = library:create('frame', {
		BackgroundColor3 = library.theme.accent,
		BorderSizePixel = 0,
		Position = u2n(0, 5, 0, 1),
		Size = u2n(1, -10, 0, 1),
		ZIndex = 2,
		Parent = outer
	})
	local content = library:create('frame', {
		BackgroundTransparency = 1,
		Position = u2n(0, 5, 0, 40),
		Size = u2n(1, -10, 1, -45),
		ZIndex = 2,
		Parent = outer
	})
	local title = library:create('text', {
		BackgroundTransparency = 1,
		Position = u2n(0, 5, 0, 5),
		Size = u2n(1, -10, 0, 15),
		Text = title,
		TextColor3 = library.theme.n_text,
		ZIndex = 2,
		Parent = outer
	})
	local layout = library:create('layout', {
		Padding = un(0, 5),
		FillDirection = Enum.FillDirection.Vertical,
		Parent = content
	})

	-- add to registry
	library:add_to_registry(outer, {
		BackgroundColor3 = 'main',
	})
	library:add_to_registry(accent, {
		BackgroundColor3 = 'accent'
	})
	library:create(title, {
		TextColor3 = 'n_text'
	})

	-- functions
	function window:label(title)
		local label = {}

		-- create elements
		local label_instance = library:create('text', {
			Size = u2n(.75, 0, 0, 20),
			Text = title,
			TextColor3 = library.theme.n_text,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 2,
			Parent = content
		})

		outer.Size = u2n(outer.Size.X.Scale, outer.Size.X.Offset, 0, layout.AbsoluteContentSize.Y + 50)

		-- add to registry
		library:add_to_registry(label_instance, {
			['TextColor3'] = 'n_text'
		})

		-- return
		label.Instance = label_instance
		setmetatable(label, special)
		return label
	end

	-- return
	window.Instance = outer
	return window
end
function library:notification(title, text, duration)
	-- create elements --
	if not library.na then
		library.na = library:create('frame', { 
			BackgroundTransparency = 1, 
			Position = u2n(1, -275, 0, -34), 
			Size = u2n(0, 275, 1, 32),
			ZIndex = 3,
			Parent = library.gui
		})
		library:create('layout', {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Parent = library.na
		})
	end

	local notification_outer = library:create('frame', {
		BackgroundColor3 = c3rgb(0, 0, 0),
		BorderSizePixel = 0,
		Size = u2n(1, 0, 0, 0),
		ClipsDescendants = true,
		Parent = library.na
	})
	local notification_inner = library:create('frame', {
		BackgroundColor3 = library.theme.main,
		BorderColor3 = library.theme.accent,
		BorderMode = Enum.BorderMode.Inset,
		Position = u2n(0, 1, 0, 1),
		Size = u2n(1, -2, 1, -2),
		Parent = notification_outer
	})
	local notification_title = library:create('text', {
		Position = u2n(0, 3, 0, 0),
		Size = u2n(1, -6, 0, 25),
		Text = title,
		TextColor3 = library.theme.accent,
		Parent = notification_inner
	})
	local notification_text = library:create('text', {
		Position = u2n(0, 3, 0, 25),
		Size = u2n(1, -6, 0, 40),
		Text = text,
		TextColor3 = library.theme.n_text,
		Parent = notification_inner
	})
	local progress_bar = library:create('frame', {
		BackgroundColor3 = library.theme.n_text,
		BorderSizePixel = 0,
		Position = u2n(0, 5, 0, 2),
		Size = u2n(0, 0, 0, 1),
		Parent = notification_inner
	})

	-- add to registry
	library:add_to_registry(notification_inner, {
		['BackgroundColor3'] = 'main',
		['BorderColor3'] = 'accent'
	})
	library:add_to_registry(notification_title, {
		['TextColor3'] = 'accent'
	})
	library:add_to_registry(notification_text, {
		['TextColor3'] = 'n_text'
	})
	library:add_to_registry(progress_bar, {
		['BackgroundColor3'] = 'n_text'
	})

	-- functions
	local t = game.TweenService:Create(notification_outer, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = u2n(1, 0, 0, 75) })
	t:Play()
	t.Completed:Wait()

	local t2 = game.TweenService:Create(progress_bar, TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), { Size = u2n(1, -10, 0, 1) })
	t2:Play()
	t2.Completed:Wait()

	local t3 = game.TweenService:Create(notification_outer, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = u2n(1, 0, 0, 0) })
	t3:Play()
	t3.Completed:Wait()
	notification_outer:Destroy()
end

_G.Sentra = library
return library
