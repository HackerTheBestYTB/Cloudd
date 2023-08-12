local data = {
	version = nil
}

local latest = '3.7'
function data.checkVersion()
	if data.version ~= latest then
		local PromptLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerTheBestYTB/ScriptRoblox/test/PromptLibrary.lua"))()
		PromptLib("TVNHUB | Jailbreak","Your current version is outdated ("..tostring(data.version)..")\nYou need to update to latest version ("..tostring(latest)..")",{
			{Text = "Keep Playing",LayoutOrder = 0,Primary = false,Callback = function()
			end},
			{Text = "Leave",LayoutOrder = 1,Primary = true,Callback = function()
				game:Shutdown()   
			end}
		},true)
	end
end

return data
