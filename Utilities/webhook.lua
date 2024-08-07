--[[
	author: treythehot
	github: https://github.com/Trey13542
	docs: treythehot.gitbook.io/utilities
--]]

assert(request, 'exploit not supported')



--< [variables] >--
function sendMessage(url, message)
	local response = request({
		Url = url,
		Method = "POST",
		Headers = { ['Content-Type'] = 'application/json' },
		Body = game:GetService('HttpService'):JSONEncode({ ['content'] = message })
	})
end
function sendMessageEmbed(url, embed)
	local data = {
		['embeds'] = {
			{
				['title'] = embed.title,
				['description'] = embed.description,
				['color'] = embed.color,
				['fields'] = embed.fields,
				['footer'] = {
					['text'] = embed.footer.text
				}
			}
		}
	}
	local response = request({
		Url = url,
		Method = "POST",
		Headers = { ['Content-Type'] = 'application/json' },
		Body = game:GetService('HttpService'):JSONEncode(data)
	})
end
