-- Referencias iniciales
local player = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")

-- Bucle principal que se ejecuta continuamente
while task.wait() do
    -- Comprobamos si la carpeta principal existe
    local cloudControl = workspace:FindFirstChild("Cloud Control")
    if not cloudControl then 
        break -- Rompe el bucle si "Cloud Control" deja de existir
    end

    -- Comprobamos si la subcarpeta existe
    local cloudStorage = cloudControl:FindFirstChild("CloudStorage")
    if not cloudStorage then
        break -- Rompe el bucle si "CloudStorage" deja de existir
    end

    -- Verificamos que el personaje del jugador esté cargado
    local character = player.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")

    if rootPart then
        -- Recorremos todos los elementos actuales dentro de CloudStorage
        for _, object in ipairs(cloudStorage:GetChildren()) do
            -- Filtramos para asegurarnos de que sea una pieza y se llame "cloud"
            if object:IsA("BasePart") and object.Name == "cloud" then
                
                -- Ejecutamos la función con el orden correcto:
                -- 1º Part a tocar, 2º Root del jugador, 3º Estado (0 tocar, 1 soltar)
                if type(firetouchinterest) == "function" then
                    firetouchinterest(object, rootPart, 0)
                    firetouchinterest(object, rootPart, 1)
                else
                    warn("Tu ejecutor no soporta firetouchinterest()")
                    break
                end
            end
        end
    end
end

print("El bucle ha terminado. La carpeta ha dejado de existir.")