-- GHOUL HUB | Loader.lua
print("Ghoul Hub Loader iniciado")

local BASE_URL = "https://raw.githubusercontent.com/mig0el787-arch/Ghoul.hub/main/"

-- Carregar Functions.lua
local Functions = loadstring(game:HttpGet(BASE_URL .. "Functions.lua"))()

if not Functions then
	warn("Erro ao carregar Functions.lua")
	return
end

-- Carregar UI.lua
local UI = loadstring(game:HttpGet(BASE_URL .. "UI.lua"))

if not UI then
	warn("Erro ao carregar UI.lua")
	return
end

-- Executar UI passando as funções
UI(Functions)

print("Ghoul Hub carregado com sucesso")
