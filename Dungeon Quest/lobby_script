--[[
	Lobby Script
	github: https://github.com/Trey13542
--]]


--< define stuff >--

local map = 'Desert Temple'
local difficulty = 'Easy'
local hardcore = true


--< host/join lobby >--

if game:GetService('Players').LocalPlayer.Name == _G.host then
	-- start lobby
    game:GetService('ReplicatedStorage').remotes.createLobby:InvokeServer(map, difficulty, 0, hardcore, true, false)
    
    -- whilelist others
    for _,v in pairs(_G.joining) do
    	game:GetService('ReplicatedStorage').remotes.addPlayerToWhitelist:FireServer(v)
    end
    
    -- wait for others
    repeat wait() until #game:GetService('Players').LocalPlayer.PlayerGui.queueGui.lobbyInfo.backgroundFill.ScrollingFrame:GetChildren() - 2 == #_G.joining
    
    -- start
    game:GetService('ReplicatedStorage').remotes.startDungeon:FireServer()
else
	-- wait until lobby created
	repeat wait() until game:GetService('Players').LocalPlayer.PlayerGui.queueGui.gameSearch.backgroundFill.ScrollingFrame:FindFirstChild(host)
	
	-- join lobby
	game:GetService('ReplicatedStorage').remotes.joinDungeon:InvokeServer(host)
end