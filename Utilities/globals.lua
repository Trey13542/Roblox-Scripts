--[[
	author: treythehot
	github: https://github.com/Trey13542
	docs: https://treythehot.gitbook.io/utilities
--]]

if _G.uInit then return end
_G.uInit = true

repeat task.wait() until game:IsLoaded()



--< [tables] >--
local function gs(s) return game:GetService(s) end
_G.ws, _G.players, _G.rs, _G.uis, _G.http, _G.run, _G.tween = gs("Workspace"), gs("Players"), gs("ReplicatedStorage"), gs('UserInputService'), gs("HttpService"), gs("RunService"), gs("TweenService")
_G.lPlr, _G.lChar, _G.lHum, _G.lHRP = nil, nil, nil, nil
_G.mouse, _G.cam = _G.lPlr:GetMouse(), _G.ws.CurrentCamera
_G.instances, _G.connections = {}, {}



--< [functions] >--
_G.removeFromTable = function(t, o)
	for index, value in pairs(t) do
		if value == 0 then table.remove(t, index) end
	end
end
-- _G.removeFromTable(table1, "hello")

_G.mag = function(pos1, pos2)
	return (pos1 - pos2).Magnitude
end
-- _G.mag(_G.lChar:GetModelCFrame(), workspace.Part1)

_G.w2s = function(pos)
	return _G.cam:WorldToViewportPoint(pos)
end

_G.validPlayer = function(plr)
	return plr and plr.Parent == _G.players and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0
end
_G.validPart = function(part)
	return part and part.Parent ~= nil
end

_G.tweenPosition = function(obj1, obj2, speed, offset, wait)
	if obj1 and obj2 then
		local timing = _G.mag(obj1, obj2) / speed
		local tween = _G.tween:Create(obj1, TweenInfo.new(timing, Enum.EasingStyle.Linear), {CFrame = CFrame.new(obj2.Position + offset)})
		tween:Play()
		if wait then
			tween.Completed:Wait()
		end
	end
end

table.insert(_G.connections, _G.lPlr.CharacterAdded:Connect(function(char)
	pcall(function()
		_G.lChar = char
		_G.lHum = char:WaitForChild('Humanoid', 5)
		_G.lHRP = char:WaitForChild('HumanoidRootPart', 5)

		local conn
		conn = _G.lChar:WaitForChild('Humanoid', 1).Died:Connect(function()
			_G.lChar = nil
			_G.lHum = nil
			_G.lHRP = nil
		end)
		table.insert(_G.connections, conn)
	end)
end))
