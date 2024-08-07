--[[
	author: treythehot
	github: https://github.com/Trey13542
--]]

--< Create Elements >--
local RemoteFrameBG = Instance.new("Frame")
local Remotes = Instance.new("ScrollingFrame")
local CodeFrameBG = Instance.new("Frame")
local Code = Instance.new("ScrollingFrame")

local RemoteSpy = Instance.new("ScreenGui")

local Main = Instance.new("Frame")
local RemoteTitle = Instance.new("TextLabel")
local CodeTitle = Instance.new("TextLabel")
local CodeButtonsTitle = Instance.new("TextLabel")

local Header = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("ImageButton")
local MinimizeButton = Instance.new("TextButton")
local EnabledFrame = Instance.new("Frame")

local RemoteFrameBG = Instance.new("Frame")
local Remotes = Instance.new("ScrollingFrame")

local CodeFrameBG = Instance.new("Frame")
local Code = Instance.new("ScrollingFrame")

local CodeButtons = Instance.new("Frame")
local CopyButton = Instance.new("TextButton")
local ExecuteButton = Instance.new("TextButton")
local ClearButton = Instance.new("TextButton")
local BlacklistButton = Instance.new("TextButton")
local ClearBlacklistButton = Instance.new("TextButton")
local GenerateLoopButton = Instance.new("TextButton")

local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")

--< Set Elements >--
RemoteSpy.Name = "RemoteSpy"
RemoteSpy.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
RemoteSpy.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = RemoteSpy
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.Position = UDim2.new(0, 50, 0, 50)
Main.Size = UDim2.new(0, 400, 0, 300)
Main.Active = true
Main.Draggable = true

RemoteTitle.Name = "RemoteTitle"
RemoteTitle.Parent = Main
RemoteTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RemoteTitle.BackgroundTransparency = 1.000
RemoteTitle.BorderSizePixel = 0
RemoteTitle.Position = UDim2.new(0, 30, 0, 20)
RemoteTitle.Size = UDim2.new(0, 75, 0, 30)
RemoteTitle.Font = Enum.Font.Gotham
RemoteTitle.Text = "Remotes"
RemoteTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
RemoteTitle.TextSize = 15.000
RemoteTitle.TextStrokeTransparency = 0.000

CodeTitle.Name = "CodeTitle"
CodeTitle.Parent = Main
CodeTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CodeTitle.BackgroundTransparency = 1.000
CodeTitle.BorderSizePixel = 0
CodeTitle.Position = UDim2.new(0, 230, 0, 20)
CodeTitle.Size = UDim2.new(0, 75, 0, 30)
CodeTitle.Font = Enum.Font.Gotham
CodeTitle.Text = "Code"
CodeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
CodeTitle.TextSize = 15.000
CodeTitle.TextStrokeTransparency = 0.000

CodeButtonsTitle.Name = "CodeButtonsTitle"
CodeButtonsTitle.Parent = Main
CodeButtonsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CodeButtonsTitle.BackgroundTransparency = 1
CodeButtonsTitle.BorderSizePixel = 0
CodeButtonsTitle.Position = UDim2.new(0, 230, 0, 188)
CodeButtonsTitle.Size = UDim2.new(0, 75, 0, 30)
CodeButtonsTitle.Font = Enum.Font.Gotham
CodeButtonsTitle.Text = "Code Buttons"
CodeButtonsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
CodeButtonsTitle.TextSize = 15
CodeButtonsTitle.TextStrokeTransparency = 0

Header.Name = "Header"
Header.Parent = Main
Header.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Header.Size = UDim2.new(1, 0, 0, 25)

Title.Name = "Title"
Title.Parent = Header
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 29, 0, 0)
Title.Size = UDim2.new(0, 221, 0, 28)
Title.Font = Enum.Font.Gotham
Title.Text = "Trey's RemoteSpy"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15.000
Title.TextStrokeTransparency = 0.000
Title.TextXAlignment = Enum.TextXAlignment.Left

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
MinimizeButton.Font = Enum.Font.Gotham
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 15.000

EnabledFrame.Name = "EnabledFrame"
EnabledFrame.Parent = Header
EnabledFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
EnabledFrame.Size = UDim2.new(0, 20, 0, 25)

RemoteFrameBG.Name = "RemoteFrameBG"
RemoteFrameBG.Parent = Main
RemoteFrameBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
RemoteFrameBG.Position = UDim2.new(0, 5, 0, 45)
RemoteFrameBG.Size = UDim2.new(0, 125, 0, 250)

Remotes.Name = "Remotes"
Remotes.Parent = RemoteFrameBG
Remotes.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Remotes.BackgroundTransparency = 1.000
Remotes.BorderSizePixel = 0
Remotes.Size = UDim2.new(1, 0, 1, 0)
Remotes.CanvasSize = UDim2.new(0, 0, 0, 0)
Remotes.ScrollBarThickness = 5

CodeFrameBG.Name = "CodeFrameBG"
CodeFrameBG.Parent = Main
CodeFrameBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CodeFrameBG.Position = UDim2.new(0, 150, 0, 45)
CodeFrameBG.Size = UDim2.new(0, 244, 0, 150)

Code.Name = "Code"
Code.Parent = CodeFrameBG
Code.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Code.BackgroundTransparency = 1
Code.BorderSizePixel = 0
Code.Size = UDim2.new(1, 0, 1, 0)
Code.CanvasSize = UDim2.new(0, 0, 0, 0)
Code.ScrollBarThickness = 5
Code.ScrollingDirection = Enum.ScrollingDirection.XY

CodeButtons.Name = "CodeButtons"
CodeButtons.Parent = Main
CodeButtons.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CodeButtons.Position = UDim2.new(0, 150, 0, 210)
CodeButtons.Size = UDim2.new(0, 244, 0, 85)

CopyButton.Name = "CopyButton"
CopyButton.Parent = CodeButtons
CopyButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
CopyButton.Size = UDim2.new(0, 80, 0, 25)
CopyButton.Font = Enum.Font.Gotham
CopyButton.Text = "Copy"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 15.000
CopyButton.TextStrokeTransparency = 0.000

ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = CodeButtons
ExecuteButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
ExecuteButton.Position = UDim2.new(0, 81, 0, 0)
ExecuteButton.Size = UDim2.new(0, 80, 0, 25)
ExecuteButton.Font = Enum.Font.Gotham
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 15.000
ExecuteButton.TextStrokeTransparency = 0.000

ClearButton.Name = "ClearButton"
ClearButton.Parent = CodeButtons
ClearButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
ClearButton.Position = UDim2.new(0, 162, 0, 0)
ClearButton.Size = UDim2.new(0, 81, 0, 25)
ClearButton.Font = Enum.Font.Gotham
ClearButton.Text = "Clear"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.TextSize = 15.000
ClearButton.TextStrokeTransparency = 0.000

BlacklistButton.Name = "BlacklistButton"
BlacklistButton.Parent = CodeButtons
BlacklistButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
BlacklistButton.Position = UDim2.new(0, 0, 0, 30)
BlacklistButton.Size = UDim2.new(0, 80, 0, 25)
BlacklistButton.Font = Enum.Font.Gotham
BlacklistButton.Text = "Blacklist"
BlacklistButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BlacklistButton.TextSize = 15.000
BlacklistButton.TextStrokeTransparency = 0.000

ClearBlacklistButton.Name = "ClearBlacklistButton"
ClearBlacklistButton.Parent = CodeButtons
ClearBlacklistButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
ClearBlacklistButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
ClearBlacklistButton.Position = UDim2.new(0, 81, 0, 30)
ClearBlacklistButton.Size = UDim2.new(0, 80, 0, 25)
ClearBlacklistButton.Font = Enum.Font.Gotham
ClearBlacklistButton.Text = "Clear Blacklist"
ClearBlacklistButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearBlacklistButton.TextSize = 10.000
ClearBlacklistButton.TextStrokeTransparency = 0.000

GenerateLoopButton.Name = "GenerateLoopButton"
GenerateLoopButton.Parent = CodeButtons
GenerateLoopButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
GenerateLoopButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
GenerateLoopButton.Position = UDim2.new(0, 162, 0, 30)
GenerateLoopButton.Size = UDim2.new(0, 81, 0, 25)
GenerateLoopButton.Font = Enum.Font.Gotham
GenerateLoopButton.Text = "Generate Loop"
GenerateLoopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GenerateLoopButton.TextSize = 12.000
GenerateLoopButton.TextStrokeTransparency = 0.000

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Main
UICorner:Clone().Parent = Header
UICorner:Clone().Parent = CloseButton
UICorner:Clone().Parent = MinimizeButton
UICorner:Clone().Parent = EnabledFrame
UICorner:Clone().Parent = RemoteFrameBG
UICorner:Clone().Parent = CodeFrameBG
UICorner:Clone().Parent = CodeButtons
UICorner:Clone().Parent = CopyButton
UICorner:Clone().Parent = ExecuteButton
UICorner:Clone().Parent = ClearButton
UICorner:Clone().Parent = BlacklistButton
UICorner:Clone().Parent = ClearBlacklistButton

UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.Parent = Remotes
UIListLayout:Clone().Parent = Code

--< Functions >--
local Depth = 0
local PrevFocused = nil
local Blacklist = {}

local PrevArgs = {}
local PrevFullPath = nil

local function IterateThroughTable(TableToCheck, TableToInsert, Remote, Type)
	local function Iterate(Table)
		local spaceAmount = '  '
		for i=1,Depth do
			spaceAmount = spaceAmount .. '  '
		end

		for Index,Value in pairs(Table) do
			if type(Value) == 'table' then
				Depth = Depth + 1
				table.insert(TableToInsert, ('%s[%s] = {'):format(spaceAmount,tostring(Index)))
				Iterate(Value)
				table.insert(TableToInsert, ('%s},'):format(spaceAmount))
				Depth = Depth - 1
			else
				local Index_Fixed = tostring(Index)
				if typeof(Index) == 'string' then Index_Fixed = "'"..tostring(Index).."'" end

				if typeof(Value) == 'Instance' then
					table.insert(TableToInsert, ("%s[%s] = '%s', "):format(spaceAmount,Index_Fixed,Value:GetFullName()))
				elseif typeof(Value) == 'string' then
					table.insert(TableToInsert, ("%s[%s] = '%s', "):format(spaceAmount,Index_Fixed,Value))
				else
					table.insert(TableToInsert, ('%s[%s] = %s, '):format(spaceAmount,Index_Fixed,tostring(Value)))
				end
			end
		end
	end

	table.insert(TableToInsert, 'local Args = {')
	Iterate(TableToCheck)
	table.insert(TableToInsert, '}')
	table.insert(TableToInsert, 'game.' .. Remote:GetFullName() .. ':' .. Type .. '(unpack(Args))')
end
local function AddCodeLine(Index, CodeLine)
	--< Create Elements >--
	local NumberLabel = Instance.new('TextLabel')
	local CodeLabel = Instance.new('TextLabel')

	--< Set Elements >--
	NumberLabel.Name = "NumberLabel"
	NumberLabel.Parent = Code
	NumberLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NumberLabel.BackgroundTransparency = 1.000
	NumberLabel.BorderSizePixel = 0
	NumberLabel.Size = UDim2.new(0, 10, 0, 10)
	NumberLabel.Font = Enum.Font.Gotham
	NumberLabel.Text = tostring(Index)
	NumberLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	NumberLabel.TextSize = 15.000
	NumberLabel.TextStrokeTransparency = 0.000

	CodeLabel.Name = "CodeLabel"
	CodeLabel.Parent = NumberLabel
	CodeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CodeLabel.BackgroundTransparency = 1.000
	CodeLabel.Position = UDim2.new(1, 10, 0, 0)
	CodeLabel.Size = UDim2.new(0, 99999, 0, 10)
	CodeLabel.Font = Enum.Font.Gotham
	CodeLabel.Text = tostring(CodeLine)
	CodeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	CodeLabel.TextSize = 15.000
	CodeLabel.TextStrokeTransparency = 0.000
	CodeLabel.TextXAlignment = Enum.TextXAlignment.Left
end
local function AddRemote(Remote, Method, Args)
	local RemoteName = tostring(Remote)
	--< Create Elements >--
	local RemoteButton = Instance.new('TextButton')
	local UICorner = Instance.new('UICorner')

	--< Set Elements >--
	RemoteButton.Name = RemoteName .. 'Button'
	RemoteButton.Parent = Remotes
	if Method == 'FireServer' then RemoteButton.BackgroundColor3 = Color3.fromRGB(150, 150, 0)
	elseif Method == 'InvokeServer' then RemoteButton.BackgroundColor3 = Color3.fromRGB(150, 0, 150) end
	RemoteButton.Size = UDim2.new(0, 120, 0, 25)
	RemoteButton.AutoButtonColor = false
	RemoteButton.Font = Enum.Font.Gotham
	RemoteButton.Text = RemoteName
	RemoteButton.TextColor3 = Color3.fromRGB(200, 200, 200)
	RemoteButton.TextScaled = true
	RemoteButton.TextStrokeTransparency = 0.000

	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = RemoteButton

	--< Functions >--
	local function ChangeColors()
		if RemoteButton ~= PrevFocused then
			if PrevFocused ~= nil then
				local nc = Color3.fromRGB(150, 150, 0)
				if PrevFocused.BackgroundColor3 == Color3.fromRGB(255, 0, 255) then nc = Color3.fromRGB(150, 0, 150) end

				PrevFocused.TextColor3 = Color3.fromRGB(200,200,200)
				PrevFocused.BackgroundColor3 = nc
			end

			local nc = Color3.fromRGB(255, 255, 0)
			if RemoteButton.BackgroundColor3 == Color3.fromRGB(150, 0, 150) then nc = Color3.fromRGB(255, 0, 255) end

			RemoteButton.TextColor3 = Color3.fromRGB(255,255,255)
			RemoteButton.BackgroundColor3 = nc
			PrevFocused = RemoteButton
		end
	end
	RemoteButton.MouseButton1Click:Connect(function()
		for i,v in pairs(Code:GetChildren()) do if v:IsA('TextLabel') then v:Destroy() end end

		local Poo = {}
		IterateThroughTable(Args, Poo, Remote, Method)
		for i=1,#Poo do
			AddCodeLine(i, Poo[i])
		end

		PrevArgs = Args
		PrevFullPath = Remote:GetFullName()

		ChangeColors()
	end)
end

CloseButton.MouseButton1Click:Connect(function()
	RemoteSpy:Destroy()
end)
MinimizeButton.MouseButton1Click:Connect(function()
	local function DoStuffToElements(Option)
		local NumOption = 0
		if Option == false then NumOption = 1 end

		for i,v in pairs(Main:GetDescendants()) do
			if v:IsA('TextLabel') then
				v.TextTransparency = NumOption
			elseif v:IsA('Frame') and v ~= Main and v ~= Header and v ~= EnabledFrame then
				game.TweenService:Create(v, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = NumOption}):Play()
			elseif v:IsA('ScrollingFrame') then
				coroutine.wrap(function()
					if Option == false then wait(.01)
					else wait(.3) end
					v.Visible = Option
				end)()
			elseif v:IsA('TextButton') and v ~= MinimizeButton then
				v.Visible = Option
			end
		end
	end

	if Main.Size.X.Offset ~= 0 and Main.Size.X.Offset ~= 100 then
		DoStuffToElements(false)

		game.TweenService:Create(Header, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 100, 0, 25)}):Play()
		game.TweenService:Create(Main, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}):Play()
		wait(.2)
		Main.BackgroundTransparency = 1
		wait(.3)
		Main.Size = UDim2.new(0, 100, 0, 25)
	else
		DoStuffToElements(true)

		Main.Size = UDim2.new(0, 0, 0, 0)
		Main.BackgroundTransparency = 0
		game.TweenService:Create(Header, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 400, 0, 25)}):Play()
		game.TweenService:Create(Main, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 400, 0, 300)}):Play()
		wait(.5)
	end
end)
EnabledFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		if EnabledFrame.BackgroundColor3 == Color3.fromRGB(90,90,90) then
			game.TweenService:Create(EnabledFrame, TweenInfo.new(.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0,255,0)}):Play()
		else
			game.TweenService:Create(EnabledFrame, TweenInfo.new(.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(90,90,90)}):Play()
		end
	end
end)

CopyButton.MouseButton1Click:Connect(function()
	if PrevFocused ~= nil then
		local str = ''

		for i,v in pairs(Code:GetChildren()) do
			if v:IsA('TextLabel') then
				str = str .. v.CodeLabel.Text .. '\n'
			end
		end

		setclipboard(str)
	end
end)
ExecuteButton.MouseButton1Click:Connect(function()
	if PrevFocused ~= nil and PrevFullPath ~= nil then
		local r = loadstring('return ' .. ('game.%s'):format(PrevFullPath))()

		if PrevFocused.BackgroundColor3 == Color3.fromRGB(255, 0, 255) then
			r:InvokeServer(unpack(PrevArgs))
		elseif PrevFocused.BackgroundColor3 == Color3.fromRGB(255, 255, 0) then
			r:FireServer(unpack(PrevArgs))
		end
	end
end)
ClearButton.MouseButton1Click:Connect(function()
	for i,v in pairs(Remotes:GetChildren()) do if v:IsA('TextButton') then v:Destroy() end end
	for i,v in pairs(Code:GetChildren()) do if v:IsA('TextLabel') then v:Destroy() end end
	Remotes.CanvasSize = UDim2.new(0, 0, 0, 0)
	Code.CanvasSize = UDim2.new(0, 0, 0, 0)
	PrevFocused = nil
	PrevFullPath = nil
	PrevArgs = {}
end)
BlacklistButton.MouseButton1Click:Connect(function()
	table.insert(Blacklist, PrevFocused.Text)
end)
ClearBlacklistButton.MouseButton1Click:Connect(function()
	Blacklist = {}
end)
GenerateLoopButton.MouseButton1Click:Connect(function()
	if PrevFocused ~= nil then
		local str = ''
		local children = Code:GetChildren()

		for i=1,#children-1 do
			if children[i].ClassName == 'TextLabel' then
				str = str .. children[i].CodeLabel.Text .. '\n'
			end
		end

		str = str .. 'while wait() do\n'
		str = str .. '\t' .. children[#children].CodeLabel.Text .. '\n'
		str = str .. 'end'

		setclipboard(str)
	end
end)

Remotes.ChildAdded:Connect(function()
	Remotes.CanvasSize = UDim2.new(0, 0, 0, Remotes.UIListLayout.AbsoluteContentSize.Y + 30)
end)
Code.ChildAdded:Connect(function()
	local n = 0
	for i,v in pairs(Code:GetChildren()) do
		if v:IsA('TextLabel') then
			local b = v:WaitForChild('CodeLabel').TextBounds.X
			if b > n then n = b end
		end
	end

	Code.CanvasSize = UDim2.new(0, n + 20, 0, Code.UIListLayout.AbsoluteContentSize.Y + 30)
end)

local Old
Old = hookmetamethod(game, '__namecall', function(Self, ...)
	local Method = tostring(getnamecallmethod())
	local Args = {...}
	if Method == 'FireServer' or Method == 'InvokeServer' then
		if EnabledFrame.BackgroundColor3 == Color3.fromRGB(0, 255, 0) and table.find(Blacklist, tostring(Self)) == nil then
			AddRemote(Self, Method, Args)
			return Old(Self, ...)
		end
	end
	return Old(Self, ...)
end)
