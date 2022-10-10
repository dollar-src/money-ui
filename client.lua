local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
moneywash = function ()
    



    QBCore.Functions.TriggerCallback('getitemcount', function(cb)

    
        SendNUIMessage({action = 'userpanelui'})
           SetNuiFocus(true, true)
   
           SendNUIMessage({
               currentitemamount = cb
           })
       end)

    end
    

    RegisterNUICallback('CloseMenu:NuiCallback', function(data)

        SetNuiFocus(false, false)
 
         end)
         


         CreateThread(function()
            while true do
                Wait(1)
                letSleep = true
               if PlayerJob.name == Config.Job  then
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed, true)
                    for k, v in pairs(Config.Locations) do
                        local loc = #(playerCoords - v)
                        if loc < 3.0 then
                            letSleep = false
                            if loc < 2.0 then
                                DrawText3Ds(v.x, v.y, v.z+0.40, '~g~E~w~ - Wash Money')
                                if IsControlJustPressed(0, 38) then
        
                                    moneywash()             
                                       end
                            end
                        end
                    end
                else
                    letSleep = false
                end
          
                if letSleep then
                    Wait(1000)
                end
            end
          end)

          RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
          AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
              PlayerJob = QBCore.Functions.GetPlayerData().job
          end)
          
          RegisterNetEvent('QBCore:Client:OnJobUpdate')
          AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
              PlayerJob = JobInfo
          end)
          
          
          AddEventHandler("onResourceStart", function(JobInfo)
              PlayerJob = QBCore.Functions.GetPlayerData().job
          end)
          

          function DrawText3Ds(x, y, z, text)
            SetTextScale(0.35, 0.35)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 215)
            SetTextEntry("STRING")
            SetTextCentre(true)
            AddTextComponentString(text)
            SetDrawOrigin(x,y,z, 0)
            DrawText(0.0, 0.0)
            local factor = (string.len(text)) / 370
            DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
            ClearDrawOrigin()
        end
        

        RegisterNUICallback('dollar:sa', function(data)
   
            QBCore.Functions.TriggerCallback('getitemcount', function(cb)
        
                if tonumber(data.input) == nil then
                    QBCore.Functions.Notify("Value cannot be nil" , 'error', 2500)
                      elseif tonumber(data.input) == 0  then
                        QBCore.Functions.Notify("Value cannot be 0" , 'error', 2500)
                      elseif  tonumber(data.input) < 0 then
                        QBCore.Functions.Notify("Value cannot be less than 0" , 'error', 2500)

               
         
                else
         
                    data01 =  (data.input * 25)  / 100
                    totalwashmoney = data.input - data01
            
        TriggerServerEvent('dollarwash:sendserver', totalwashmoney , data.input)

        
        
                
                end
        
        
        
            end)
        end)
