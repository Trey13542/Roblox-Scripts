--[[
	Main Script
	github: https://github.com/Trey13542
--]]

if not hookmetamethod or not checkcaller or not getnamecallmethod then
	print('exploit not supported')
	return
end


--< define stuff >--

_G.host = 'TreyTheHot1'
_G.joining = { 'AwesomeSauce12126' }

_G.damage = 'TreyTheHot1'
_G.support = 'AwesomeSauce12126'


--< check game >--

local lobby_ids = { 2414851778, 3220968688 }
if table.find(lobby_ids, game.PlaceId) then
	-- do lobby stuff
else
	-- do game stuff
end