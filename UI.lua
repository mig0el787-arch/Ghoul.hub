-- UI.lua (TESTE DEFINITIVO)

warn("UI.lua INICIADO")

-- Espera o jogo carregar
if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Espera PlayerGui
local playerGui = player:WaitForChild("PlayerGui", 10)
if not playerGui then
	warn("PlayerGui NÃO encontrado")
	return
end

-- Remove UI antiga se existir
if playerGui:FindFirstChild("GhoulHub") then
	playerGui.GhoulHub:Destroy()
end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "GhoulHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Frame principal
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0

-- Texto
local text = Instance.new("TextLabel")
text.Parent = frame
text.Size = UDim2.new(1, 0, 1, 0)
text.BackgroundTransparency = 1
text.Text = "GHOUL HUB\nUI FUNCIONANDO"
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.Font = Enum.Font.GothamBold
text.TextSize = 24
text.TextWrapped = true

warn("UI.lua FINALIZADO — SE VOCÊ VÊ ISSO, FUNCIONOU")
