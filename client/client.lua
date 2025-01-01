local RSGCore = exports['rsg-core']:GetCoreObject()

local wildHorseRolled = false
local Spawns = Config.Spawns
local Delay = Config.RespawnDelay
local Frequency = Config.RNGTimer
local Radius = Config.Radius -- Rayon de spawn configuré

-- Fonction pour générer un comportement de mouvement naturel
function MoveInArea(ped, x, y, z, radius)
    -- Calculer un endroit dans la zone sans faire de mouvements en cercle
    local angle = math.random() * math.pi * 2  -- Angle aléatoire
    local distance = math.random(5, radius)  -- Distance aléatoire dans la zone
    local newX = x + distance * math.cos(angle)  -- Nouvelle position en X
    local newY = y + distance * math.sin(angle)  -- Nouvelle position en Y

    -- Déplacer le cheval vers la nouvelle position
    TaskFollowNavMeshToCoord(ped, newX, newY, z, 1.0, -1, 0.0, 0)
end

function PedReadyToRender(ped)
    -- Wait for model to load
    return Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ped)
end

function SetRandomOutfitVar(ped, bool1)
    -- Property needs to be set no matter what
    return Citizen.InvokeNative(0x283978A15512B2FE, ped, bool1)
end

function UpdatePedVariation(ped)
    Citizen.InvokeNative(0xAAB86462966168CE, ped, true) -- UNKNOWN "Fixes outfit"- always paired with _UPDATE_PED_VARIATION
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false) -- _UPDATE_PED_VARIATION
end

function PlayerTip()
    lib.notify({title = Config.Notification,type = 'info',duration = 4000})
end

function SpawnChance(chance)
    -- Convert spawn chance percentage to max value
    local SpawnChanceMax = 20
    if chance == 1 then
        SpawnChanceMax = 400
    elseif chance == 2 then
        SpawnChanceMax = 200
    elseif chance == 3 then
        SpawnChanceMax = 100
    elseif chance == 4 then
        SpawnChanceMax = 50
    elseif chance == 5 then
        SpawnChanceMax = 33
    elseif chance == 6 then
        SpawnChanceMax = 25
    end
    return SpawnChanceMax
end

function SpawnHorse(x, y, z, h, model)
    -- Create Horse
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(1)
    end
    local wildHorse = CreatePed(model, x, y, z, h, 1, 1)
    SetEntityInvincible(wildHorse, false)
    SetRandomOutfitVar(wildHorse, true)
    SetEntityAsMissionEntity(wildHorse, true, true)
    SetModelAsNoLongerNeeded(model)
    while not PedReadyToRender(wildHorse) do 
        Citizen.Wait(1)
    end

    -- Définir le comportement agressif : 
    -- Quand le joueur est trop proche, attaquer ou charger

    Citizen.InvokeNative(0x9F7794730795E019, wildHorse, 17, true) -- Set the horse to flee from danger
    Citizen.InvokeNative(0xAE6004120C18DF97, wildHorse, 0, true) -- Set PED_LASSO_HOGTIE_FLAG 
    Citizen.InvokeNative(0xAEB97D84CDF3C00B, wildHorse, true) -- _SET_ANIMAL_IS_WILD

    SetBlockingOfNonTemporaryEvents(wildHorse, false)  -- Set environment can affect the horse

    -- Comportement agressif du cheval
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local playerPed = PlayerPedId()
            local horseCoords = GetEntityCoords(wildHorse)
            local playerCoords = GetEntityCoords(playerPed)
            local dist = #(playerCoords - horseCoords)
            
            if dist < 5.0 then  -- Si le joueur est trop proche
                -- Attaque agressive du cheval
                TaskCombatPed(wildHorse, playerPed, 0, 16)  -- Le cheval combat le joueur
                SetEntityHealth(wildHorse, 100)  -- Optionnel, en cas de modification de la santé du cheval
                Citizen.Wait(5000)  -- Attente avant que le cheval arrête de combattre (temps d'attaque)
            else
                -- Si pas de combat, se déplacer de façon naturelle
                MoveInArea(wildHorse, horseCoords.x, horseCoords.y, horseCoords.z, 20)  -- Se déplace dans une zone de rayon 20
            end
        end
    end)

    SetEntityVisible(wildHorse, true, 0)  -- Spawn horse
end

-- Test Spawn Command
if Config.Debug then
    RegisterCommand("spawnWildHorse", function(source, args, rawCommand) -- 
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))  -- Get player coordinates
        local heading = math.random(1, 359)
        local horseModel = args[1] and GetHashKey(args[1]) or GetHashKey("A_C_Horse_Arabian_White")
        SpawnHorse(x, y, z, heading, horseModel)
    end, false)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Frequency)
        if not IsEntityDead(PlayerPedId()) then
            for k,v in pairs(Spawns) do 
                for l,c in pairs(v.locations) do        
                    -- Check if player has entered one of the spawn zones
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local dist = #(playerCoords - c)
                    if dist < Radius then  -- Check if within the spawn radius
                        local max = SpawnChance(v.spawnChance)
                        local rdm = math.random(1, max)
                        -- Up to 5% chance for horse to spawn
                        if rdm == 12 then                    
                            

                            local x, y, z = table.unpack(c)  -- Unpack the coordinates table from the config
                            local cnt = 1  -- Max number of horses to spawn variable.  Defaults to 1

                            -- Randomize the number of horses spawned based on config
                            if (v.maxHorses > 1 and v.maxHorses <= 5) then
                                cnt = math.random(v.minHorses, v.maxHorses)  -- Minimum and maximum horses per spawn
                            end

                            -- Spawn the horse(s) as a herd
                            for i = 1, cnt, 1
                            do
                                -- Calculer un décalage sur les axes pour éviter les positions trop proches
                                local offsetX = math.random(-10, 10)  -- Décalage X
                                local offsetY = math.random(-10, 10)  -- Décalage Y
                                local heading = math.random(1, 359)  -- Direction aléatoire
                                local horserdm = math.random(1, #v.horses)  -- Modèle aléatoire du cheval
                                local horsemodel = v.horses[horserdm]
                                local newx = x + offsetX  -- Position X finale
                                local newy = y + offsetY  -- Position Y finale
                                SpawnHorse(newx, newy, z, heading, horsemodel)  -- Créer le cheval
                            end
                            
                            wildHorseRolled = true
                            -- Player Notification
                            if Config.NotificationOn then 
                                PlayerTip()
                            end
                        end
                    else
                        wildHorseRolled = false
                    end
                    if wildHorseRolled then break end  -- Break loop because horse spawned
                end
                if wildHorseRolled then
                    Citizen.Wait(Delay) -- Wait time to reset Horse Spawn
                    wildHorseRolled = false -- Reset Horse Spawn
                    break
                end
            end
        end
    end
end)
end
print('^2Natural Horse by ^3XaVar0')
