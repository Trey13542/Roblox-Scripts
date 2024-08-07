--[[
	author: treythehot
	github: https://github.com/Trey13542
	docs: https://treythehot.gitbook.io
--]]

if not hookmetamethod or not checkcaller or not hookfunction or not getnamecallmethod then
	print('exploit not supported')
	return
end

if _G.hInit then return end
_G.hInit = true

repeat task.wait() until game:IsLoaded()



--< [variables] >--
local iCache = {}
local nCache = {}
local lCache = {}
local rCache = {}



--< [__index] >--
-- add ability to:
-- .hook | .unhook | .rhook | .unrhook | .lock | .unlock

local oIndex
oIndex = hookmetamethod(game, '__index', function(self, key, ...)
	if checkcaller() then
		local fn = tostring(key) and string.lower(tostring(key)) or ''
		
		-- .hook
		if fn == 'hook' then
			return function(property, value, callback)
				if not iCache[self] then iCache[self] = {} end
				
				if iCache[self][property] then
					print(string.format('[hook] %s.%s is already hooked.', tostring(self), tostring(property)))
				else
					iCache[self][property] = { self, property, value, callback or function(v) end }
					print(string.format('[hook] %s.%s has been hooked.', tostring(self), tostring(property)))
				end
			end
		end
		
		-- .unhook
		if fn == 'unhook' then
			return function(property)
				if iCache[self][property] then
					iCache[self][property] = nil
					print(string.format('[hook] %s.%s unhooked.', tostring(self), tostring(property)))
				else
					print(string.format('[hook] %s.%s is not hooked.', tostring(self), tostring(property)))
				end
			end
		end
		
		-- .rhook
		if fn == 'rhook' then
			return function(name, callback)
				if not rCache[self] then rCache[self] = {} end

				if rCache[self][name] then
					print(string.format('[hook] %s is already hooked.', tostring(name)))
				else
					rCache[self][name] = { self, name, callback }
					print(string.format('[hook] %s has been hooked.', tostring(name)))
				end
			end
		end
		
		-- .unrhook
		if fn == 'unrhook' then
			return function(name)
				if rCache[self][name] then
					rCache[self][name] = nil
					print(string.format('[hook] %s unhooked.', tostring(name)))
				else
					print(string.format('[hook] %s is not hooked.', tostring(name)))
				end
			end
		end
		
		-- .lock
		if fn == 'lock' then
			return function(property, value)
				if not lCache[self] then lCache[self] = {} end

				if lCache[self][property] then
					print(string.format('[hook] %s.%s is already hooked.', tostring(self), tostring(property)))
				else
					lCache[self][property] = { self, property, value }
					print(string.format('[hook] %s.%s has been hooked.', tostring(self), tostring(property)))
				end
			end
		end
		
		-- .unlock
		if fn == 'unlock' then
			return function(property)
				if lCache[self][property] then
					lCache[self][property] = nil
					print(string.format('[hook] %s.%s unhooked.', tostring(self), tostring(property)))
				else
					print(string.format('[hook] %s.%s is not hooked.', tostring(self), tostring(property)))
				end
			end
		end
	end
	
	local sHook = iCache[self] or nil
	if sHook and type(sHook) == 'table' then
		local hook = sHook[key]
		if hook and hook[1] and hook[2] and hook[3] then
			if type(hook[2]) == 'string' and hook[2] == key then
				if hook[4] then hook[4]('tried getting value') end
				return hook[3]
			end
		end
	end
	
	return oIndex(self, key, ...)
end)



--< [__newindex] >--
-- add functionality to:
-- .hook | .unhook | .lock | .unlock

local oNewIndex
oNewIndex = hookmetamethod(game, '__newindex', function(self, key, value)
	local sHook = lCache[self] or nil
	if sHook and type(sHook) == 'table' then
		local hook = sHook[key]
		if hook and hook[1] and hook[2] and hook[3] then
			if type(hook[2]) == 'string' and hook[2] == key then
				value = hook[3]
			end
		end
	end
	
	local sHook2 = iCache[self] or nil
	if sHook2 and type(sHook2) == 'table' then
		local hook = sHook2[key]
		if hook and hook[1] and hook[2] and hook[3] then
			if type(hook[2]) == 'string' and hook[2] == key then
				if hook[4] then hook[4]('tried setting value') end
			end
		end
	end
	
	return oNewIndex(self, key, value)
end)



--< [__namecall] >--
-- add functionality to:
-- .rhook | .unrhook

local oNamecall
oNamecall = hookmetamethod(game, '__namecall', function(self, key, ...)
	local args = {...}
	local method = getnamecallmethod()
	
	if method == 'FireServer' or method == 'InvokeServer' then
		local sHook = rCache[self] or nil
		if sHook and type(sHook) == 'table' then
			local hook = sHook[self.Name]
			if hook and hook[1] and hook[2] and hook[3] then
				if type(hook[2]) == 'string' and hook[2] == self.Name then
					hook[3](args)
				end
			end
		end
	end
	
	return oNamecall(self, key, unpack(args))
end)

print('[hook] hooks initialized.')