--[[
	author: treythehot
	github: https://github.com/Trey13542
--]]

--< Create Elements >--
local ModuleViewer = Instance.new("ScreenGui")

local OpenFrame = Instance.new("Frame")
local OpenButton = Instance.new("TextButton")

local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")

local Header = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("ImageButton")
local MinimizeButton = Instance.new("TextButton")

local ScriptValueFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local ScriptPathBox = Instance.new("TextBox")
local ModulePathBox = Instance.new("TextBox")

--< Set Elements >--
ModuleViewer.Name = "ModuleViewer"
ModuleViewer.Parent = game.CoreGui
ModuleViewer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

OpenFrame.Name = "Open"
OpenFrame.Parent = ModuleViewer
OpenFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OpenFrame.BackgroundTransparency = 1.000
OpenFrame.Size = UDim2.new(0, 35, 0, 25)

OpenButton.Name = "OpenButton"
OpenButton.Parent = OpenFrame
OpenButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OpenButton.BackgroundTransparency = 1.000
OpenButton.Size = UDim2.new(0, 35, 0, 25)
OpenButton.AutoButtonColor = false
OpenButton.Font = Enum.Font.Code
OpenButton.Text = "Open"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.TextSize = 15.000
OpenButton.TextStrokeTransparency = 0.000
OpenButton.TextTransparency = 1.000

Main.Name = "Main"
Main.Parent = ModuleViewer
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0, 0, 0, 0)
Main.Size = UDim2.new(0, 500, 0, 450)
Main.Active = true
Main.Draggable = true

Header.Name = "Header"
Header.Parent = Main
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Header.Size = UDim2.new(1, 0, 0, 25)

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Header

Title.Name = "Title"
Title.Parent = Header
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 5, 0, 0)
Title.Size = UDim2.new(1, -25, 0, 25)
Title.Font = Enum.Font.Code
Title.Text = "Trey's Script Viewer"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20.000
Title.TextStrokeTransparency = 0.000

CloseButton.Name = "CloseButton"
CloseButton.Parent = Header
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.Position = UDim2.new(1, -25, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.AutoButtonColor = false
CloseButton.Image = "rbxassetid://3926305904"
CloseButton.ImageRectOffset = Vector2.new(283, 4)
CloseButton.ImageRectSize = Vector2.new(25, 25)

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = Header
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Position = UDim2.new(1, -50, 0, 0)
MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
MinimizeButton.AutoButtonColor = false
MinimizeButton.Font = Enum.Font.Code
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 15.000
MinimizeButton.TextStrokeTransparency = 0.000

ScriptValueFrame.Name = "ScriptValues"
ScriptValueFrame.Parent = Main
ScriptValueFrame.Active = true
ScriptValueFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptValueFrame.BackgroundTransparency = 1.000
ScriptValueFrame.BorderSizePixel = 0
ScriptValueFrame.Position = UDim2.new(0, 5, 0, 30)
ScriptValueFrame.Size = UDim2.new(1, -10, 1, -100)
ScriptValueFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScriptValueFrame.ScrollBarThickness = 5

UIListLayout.Parent = ScriptValueFrame
UIListLayout.SortOrder = Enum.SortOrder.Name
UIListLayout.Padding = UDim.new(0, 5)

ScriptPathBox.Name = "ScriptPathBox"
ScriptPathBox.Parent = Main
ScriptPathBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ScriptPathBox.Position = UDim2.new(0, 0, 1, -65)
ScriptPathBox.Size = UDim2.new(1, 0, 0, 30)
ScriptPathBox.Font = Enum.Font.Code
ScriptPathBox.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
ScriptPathBox.PlaceholderText = "Script Path"
ScriptPathBox.Text = ""
ScriptPathBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptPathBox.TextSize = 12.000
ScriptPathBox.TextStrokeTransparency = 0.000
ScriptPathBox.ClearTextOnFocus = false

ModulePathBox.Name = "ModulePathBox"
ModulePathBox.Parent = Main
ModulePathBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ModulePathBox.Position = UDim2.new(0, 0, 1, -30)
ModulePathBox.Size = UDim2.new(1, 0, 0, 30)
ModulePathBox.Font = Enum.Font.Code
ModulePathBox.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
ModulePathBox.PlaceholderText = "Module Path"
ModulePathBox.Text = ""
ModulePathBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ModulePathBox.TextSize = 12.000
ModulePathBox.TextStrokeTransparency = 0.000
ModulePathBox.ClearTextOnFocus = false

UICorner:Clone().Parent = OpenButton
UICorner:Clone().Parent = CloseButton
UICorner:Clone().Parent = MinimizeButton
UICorner:Clone().Parent = Main
UICorner:Clone().Parent = ScriptPathBox
UICorner:Clone().Parent = ModulePathBox

--< Scripts >--
local lastScriptPath = ScriptPathBox.Text
local lastModulePath = ModulePathBox.Text
local WatchingFunctions = {}
local PrevPos, PrevSize

local Conn
Conn = game:GetService('RunService').Heartbeat:Connect(function() -- Constantly update script
	if game:GetService('UserInputService'):GetFocusedTextBox() == nil then
		RedoValues()
	end
end)

function ResetStuff(which)
	if which == 'module' then lastModulePath = ModulePathBox.Text
	elseif which == 'script' then lastScriptPath = ScriptPathBox.Text end
	for i,v in pairs(ScriptValueFrame:GetChildren()) do
		if v:IsA('TextLabel') or v:IsA('TextBox') then 
			v:Destroy() 
		end
	end
	ScriptValueFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	local s = loadstring('return ' .. ScriptPathBox.Text)()
	if s ~= nil then
		local f = nil
		if s.ClassName == 'LocalScript' then f = getsenv(s)
		elseif s.ClassName == 'ModuleScript' then f = require(s) end
		return s,f
	end
	return nil
end

function DoScriptStuff()
	local s,f = ResetStuff('script')
	if s ~= nil and f ~= nil then
		for i,v in pairs(f) do
			CreateTB(i, tostring(v), f, type(v))
		end	
	end
end
function DoModuleStuff()
	local s,f = ResetStuff('module')
	if s ~= nil and f ~= nil then
		local args = ModulePathBox.Text:split('.') -- not perfect as sometimes names have a . in them :(
		if f[args[1]] ~= nil then
			for i,v in pairs(args) do
				f = f[v]
			end
			for i,v in pairs(f) do
				CreateTB(i, tostring(v), f, type(v))
			end
		end
	end
end
function RedoValues()
	local s,f

	if ScriptPathBox.Text ~= "" then
		s = loadstring('return ' .. ScriptPathBox.Text)()
		if s.ClassName == 'LocalScript' then f = getsenv(s)
		elseif s.ClassName == 'ModuleScript' then f = require(s) end
	end

	if ModulePathBox.Text ~= "" then
		if s and f then
			local args = ModulePathBox.Text:split('.') -- not perfect as sometimes names have a . in them :(
			if f[args[1]] ~= nil then
				for i,v in pairs(args) do
					f = f[v]
				end
				for i,v in pairs(ScriptValueFrame:GetChildren()) do
					if v:IsA('TextLabel') then
						v[v.Name].Text = tostring(f[v.Name])
					end
				end
			end
		end
	else
		if s and f then
			for i,v in pairs(ScriptValueFrame:GetChildren()) do
				if v:IsA('TextLabel') then
					v[v.Name].Text = tostring(f[v.Name])
				end
			end
		end
	end
end

function CreateTB(name, value, script, type)
	local ValueName = Instance.new('TextLabel')
	local ValueTB = Instance.new("TextBox")

	ValueName.Name = name
	ValueName.Parent = ScriptValueFrame
	ValueName.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	ValueName.BorderSizePixel = 0
	ValueName.Size = UDim2.new(.5, 0, 0, 25)
	ValueName.Text = name
	ValueName.TextSize = 15.000
	ValueName.TextColor3 = Color3.fromRGB(255, 255, 255)
	ValueName.Font = Enum.Font.Code
	ValueName.TextStrokeTransparency = 0.000
	ValueName.TextXAlignment = Enum.TextXAlignment.Left

	ValueTB.Name = name
	ValueTB.Parent = ValueName
	ValueTB.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	ValueTB.BorderSizePixel = 0
	ValueTB.Position = UDim2.new(1, 0, 0, 0)
	ValueTB.Size = UDim2.new(1, 0, 0, 25)
	ValueTB.Text = value
	ValueTB.TextSize = 15.000
	ValueTB.TextColor3 = Color3.fromRGB(255, 255, 255)
	ValueTB.TextWrapped = true
	ValueTB.Font = Enum.Font.Code
	ValueTB.TextStrokeTransparency = 0.000
	ValueTB.TextXAlignment = Enum.TextXAlignment.Left
	ValueTB.ClearTextOnFocus = false

	UICorner:Clone().Parent = ValueName
	UICorner:Clone().Parent = ValueTB

	ValueName.InputBegan:Connect(function(key)
		if key.UserInputType == Enum.UserInputType.MouseButton1 then
			if string.find(ValueTB.Text, 'table') then
				if ModulePathBox.Text == "" then ModulePathBox.Text = ModulePathBox.Text .. ValueName.Text
				else ModulePathBox.Text = ModulePathBox.Text .. '.' .. ValueName.Text end
				DoModuleStuff()
			elseif string.find(ValueTB.Text, 'function') then
				if WatchingFunctions[name] == nil then
					WatchingFunctions[name] = true
					warn('Started Watching Function ' .. name)

					Old = hookfunction(script[name], function(...) Stuff(...) end)
					function Stuff(...)
						if WatchingFunctions[name] then
							warn(name .. ' function was called. Args: ', unpack({...}))
						end
						return Old(...)
					end
				else
					WatchingFunctions[name] = not WatchingFunctions[name]
					if WatchingFunctions[name] then print('Started Watching Function ' .. name)	
					else warn('Stopped Watching Function' .. name) end
				end
			end
		end
	end)
	ValueTB.FocusLost:Connect(function()
		if type == "boolean" then script[name] = ValueTB.Text == "true"
		elseif type == "string" then script[name] = tostring(ValueTB.Text)
		elseif type == "number" then script[name] = tonumber(ValueTB.Text)
		elseif type == "function" then print('Cant edit function, click name to make it nil.')
		else print('Unknown Type.') end
	end)
end

local function DoOpenStuff()
	ScriptValueFrame.Visible = true
	game.TweenService:Create(OpenFrame.OpenButton, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
	game.TweenService:Create(OpenFrame.OpenButton, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
	game.TweenService:Create(Main, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = PrevSize}):Play()
	game.TweenService:Create(Main, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = PrevPos}):Play()
	wait(.5)

	for i,v in pairs(Main:GetDescendants()) do
		if v:IsA('TextButton') then
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		elseif v:IsA('ImageButton') then
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
		elseif v:IsA('Frame') then
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
		elseif v:IsA('TextLabel') then
			if v.Name ~= 'Title' then game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play() end
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		elseif v:IsA('TextBox') then
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		end
	end
end
OpenButton.MouseButton1Click:Connect(function()
	DoOpenStuff()
end)
CloseButton.MouseButton1Click:Connect(function()
	if Main.Size ~= UDim2.new(0,0,0,0) then
		ModuleViewer:Destroy()
		Conn:Disconnect()
	else
		DoOpenStuff()
	end
end)
MinimizeButton.MouseButton1Click:Connect(function()
	PrevPos = Main.Position
	PrevSize = Main.Size

	for i,v in pairs(Main:GetDescendants()) do
		if v:IsA('TextButton') then
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
		elseif v:IsA('ImageButton') then
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
		elseif v:IsA('Frame') then
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
		elseif v:IsA('TextLabel') then
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
		elseif v:IsA('TextBox') then
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
			game.TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
		end
	end

	game.TweenService:Create(Main, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,0,0,0)}):Play()
	game.TweenService:Create(Main, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0, 0)}):Play()
	ScriptValueFrame.Visible = false
	wait(.5)
	OpenFrame.Position = UDim2.new(.5, -20, 0, -10)
	game.TweenService:Create(OpenFrame.OpenButton, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
	game.TweenService:Create(OpenFrame.OpenButton, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
	wait(.5)
end)
ScriptValueFrame.ChildAdded:Connect(function()
	ScriptValueFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 30)
end)
ScriptPathBox.FocusLost:Connect(function()
	if lastScriptPath ~= ScriptPathBox.Text then
		DoScriptStuff()
	end
end)
ModulePathBox.FocusLost:Connect(function()
	if ModulePathBox.Text == "" and ScriptPathBox.Text ~= "" then
		lastModulePath = ModulePathBox.Text
		DoScriptStuff()
	elseif lastModulePath ~= ModulePathBox.Text and ScriptPathBox.Text ~= "" then
		DoModuleStuff()
	end
end)
