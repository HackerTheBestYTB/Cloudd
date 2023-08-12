local data = {
    version = nil
}

local latest = '3.7'
function data.checkVersion()
    if data.version ~= latest then
       message("Old Version")
    end
end

return data
