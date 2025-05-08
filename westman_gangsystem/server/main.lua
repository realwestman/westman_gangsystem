ESX = exports[Config.Engine]:getSharedObject()

for GangName, GangConfig in pairs(Gangs) do 
  if type(GangConfig) == "table" then
       stash = GangConfig.Stash
       armory = GangConfig.Armory
  end
end


RegisterServerEvent("westman_gangz:Armories", function(hash, cost, value)
  local src = source 
  local ped = GetPlayerPed(src)
  local xPlayer = ESX.GetPlayerFromId(src)
  local PlayerPedCoords = GetEntityCoords(ped)

  local GangConfig = Gangs[xPlayer.getJob().name]
  if not GangConfig or not GangConfig.Armory then return end
  
  local distance = #(PlayerPedCoords - GangConfig.Armory)


  if hash and cost and value then
      cost = cost * value 

      if xPlayer then 
        if distance <= 5.0 then 
              if Config.MoneyType == 'money' and xPlayer.getMoney() >= cost then 
                  xPlayer.removeMoney(cost)
                  xPlayer.addInventoryItem(hash, value)
                  local itemLabel = ESX.GetItemLabel(hash)
                  xPlayer.showNotification(""..Strings.YouBought.." "..value.." "..itemLabel.." "..Strings.For.." "..cost..""..Strings.Currency.."")
              elseif Config.MoneyType == 'bank' and xPlayer.getAccount('bank').money >= cost then
                  xPlayer.removeAccountMoney('bank', cost)
                  xPlayer.addInventoryItem(hash, value)
                  local itemLabel = ESX.GetItemLabel(hash)
                  xPlayer.showNotification(""..Strings.YouBought.." "..value.." "..itemLabel.." "..Strings.For.." "..cost..""..Strings.Currency.."")
              else
                  xPlayer.showNotification(Strings.NoMoney)
              end
          end
      end
  end
end)


if Config.OxInventory then
AddEventHandler('onServerResourceStart', function(resourceName)
  if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
      exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner)
  end
end)
end