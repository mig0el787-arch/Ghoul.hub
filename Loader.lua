-- Ghoul Hub Loader ☠️

print("GhoulHub Loader iniciado")

-- Espera o jogo carregar
if not game:IsLoaded() then
	game.Loaded:Wait()
end

-- Carrega a UI
loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/mig0el787-arch/Ghoul.hub/main/UI/UI.lua"
))()

print("GhoulHub UI carregada")
