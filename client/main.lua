ESX = exports[Config.Engine]:getSharedObject()

local blips = {}
local PlayerData = {}


RegisterNetEvent('esx:playerLoaded', function(data)
    PlayerData = data
    RefreshGangBlips()
end)

RegisterNetEvent('esx:setJob', function(job)
    PlayerData.job = job
    RefreshGangBlips()
end)


 function AddGangBlip(jobName, blipConfig)
    local blip = AddBlipForCoord(blipConfig.coords.x, blipConfig.coords.y, blipConfig.coords.z)
    SetBlipSprite(blip, blipConfig.id)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, blipConfig.color)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(blipConfig.name)
    EndTextCommandSetBlipName(blip)

    blips[jobName] = blip
end

 function RemoveGangBlip(jobName)
    if blips[jobName] then
        RemoveBlip(blips[jobName])
        blips[jobName] = nil
    end
end


function RefreshGangBlips()
    for GangName, GangConfig in pairs(Gangs) do
        local ShouldShow = PlayerData.job and PlayerData.job.name == GangConfig.JobName and GangConfig.Blip.show
        local BlipExists = blips[GangConfig.JobName] ~= nil

        if ShouldShow and not BlipExists then
            AddGangBlip(GangConfig.JobName, GangConfig.Blip)
        elseif not ShouldShow and BlipExists then
            RemoveGangBlip(GangConfig.JobName)
        end
    end
end


CreateThread(function()
    while not ESX.IsPlayerLoaded() do 
      Wait(100) 
    end
    PlayerData = ESX.GetPlayerData()
    RefreshGangBlips()
end)


CreateThread(function()
  while not PlayerData or not PlayerData.job do 
    Wait(100) 
  end

  while true do
      for GangName, GangConfig in pairs(Gangs) do
          local ShouldShow = PlayerData.job.name == GangConfig.JobName and GangConfig.Blip.show
          local BlipExists = blips[GangConfig.JobName] ~= nil

          if ShouldShow and not BlipExists then
              local blip = AddBlipForCoord(GangConfig.Blip.coords.x, GangConfig.Blip.coords.y, GangConfig.Blip.coords.z)
              SetBlipSprite(blip, GangConfig.Blip.id)
              SetBlipDisplay(blip, 4)
              SetBlipScale(blip, 1.0)
              SetBlipColour(blip, GangConfig.Blip.color)
              SetBlipAsShortRange(blip, true)
              BeginTextCommandSetBlipName("STRING")
              AddTextComponentSubstringPlayerName(GangConfig.Blip.name)
              EndTextCommandSetBlipName(blip)
              blips[GangConfig.JobName] = blip
          elseif not ShouldShow and GangConfig then
              RemoveBlip(blips[GangConfig.JobName])
              blips[GangConfig.JobName] = nil
          end
      end
      Wait(2500)
  end
end)


CreateThread(function()
  while true do 
   local sleep = 2000
   local PlayerPed = PlayerPedId()
   local PlayerPedCoords = GetEntityCoords(PlayerPed)

    for _, i in pairs(Gangs) do
     
    VehicleSpawn = i.VehicleSpawn 
    VehicleSpawnHeading = i.VehicleSpawnHeading
    local distance =  #(PlayerPedCoords - i.Armory)
    local distance2 = #(PlayerPedCoords - i.Garage)
    local distance3 = #(PlayerPedCoords - i.BossMenu)
    local distance4 = #(PlayerPedCoords - i.Stash.coords)
    local distance5 = #(PlayerPedCoords - i.StoreVehicle)
    local distance6 = #(PlayerPedCoords - i.Wardrobe)
   
    if PlayerData.job and PlayerData.job.name == i.JobName then
    
      if distance <= 3.0 then
        sleep = 1
        DrawMarker(25, i.Armory.x, i.Armory.y, i.Armory.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 141, 255, 100, false, true, 2, nil, nil, false)
        DrawText3D(i.Armory.x, i.Armory.y, i.Armory.z, ""..Strings.OpenArmoryMenu.."")
        if IsControlJustReleased(0, 38) then
          OpenArmoryMenu()
        end
      end
  
        if distance2 <= 3.0 then
          sleep = 1
          DrawMarker(25, i.Garage.x, i.Garage.y, i.Garage.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 141, 255, 100, false, true, 2, nil, nil, false)
          DrawText3D(i.Garage.x, i.Garage.y, i.Garage.z, ""..Strings.OpenGarageMenu.."")
          if IsControlJustReleased(0, 38) then
            OpenGarageMenu()
          end
        end
  
      if distance3 <= 2.5 then 
        sleep = 1
        DrawMarker(25, i.BossMenu.x, i.BossMenu.y, i.BossMenu.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 141, 255, 100, false, true, 2, nil, nil, false)
        DrawText3D(i.BossMenu.x, i.BossMenu.y, i.BossMenu.z, ""..Strings.OpenBossMenu.."")
        if IsControlJustReleased(0, 38) then
        Config.BossMenuExport()
        end 
      end

      if IsPedInAnyVehicle(PlayerPed) and distance5 <= 2.5 then
        sleep = 1
        DrawMarker(6, i.StoreVehicle.x, i.StoreVehicle.y, i.StoreVehicle.z - 0.99, 0.0, 0.0, 0.0, 270.0, 0.0, 0.0, 3.0, 3.0, 3.0, 0, 141, 255, 100, false, true, 2, false, false, false, false)
        DrawText3D(i.StoreVehicle.x, i.StoreVehicle.y, i.StoreVehicle.z, ""..Strings.StoreVehicle.."")
        if IsControlJustPressed(0, 38) then 
          ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPed))
          ESX.ShowNotification(Strings.VehicleIsNowInGarage)
      end
  end

      if distance4 <= 2.5 then 
        sleep = 1
        DrawMarker(25, i.Stash.coords.x, i.Stash.coords.y, i.Stash.coords.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 141, 255, 100, false, true, 2, nil, nil, false)
        DrawText3D(i.Stash.coords.x, i.Stash.coords.y, i.Stash.coords.z, ""..Strings.OpenStash.."")
        if IsControlJustReleased(0, 38) then
          if Config.OxInventory then
            exports.ox_inventory:openInventory('stash', {id=""..i.JobName..""})
          else
            print("[ERROR] YOU DON'T HAVE ox_inventory configurated")
          end
        end
      end

      if distance6 <= 2.5 then 
        sleep = 1 
        DrawMarker(25, i.Wardrobe.x, i.Wardrobe.y, i.Wardrobe.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 141, 255, 100, false, true, 2, nil, nil, false)
        DrawText3D(i.Wardrobe.x, i.Wardrobe.y, i.Wardrobe.z, ""..Strings.OpenWardrobe.."")
        if IsControlJustReleased(0, 38) then 
          Config.WardrobeEvent()
        end
      end

    end
  end
    Wait(sleep)
  end
end)
    
  
function OpenGarageMenu()
  local PlayerJob = PlayerData.job and PlayerData.job.name

    local GangConfig = Gangs[PlayerJob]
    if not GangConfig then
        ESX.ShowNotification(Strings.GarageError) 
        return
    end

    local vehicles = GangConfig.GarageVehicles or {}
    local GangName = GangConfig.Blip.name or "Gang"
    
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), Strings.Garage, {
        title = GangName .. " - " .. Strings.Garage,
        align = 'center',
        elements = vehicles
    }, function(data, menu)
        local SelectedVehicle = data.current.hash
        if SelectedVehicle then
            TriggerEvent("westman_gangz:Garage", SelectedVehicle, data.current.label)
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

RegisterNetEvent("westman_gangz:Garage", function(hash, label)
  local PlayerJob = PlayerData.job and PlayerData.job.name
  local GangConfig = Gangs[PlayerJob] 

  if GangConfig then
      local VehicleSpawn = GangConfig.VehicleSpawn
      local VehicleSpawnHeading = GangConfig.VehicleSpawnHeading
      
      if not IsPositionOccupied(VehicleSpawn.x, VehicleSpawn.y, VehicleSpawn.z, 5.0, false, true, false, nil, nil, 0, nil) then
          ESX.Game.SpawnVehicle(hash, VehicleSpawn, VehicleSpawnHeading, function()
              ESX.ShowNotification(""..Strings.RolledOutVehicle.." "..label.." ")
          end)
      else
          ESX.ShowNotification(Strings.VehicleIsInTheWay)
      end
  else
      ESX.ShowNotification("[ERROR] No vehicle spawn found for this gang. Please check your configuration")
  end
end)

 function OpenArmoryMenu()
  local PlayerJob = PlayerData.job and PlayerData.job.name
  local GangConfig = Gangs[PlayerJob]

  if GangConfig then 
    local elements = GangConfig.ArmoryItems
    local GangName = GangConfig.Blip.name 

    if elements and #elements > 0 then  -- Kontrollera om det finns armory-items
      ESX.UI.Menu.Open("default", GetCurrentResourceName(), Strings.ArmoryMenu, {
        title = GangName .. " - " .. Strings.ArmoryMenu, 
        align = 'center',  
        elements = elements 
      }, function(data, menu) 
        local SelectedItem = data.current
        if SelectedItem then
          TriggerServerEvent("westman_gangz:Armories", SelectedItem.hash, SelectedItem.cost, SelectedItem.value)
          menu.close()
        end
      end, function(data, menu)
        ESX.ShowNotification(Strings.ClosedDownMenu)
        menu.close()
      end) 
    else
      ESX.ShowNotification(Strings.ArmoryError)
    end
  else
    ESX.ShowNotification(Strings.ArmoryEmpty)
  end
end

