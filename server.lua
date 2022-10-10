

local QBCore = exports['qb-core']:GetCoreObject()



QBCore.Functions.CreateCallback('getitemcount', function(source, cb)
    itemcount = 0
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)
   
   local playerItem = Player.Functions.GetItemByName(Config.Item)
   
   if playerItem ~= nil then
       itemcount = playerItem.amount
   else
    
   end
   
   
   cb(itemcount)
   itemcount = 0
   
   
   end)


   

   
RegisterServerEvent('dollarwash:sendserver', function (money, data01)


    local src = source
    local b = QBCore.Functions.GetPlayer(src)
    local playerItem = b.Functions.GetItemByName(Config.Item)
    local asdjasd = b.PlayerData.money["cash"]
 

    if playerItem == nil then
        TriggerClientEvent('QBCore:Notify', src, "Not enough items ", "error")


    else
 

    if playerItem.amount < tonumber(data01) then
        TriggerClientEvent('QBCore:Notify', src, "Not enough items ", "error")

    else
        TriggerClientEvent('QBCore:Notify', src,"Added".." ".. tonumber(money), "success")

        b.Functions.AddMoney('bank', money)
        b.Functions.RemoveItem(Config.Item, tonumber(data01))

        
    end
end
end)