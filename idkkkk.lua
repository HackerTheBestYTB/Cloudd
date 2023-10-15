_G.SAWC2 = true
_G.nearestDistance1 = 600
_G.fovAmount = 200
local realFov = _G.fovAmount
local defualt = 80
			local client = game.Players.LocalPlayer
			local camera = workspace.CurrentCamera
			local mouse = client:GetMouse()
			local rs = game:GetService("RunService")
			if activefix == false then

			else
				if getgenv().slienttoggled then
					_G.fovCircle = Drawing.new("Circle")
					_G.fovCircle.Radius = _G.fovAmount
					_G.fovCircle.Visible = true
					_G.fovCircle.Color = Color3.fromRGB(255,255,255)
					_G.fovCircle.Thickness = 2
					_G.fovCircle.Position = Vector2.new(0,0)
				else
					_G.fovCircle:Remove()
				end	
			end
			local function isPlayerInFront(player, targetPosition, cameraPosition)
				local direction = (targetPosition - cameraPosition).unit
				local ray = Ray.new(cameraPosition, direction * 1000)
				local hitPart, hitPosition = workspace:FindPartOnRay(ray)

				if hitPart and hitPart:IsDescendantOf(player.Character) then
					return true
				end
				return false
			end
			getgenv().old = getgenv().old or require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList

			if getgenv().slienttoggled then
				require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList = function(...)
					local mousePos = camera.WorldToViewportPoint(camera, mouse.Hit.p)
					local set = fovAmount * ((defualt - camera.FieldOfView) / 100 + 1)
					realFov = set
					_G.fovCircle.Radius = set
					_G.fovCircle.Position = Vector2.new(mousePos.X, mousePos.Y)

					local localPlayerRootPart = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
					local cameraPosition = camera.CFrame.Position
					local nearestPlayerName = nil
					local localPlayerTeam = game:GetService("Players").LocalPlayer.Team
					local prisonerTeam = game:GetService("Teams").Prisoner

					local players = game:GetService("Players"):GetPlayers()
					for _, player in ipairs(players) do
						if player.Team ~= localPlayerTeam and player.Team ~= prisonerTeam then
							local character = player.Character
							if character and character:FindFirstChild("HumanoidRootPart") and character.Humanoid.Health > 0 then
								local playerPos = camera.WorldToViewportPoint(camera, character.HumanoidRootPart.Position)
								local distance = (Vector2.new(playerPos.X, playerPos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
								if distance <= realFov and (character.HumanoidRootPart.Position - localPlayerRootPart).Magnitude < nearestDistance1 and _G.SAWC2 == false then
									nearestPlayerName = player
								end
								if distance <= realFov and _G.SAWC2 then
									if isPlayerInFront(player, character.HumanoidRootPart.Position, cameraPosition) then
										if (character.HumanoidRootPart.Position - localPlayerRootPart).Magnitude < nearestDistance1 then
											nearestPlayerName = player
										end
									end
								end
							end
						end
					end
					local arg = {old(...)}
					if (tostring(getfenv(2).script) == "BulletEmitter" or tostring(getfenv(2).script) == "Taser") and nearestPlayerName then
						arg[1] = nearestPlayerName.Character.HumanoidRootPart
						arg[2] = nearestPlayerName.Character.HumanoidRootPart.Position
					end
					return unpack(arg)
				end
			else
				require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList = getgenv().old
			end	
