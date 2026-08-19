-- [[ SCRIPT BASE OPEN-SOURCE PARA BLOCKSPIN ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

local Window = Rayfield:CreateWindow({
   Name = "BlockSpin Hub 🎲",
   LoadingTitle = "Cargando Configuración...",
   LoadingSubtitle = "por AI Assistant",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "BlockSpinHubConfigs",
      FileName = "MainConfig"
   }
})

-- TABS PRINCIPALES
local FarmTab = Window:CreateTab("Auto Farm 💰", 4483362458)
local WeaponTab = Window:CreateTab("Armas 🔫", 4483362458)
local TeleportTab = Window:CreateTab("Teleports 📍", 4483362458)

-- VARIABLES DE CONTROL
local AutoCook = false
local AutoJanitor = false
local AutoATM = false
local FastFire = false
local NoRecoil = false

-- ==========================================
-- SECCIÓN: AUTO FARM
-- ==========================================
FarmTab:CreateSection("Automatizaciones de Trabajo")

FarmTab:CreateToggle({
   Name = "Auto Cook Farm (Cocinar)",
   CurrentValue = false,
   Flag = "ToggleCook",
   Callback = function(Value)
      AutoCook = Value
      task.spawn(function()
         while AutoCook do
            -- Aquí va la lógica para interactuar con la cocina o los ingredientes
            print("Cocinando automáticamente...")
            task.wait(1)
         end
      end)
   end,
})

FarmTab:CreateToggle({
   Name = "Auto Janitor Farm (Conserje)",
   CurrentValue = false,
   Flag = "ToggleJanitor",
   Callback = function(Value)
      AutoJanitor = Value
      task.spawn(function()
         while AutoJanitor do
            -- Lógica para limpiar manchas o basura en el mapa
            print("Limpiando el mapa...")
            task.wait(1)
         end
      end)
   end,
})

FarmTab:CreateToggle({
   Name = "Auto ATM Farm (Robar Cajeros)",
   CurrentValue = false,
   Flag = "ToggleATM",
   Callback = function(Value)
      AutoATM = Value
      task.spawn(function()
         while AutoATM do
            -- Lógica para teletransportarse e interactuar con ATMs
            print("Farmeando cajeros automáticos...")
            task.wait(2)
         end
      end)
   end,
})

-- ==========================================
-- SECCIÓN: MEJORAS DE ARMAS
-- ==========================================
WeaponTab:CreateSection("Modificaciones de Combate")

WeaponTab:CreateToggle({
   Name = "Aumentar Cadencia (Fast Fire Rate)",
   CurrentValue = false,
   Flag = "ToggleFireRate",
   Callback = function(Value)
      FastFire = Value
      -- Nota: Requiere modificar los metatables o atributos del arma equipada
      if FastFire then
         print("Cadencia aumentada activada.")
      end
   end,
})

WeaponTab:CreateToggle({
   Name = "Sin Retroceso (No Recoil)",
   CurrentValue = false,
   Flag = "ToggleRecoil",
   Callback = function(Value)
      NoRecoil = Value
      if NoRecoil then
         print("Retroceso eliminado.")
      end
   end,
})

-- ==========================================
-- SECCIÓN: TELEPORTS
-- ==========================================
TeleportTab:CreateSection("Ubicaciones Importantes")

-- Función auxiliar para teletransporte seguro (Tween)
local function teleportTo(cframe)
   local player = game.Players.LocalPlayer
   if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
      -- Un desplazamiento directo (puedes cambiarlo por un Tween para evitar el anti-cheat)
      player.Character.HumanoidRootPart.CFrame = cframe
   end
end

TeleportTab:CreateButton({
   Name = "Teletransportarse al Air Drop 📦",
   Callback = function()
      -- Busca si existe un Air Drop activo en el Workspace y viaja hacia él
      local airdrop = workspace:FindFirstChild("AirDrop") -- Ajusta este nombre según el juego
      if airdrop and airdrop:FindFirstChild("HumanoidRootPart") then
         teleportTo(airdrop.HumanoidRootPart.CFrame)
         Rayfield:Notify({Name = "Éxito", Content = "Teletransportado al Air Drop", Duration = 3})
      else
         Rayfield:Notify({Name = "Aviso", Content = "No hay ningún Air Drop activo en el mapa.", Duration = 4})
      end
   end,
})

TeleportTab:CreateButton({
   Name = "Ir a Tienda de Armas 🏪",
   Callback = function()
      -- Reemplaza Vector3.new(0,0,0) por las coordenadas exactas de la tienda en BlockSpin
      teleportTo(CFrame.new(Vector3.new(100, 5, 250))) 
   end,
})

TeleportTab:CreateButton({
   Name = "Ir a Zona Segura (Safe Zone) 🛡️",
   Callback = function()
      -- Reemplaza con las coordenadas de la zona segura
      teleportTo(CFrame.new(Vector3.new(0, 10, 0))) 
   end,
})

Rayfield:Notify({
   Name = "BlockSpin Hub Activado",
   Content = "Tu interfaz personalizada está lista para usarse.",
   Duration = 5,
})
