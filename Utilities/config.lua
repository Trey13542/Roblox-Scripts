--[[
	author: treythehot
	github: https://github.com/Trey13542
	docs: treythehot.gitbook.io/utilities
--]]

assert(writefile and readfile, 'exploit not supported')



--< [functions] >--

function saveConfig(name, config)
	writefile(name, game:GetService('HttpService'):JSONEncode(config))
end
function loadConfig(name, config)
	if not pcall(function() readfile(name) end) then writefile(name, game:GetService('HttpService'):JSONDecode(config)) end
	return game:GetService('HttpService'):JSONDecode(readfile(name))
end
