print("GhoulHub UI iniciando")

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Carregar funções
local funcs = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/SEU_USUARIO/Ghoul.hub/main/Functions/Main.lua"
))()

-- ===== GUI BASE =====
local gui = Instance.new("ScreenGui")
gui.Name = "GhoulHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,520,0,320)
main.Position = UDim2.new(0.5,-260,0.5,-160)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)

-- ===== SIDEBAR =====
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,130,1,0)
side.BackgroundColor3 = Color3.fromRGB(10,10,10)
side.BorderSizePixel = 0

local title = Instance.new("TextLabel", side)
title.Size = UDim2.new(1,0,0,48)
title.BackgroundTransparency = 1
title.Text = "GHOUL HUB"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

-- ===== CONTENT =====
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,130,0,0)
content.Size = UDim2.new(1,-130,1,0)
content.BackgroundTransparency = 1

local tabs = {}

local function createTab(name, order)
	local btn = Instance.new("TextButton", side)
	btn.Size = UDim2.new(1,0,0,40)
	btn.Position = UDim2.new(0,0,0,48 + (order-1)*42)
	btn.Text = name
	btn.BackgroundTransparency = 1
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14

	local frame = Instance.new("Frame", content)
	frame.Size = UDim2.new(1,0,1,0)
	frame.Visible = false
	frame.BackgroundTransparency = 1

	btn.MouseButton1Click:Connect(function()
		for _,v in pairs(tabs) do v.Visible = false end
		frame.Visible = true
	end)

	table.insert(tabs, frame)
	return frame
end

-- ===== TABS =====
local tabMove = createTab("Movement",1)
local tabPlayer = createTab("Player",2)
local tabSettings = createTab("Settings",3)
tabs[1].Visible = true

-- ===== BOTÕES =====
local function makeButton(parent, text, y, callback)
	local b = Instance.new("TextButton", parent)
	b.Size = UDim2.new(0,220,0,42)
	b.Position = UDim2.new(0,20,0,y)
	b.Text = text
	b.BackgroundColor3 = Color3.fromRGB(20,20,20)
	b.TextColor3 = Color3.fromRGB(255,255,255)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.BorderSizePixel = 0
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
	b.MouseButton1Click:Connect(callback)
end

-- ===== FUNÇÕES (CHAMADAS) =====
makeButton(tabMove,"Fly",30,function()
	funcs.Fly()
end)

makeButton(tabMove,"Noclip",80,function()
	funcs.Noclip()
end)

makeButton(tabPlayer,"Reset Character",30,function()
	funcs.Reset()
end)

makeButton(tabSettings,"Close Hub",30,function()
	gui:Destroy()
end)

print("GhoulHub UI carregada")
