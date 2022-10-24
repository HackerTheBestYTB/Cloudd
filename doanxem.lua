local ID = game:GetService("RbxAnalyticsService"):GetClientId();

game.StarterGui:SetCore("SendNotification", {Title="TVNHUB"; Text="Đang xác nhận id máy..."; Duration=1;})
wait(2)

if ID == "1" then -- BEF49A83-21F6-4BB5-967E-3A106BB817AC
elseif ID == "B68963E1-E753-4271-9317-6961DF4E27C1" then
game.StarterGui:SetCore("SendNotification", {Title="TVNHUB"; Text="Thành công!"; Duration=1;})
Aimbot()
else	
game.StarterGui:SetCore("SendNotification", {Title="TVNHUB"; Text="Mã xác thực sai!"; Duration=1;})
wait(0.5)
game.StarterGui:SetCore("SendNotification", {Title="TVNHUB"; Text="Đã copy id, gửi cho ad để thêm vào whitelist"; Duration=1;})
setclipboard(ID)
end
