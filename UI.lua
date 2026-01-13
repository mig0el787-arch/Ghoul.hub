-- UI.lua
return function(Functions)

	print("UI.lua iniciou")

	local Players = game:GetService("Players")
	local UIS = game:GetService("UserInputService")

	local player = Players.LocalPlayer

	-- ScreenGui
	local gui = Instance.new("ScreenGui")
	gui.Name = "GhoulHubUI"
	gui.ResetOnSpawn = false
	gui.Parent = player:WaitForChild("PlayerGui")

	-- Janela principal
	local main = Instance.new("Frame")
	main.Parent = gui
	main.Size = UDim2.new(0, 400, 0, 250)
	main.Position = UDim2.new(0.5, -200, 0.5, -125)
	main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	main.BorderSizePixel = 0

	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

	-- Título
	local title = Instance.new("TextLabel")
	title.Parent = main
	title.Size = UDim2.new(1, 0, 0, 40)
	title.BackgroundTransparency = 1
	title.Text = "GHOUL HUB"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 20

	-- Botão de teste
	local testBtn = Instance.new("TextButton")
	testBtn.Parent = main
	testBtn.Size = UDim2.new(0, 200, 0, 40)
	testBtn.Position = UDim2.new(0.5, -100, 0, 100)
	testBtn.Text = "TESTAR FUNCTIONS"
	testBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	testBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	testBtn.Font = Enum.Font.GothamBold
	testBtn.TextSize = 14
	testBtn.BorderSizePixel = 0
	Instance.new("UICorner", testBtn).CornerRadius = UDim.new(0, 10)

	testBtn.MouseButton1Click:Connect(function()
		print("Botão clicado")
		if Functions and Functions.Test then
			Functions.Test()
		else
			warn("Functions.Test não existe")
		end
	end)

	-- Botão fechar
	local close = Instance.new("TextButton")
	close.Parent = main
	close.Size = UDim2.new(0, 30, 0, 30)
	close.Position = UDim2.new(1, -35, 0, 5)
	close.Text = "X"
	close.BackgroundTransparency = 1
	close.TextColor3 = Color3.fromRGB(255, 0, 0)
	close.Font = Enum.Font.GothamBold
	close.TextSize = 16

	close.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)

	print("UI carregada com sucesso")
end
