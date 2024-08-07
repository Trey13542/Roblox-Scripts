--[[
	author: treythehot
	github: https://github.com/Trey13542
--]]

--< Variables >--
local Players = game:GetService('Players')

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CurrentCamera = workspace.CurrentCamera

Settings = {
	Visual = {
		Nametags = false,
		Tracers = false,
		Chams = false,
		Skeletons = false,
		Box3D = false,
	},
	Colors = {
		TeamMainColor = Color3.fromRGB(25,25,200),
		TeamMainOutline = Color3.fromRGB(50,50,255),
		TeamMainFill = Color3.fromRGB(0,0,0),

		EnemyMainColor = Color3.fromRGB(200,75,75),
		EnemyMainOutline = Color3.fromRGB(255,100,100),
		EnemyMainFill = Color3.fromRGB(0,0,0),
	},
	DrawingObjects = {},
	Normal = {},
	Connections = {},
}
local Destroyed = false

--< Get Library >--
local library = loadstring(game:HttpGet("https://pastebin.com/raw/db4qGmB5"))()

--< Create Window >--
local window = library:CreateWindow("Esp")

--< Create Tabs >--
local VisualsTab = window:CreateTab("Visuals")
local SettingsTab = window:CreateTab("Settings")

--< Visuals Tab >--
VisualsTab:CreateToggle('Nametags', false, function(Val) Settings.Visual.Nametags = Val end)
VisualsTab:CreateToggle('Tracers', false, function(Val) Settings.Visual.Tracers = Val end)
VisualsTab:CreateToggle('Chams', false, function(Val) Settings.Visual.Chams = Val end)
VisualsTab:CreateToggle('Skeletons', false, function(Val) Settings.Visual.Skeletons = Val end)
VisualsTab:CreateToggle('3D Box', false, function(Val) Settings.Visual.Box3D = Val end)

--< Settings Tab >--
SettingsTab:CreateKeybind("Toggle Menu", "RightAlt", function() window:ToggleWindow() end)
SettingsTab:CreateColor('Team Main Color', Settings.Colors.TeamMainColor, function(Val) Settings.Colors.TeamMainColor = Val end)
SettingsTab:CreateColor('Team Main Fill', Settings.Colors.TeamMainFill, function(Val) Settings.Colors.TeamMainFill = Val end)
SettingsTab:CreateColor('Team Main Outline', Settings.Colors.TeamMainOutline, function(Val) Settings.Colors.TeamMainOutline = Val end)
SettingsTab:CreateColor('Enemy Main Color', Settings.Colors.EnemyMainColor, function(Val) Settings.Colors.EnemyMainColor = Val end)
SettingsTab:CreateColor('Enemy Main Fill', Settings.Colors.EnemyMainFill, function(Val) Settings.Colors.EnemyMainFill = Val end)
SettingsTab:CreateColor('Enemy Main Outline', Settings.Colors.EnemyMainOutline, function(Val) Settings.Colors.EnemyMainOutline = Val end)

--< Visual Functions >--
local function CreateLine()
	local NewLine = Drawing.new('Line')
	NewLine.Color = Color3.fromRGB(255, 255, 255)
	NewLine.Thickness = 1
	NewLine.From = Vector2.new(0, 0)
	NewLine.To = Vector2.new(1, 1)
	NewLine.Visible = false
	table.insert(Settings.DrawingObjects, NewLine)
	return NewLine
end
local function CreateText()
	local NewText = Drawing.new('Text')
	NewText.Size = 15
	NewText.Outline = true
	NewText.Center = true
	NewText.Visible = false
	table.insert(Settings.DrawingObjects, NewText)
	return NewText
end
local function CreateCham(Name, Adornee)
	local NewCham = Instance.new('Highlight', game.Lighting)
	NewCham.Name = Name
	NewCham.Adornee = Adornee
	NewCham.FillTransparency = 0
	NewCham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	NewCham.Enabled = false
	table.insert(Settings.Normal, NewCham)
	return NewCham
end

local function SetLine(Line, newFrom, newTo, newColor)
	Line.From = Vector2.new(newFrom.X, newFrom.Y)
	Line.To = Vector2.new(newTo.X, newTo.Y)
	Line.Color = newColor
	Line.Visible = true
end
local function SetText(Text, newStr, newPos, newColor)
	Text.Text = newStr
	Text.Position = newPos
	Text.Color = newColor
	Text.Visible = true
end
local function SetChams(Cham, newOutline, newFill)
	Cham.OutlineColor = newOutline
	Cham.FillColor = newFill
	Cham.Enabled = true
end
local function Draw3DBox(Table, Character, Color)
	local op = Vector3.new(Character.HumanoidRootPart.Position.X - .25, Character.HumanoidRootPart.Position.Y - .5, Character.HumanoidRootPart.Position.Z)

	local X = 1.5
	local Y = 2.5
	local Z = 1.5

	local Top1 = CurrentCamera:WorldToViewportPoint(op + Vector3.new(-X, Y, -Z))
	local Top2 = CurrentCamera:WorldToViewportPoint(op + Vector3.new(X, Y, -Z))
	local Top3 = CurrentCamera:WorldToViewportPoint(op + Vector3.new(X, Y, Z))
	local Top4 = CurrentCamera:WorldToViewportPoint(op + Vector3.new(-X, Y, Z))

	local Bottom1 = CurrentCamera:WorldToViewportPoint(op + Vector3.new(-X, -Y, -Z))
	local Bottom2 = CurrentCamera:WorldToViewportPoint(op + Vector3.new(X, -Y, -Z))
	local Bottom3 = CurrentCamera:WorldToViewportPoint(op + Vector3.new(X, -Y, Z))
	local Bottom4 = CurrentCamera:WorldToViewportPoint(op + Vector3.new(-X, -Y, Z))

	SetLine(Table.Line1, Vector2.new(Top1.X, Top1.Y), Vector2.new(Top2.X, Top2.Y), Color)
	SetLine(Table.Line2, Vector2.new(Top2.X, Top2.Y), Vector2.new(Top3.X, Top3.Y), Color)
	SetLine(Table.Line3, Vector2.new(Top3.X, Top3.Y), Vector2.new(Top4.X, Top4.Y), Color)
	SetLine(Table.Line4, Vector2.new(Top4.X, Top4.Y), Vector2.new(Top1.X, Top1.Y), Color)

	SetLine(Table.Line5, Vector2.new(Bottom1.X, Bottom1.Y), Vector2.new(Bottom2.X, Bottom2.Y), Color)
	SetLine(Table.Line6, Vector2.new(Bottom2.X, Bottom2.Y), Vector2.new(Bottom3.X, Bottom3.Y), Color)
	SetLine(Table.Line7, Vector2.new(Bottom3.X, Bottom3.Y), Vector2.new(Bottom4.X, Bottom4.Y), Color)
	SetLine(Table.Line8, Vector2.new(Bottom4.X, Bottom4.Y), Vector2.new(Bottom1.X, Bottom1.Y), Color)

	SetLine(Table.Line9, Vector2.new(Top1.X, Top1.Y), Vector2.new(Bottom1.X, Bottom1.Y), Color)
	SetLine(Table.Line10, Vector2.new(Top2.X, Top2.Y), Vector2.new(Bottom2.X, Bottom2.Y), Color)
	SetLine(Table.Line11, Vector2.new(Top3.X, Top3.Y), Vector2.new(Bottom3.X, Bottom3.Y), Color)
	SetLine(Table.Line12, Vector2.new(Top4.X, Top4.Y), Vector2.new(Bottom4.X, Bottom4.Y), Color)
end
local function DrawBones(Table, Character, Color)
	local GetBones = function(Char)
		local BoneTable = {}
		if Char.Humanoid.RigType == Enum.HumanoidRigType.R15 then
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.Head.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.UpperTorso.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.LowerTorso.Position)

			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.RightUpperArm.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.RightLowerArm.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.RightHand.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.LeftUpperArm.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.LeftLowerArm.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.LeftHand.Position)

			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.RightUpperLeg.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.RightLowerLeg.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.RightFoot.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.LeftUpperLeg.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.LeftLowerLeg.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.LeftFoot.Position)
		elseif Char.Humanoid.RigType == Enum.HumanoidRigType.R6 then
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.Head.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char.Torso.Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char['Right Arm'].Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char['Left Arm'].Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char['Right Leg'].Position)
			BoneTable[#BoneTable+1] = CurrentCamera:WorldToViewportPoint(Char['Left Leg'].Position)
		else
			warn('Humanoid not valid.')
		end
		return BoneTable
	end

	local BoneTable = GetBones(Character)
	if #BoneTable == 15 then
		SetLine(Table['Head'], BoneTable[1], BoneTable[3], Color)

		SetLine(Table['RUA'], BoneTable[2], BoneTable[4], Color)
		SetLine(Table['RLA'], BoneTable[4], BoneTable[5], Color)
		SetLine(Table['RH'], BoneTable[5], BoneTable[6], Color)
		SetLine(Table['LUA'], BoneTable[2], BoneTable[7], Color)
		SetLine(Table['LLA'], BoneTable[7], BoneTable[8], Color)
		SetLine(Table['LH'], BoneTable[8], BoneTable[9], Color)

		SetLine(Table['RUL'], BoneTable[3], BoneTable[10], Color)
		SetLine(Table['RLL'], BoneTable[10], BoneTable[11], Color)
		SetLine(Table['RF'], BoneTable[11], BoneTable[12], Color)
		SetLine(Table['LUL'], BoneTable[3], BoneTable[13], Color)
		SetLine(Table['LLL'], BoneTable[13], BoneTable[14], Color)
		SetLine(Table['LF'], BoneTable[14], BoneTable[15], Color)
	elseif #BoneTable == 6 then
		SetLine(Table['Head'], BoneTable[1], BoneTable[2], Color)

		SetLine(Table['RUA'], BoneTable[2], BoneTable[3], Color)
		SetLine(Table['LUA'], BoneTable[2], BoneTable[4], Color)
		SetLine(Table['RUL'], BoneTable[2], BoneTable[5], Color)
		SetLine(Table['LUL'], BoneTable[2], BoneTable[6], Color)
	else
		warn('[Error] Not enough bones.')
	end
end

local function Esp(Char)
	local Player = Players:FindFirstChild(Char.Name)
	local Tracer = CreateLine()
	local Text = CreateText()
	local Cham = CreateCham(Char.Name, Char)
	local Box3DTable = {
		Line1 = CreateLine(),
		Line2 = CreateLine(),
		Line3 = CreateLine(),
		Line4 = CreateLine(),
		Line5 = CreateLine(),
		Line6 = CreateLine(),
		Line7 = CreateLine(),
		Line8 = CreateLine(),
		Line9 = CreateLine(),
		Line10 = CreateLine(),
		Line11 = CreateLine(),
		Line12 = CreateLine(),
	}
	local SkeletonTable = {
		Head = CreateLine(),
		RUA = CreateLine(),
		RLA = CreateLine(),
		RH = CreateLine(),
		LUA = CreateLine(),
		LLA = CreateLine(),
		LH = CreateLine(),
		RUL = CreateLine(),
		RLL = CreateLine(),
		RF= CreateLine(),
		LUL = CreateLine(),
		LLL = CreateLine(),
		LF= CreateLine(),
	}

	Char:WaitForChild('Humanoid', 5)

	local Conn
	Conn = game:GetService('RunService').RenderStepped:Connect(function()
		if Player and Players:FindFirstChild(Player.Name) and Char and Char:FindFirstChild('HumanoidRootPart') and Char:FindFirstChild('Humanoid') and Char.Humanoid.Health > 0 then
			--// Set to invisible just in case \\--
			Tracer.Visible = false
			Text.Visible = false
			for _,Line in pairs(Box3DTable) do Line.Visible = false end
			for _,Line in pairs(SkeletonTable) do Line.Visible = false end

			--// Main \\--
			local Pos, Vis = CurrentCamera:WorldToViewportPoint(Char.HumanoidRootPart.Position)
			local HeadPos = CurrentCamera:WorldToViewportPoint(Char:WaitForChild('Head').Position + Vector3.new(0, 1.5, 0))
			if Vis then
				local Color = Settings.Colors.TeamMainColor
				if Player.Team ~= LocalPlayer.Team then Color = Settings.Colors.EnemyMainColor end

				if Settings.Visual.Tracers then
					SetLine(Tracer, Vector2.new(Mouse.X, Mouse.Y + 36), Vector2.new(Pos.X, Pos.Y), Color)
				end
				if Settings.Visual.Nametags then
					SetText(Text, Player.Name, Vector2.new(HeadPos.X, HeadPos.Y), Color)
				end
				if Settings.Visual.Chams then
					local Outline, Fill = Settings.Colors.TeamMainOutline, Settings.Colors.TeamMainFill
					if Player.Team ~= LocalPlayer.Team then Outline = Settings.Colors.EnemyMainOutline Fill = Settings.Colors.EnemyMainFill end
					SetChams(Cham, Outline, Fill)
				end
				if Settings.Visual.Box3D then
					Draw3DBox(Box3DTable, Char, Color)
				end
				if Settings.Visual.Skeletons then
					DrawBones(SkeletonTable, Char, Color)
				end
			end
		elseif Tracer and Tracer.__OBJECT_EXISTS then
			Tracer:Remove()
			Text:Remove()
			Cham:Destroy()
			for _,Line in pairs(Box3DTable) do Line:Remove() end
			for _,Line in pairs(SkeletonTable) do Line:Remove() end
			Conn:Disconnect()
		end
	end)
	table.insert(Settings.Connections, Conn)
end

for _,Player in pairs(Players:GetPlayers()) do
	if Player ~= LocalPlayer then
		table.insert(Settings.Connections, Player.CharacterAdded:Connect(Esp))
		if Player.Character then
			Esp(Player.Character)
		end
	end
end
table.insert(Settings.Connections, Players.PlayerAdded:Connect(function(Player)
	if Player ~= LocalPlayer then
		table.insert(Settings.Connections, Player.CharacterAdded:Connect(Esp))
		if Player.Character then
			Esp(Player.Character)
		end
	end
end))

--< Destroy Stuff >--
game.CoreGui.TreysHub.Destroying:Connect(function()
	Destroyed = true
	for i,v in pairs(Settings.Normal) do
		v:Destroy()
	end
	for i,v in pairs(Settings.DrawingObjects) do
		if v and v.__OBJECT_EXISTS then
			v:Remove()
		end
	end
	for i,v in pairs(Settings.Connections) do
		v:Disconnect()
	end
	_G.Debug = Settings
end)
