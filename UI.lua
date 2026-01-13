print("UI.lua iniciou")

local Functions = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/mig0el787-arch/Ghoul.hub/main/Functions.lua"
))()

-- GUI básica
local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "GhoulHubTest"

local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0,200,0,50)
btn.Position = UDim2.new(0.5,-100,0.5,-25)
btn.Text = "TESTAR FUNCTION"

btn.MouseButton1Click:Connect(function()
	print("Botão clicado")
	Functions.Test()
end)

return true
