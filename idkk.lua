local data = {
	hwid = nil,
	hwidc = nil
}

local tableofhwid = {
	"0e847c84c4d9f5fa8f1c63ba5847aac3",
	"121be33c04cff2adc742fc9c2e848c2",
	"LOL"
}
function data.checkHWID()
	for _, value in ipairs(tableofhwid) do
		if value == data.hwid then
			hwidc = true
			break
		end
	end
	if not hwidc then
		hwidc = false
	end
end

return data
