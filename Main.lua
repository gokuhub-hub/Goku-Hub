local Scripts = {
    = {
        Name = "Block Spin",
        Load = function()
           loadstring(game:HttpGet("https://jnkie.com"))()
        end
    },
}

local Goku = Scripts[game.GameId]

if not Goku then
    game.Players.LocalPlayer:Kick("Game not supported")
    return
end

print("Loaded for " .. Goku.Name)

pcall(function()
    Goku.Load()
end)

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GokuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "GokuImage"
imageLabel.Size = UDim2.new(0, 150, 0, 150)
imageLabel.Position = UDim2.new(1, -160, 1, -160)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://10056401344"
imageLabel.Parent = screenGui
