print("GhoulHub Functions iniciadas")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local Functions = {}

-- ===== FLY =====
do
	local flying = false
	local bv

	function Functions.Fly()
		flying = not flying
		if flying then
			bv = Instance.new("BodyVelocity")
			bv.MaxForce = Vector3.new(1,1,1) * 1e5
			bv.Parent = hrp

			RunService.RenderStepped:Connect(function()
				if flying and bv then
					bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
				end
			end)
		else
			if bv then
				bv:Destroy()
				bv = nil
			end
		end
	end
end

-- ===== NOCLIP =====
do
	local noclip = false

	function Functions.Noclip()
		noclip = not noclip
	end

	RunService.Stepped:Connect(function()
		if noclip and char then
			for _,p in pairs(char:GetDescendants()) do
				if p:IsA("BasePart") then
					p.CanCollide = false
				end
			end
		end
	end)
end

-- ===== RESET =====
function Functions.Reset()
	if char then
		char:BreakJoints()
	end
end

print("GhoulHub Functions carregadas")

return Functions
