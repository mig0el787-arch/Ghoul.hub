-- GHOUL HUB FUNCTIONS ☠️

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- FLY
_G.Flying = false
function _G.Fly()
	_G.Flying = not _G.Flying

	if _G.Flying then
		local bv = Instance.new("BodyVelocity")
		bv.Name = "GhoulFly"
		bv.MaxForce = Vector3.new(1,1,1) * 1e5
		bv.Parent = hrp

		RunService.RenderStepped:Connect(function()
			if _G.Flying and bv.Parent then
				bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
			end
		end)
	else
		if hrp:FindFirstChild("GhoulFly") then
			hrp.GhoulFly:Destroy()
		end
	end
end

-- NOCLIP
_G.NoclipEnabled = false
function _G.Noclip()
	_G.NoclipEnabled = not _G.NoclipEnabled

	RunService.Stepped:Connect(function()
		if _G.NoclipEnabled then
			for _,v in pairs(char:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end
	end)
end
