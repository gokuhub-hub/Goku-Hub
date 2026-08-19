local goku_hub = {
    [6765805766] = {
        Nombre = "Block Spin",
        Cargar = function()
           loadstring(game:HttpGet("https://jnkie.com"))()
        end
    }
}

if not goku_hub[game.PlaceId] then
    game.Players.LocalPlayer:Kick("Goku Hub: Juego no compatible")
    return
end

print("Goku Hub cargado con éxito para " .. goku_hub[game.PlaceId].Nombre)

pcall(function()
    goku_hub[game.PlaceId].Cargar()
end)
