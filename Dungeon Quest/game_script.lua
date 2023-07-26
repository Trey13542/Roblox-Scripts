--[[
	Game Script
	github: https://github.com/Trey13542
--]]


--< All >--

local utils = loadstring(game:HttpGet('https://raw.githubusercontent.com/Trey13542/Roblox-Scripts/main/Utilities'))()
if not _G.ws then return end


--< Damage >--

local damage = ''

if _G.lPlr.Name == damage then
	while wait() do
		for i,v in pairs(workspace:GetDescendants()) do
		    if v:IsA('Humanoid') and not game:GetService('Players'):FindFirstChild(v.Parent.Name) then
		    	v.Health = 0
		    end
		end
	end
end


--< Support >--

local support = ''
if _G.lPlr.Name == support then
	while wait() do
		for _,v in pairs(players:GetPlayers()) do
			if v and v ~= lPlr and v.Character and v.Character:FindFirstChild('Humanoid') and v.Character.Humanoid.Health < v.Character.Humanoid.MaxHealth then
				for _,skill in pairs(lPlr.Backpack:GetChildren()) do
					if skill.cooldown.Value <= 0.0 then
						skill.abilityEvent:FireServer()
						wait(3)
					end
				end
			end
		end
	end
end

--< Others >--
while wait(1) do
	local dir = math.random(1, 4)
	local pos = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame.Position
	
	if dir == 1 then pos += Vector3.new(1, 0, 0)
	elseif dir == 2 then pos += Vector3.new(-1, 0, 0)
	elseif dir == 3 then pos += Vector3.new(0, 0, 1)
	elseif dir == 4 then pos += Vector3.new(0, 0, -1) end
	
	game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame.Position = pos
end