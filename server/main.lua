ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


------- Boire 
RegisterNetEvent('buyEau')
AddEventHandler('buyEau', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local sourceItem = xPlayer.getInventoryItem('water')


      if xPlayer.getMoney() >= 45 then 
        if sourceItem.limit ~= -1 and (sourceItem.count) > sourceItem.limit then
            TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez de place dans votre ~g~inventaire!")
        else 
             xPlayer.removeMoney(45)
            xPlayer.addInventoryItem('water', 1)
            TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter de ~g~l\'eau~w~ pour ~g~45$")
        end
        else 
            TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")

        end
    end)
    RegisterNetEvent('buyCafe')
    AddEventHandler('buyCafe', function()
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        local sourceItem = xPlayer.getInventoryItem('cafe')
    
    
          if xPlayer.getMoney() >= 45 then 
            if sourceItem.limit ~= -1 and (sourceItem.count) > sourceItem.limit then
                TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez de place dans votre ~g~inventaire!")
            else 
                 xPlayer.removeMoney(45)
                xPlayer.addInventoryItem('cafe', 1)
                TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter un ~g~cafe~w~ pour ~g~45$")
            end
            else 
                TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
    
            end
        end)
        RegisterNetEvent('buyCafe')
        AddEventHandler('buyCafe', function()
            local _source = source
            local xPlayer = ESX.GetPlayerFromId(_source)
            local sourceItem = xPlayer.getInventoryItem('water')
        
        
              if xPlayer.getMoney() >= 45 then 
                if sourceItem.limit ~= -1 and (sourceItem.count) > sourceItem.limit then
                    TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez de place dans votre ~g~inventaire!")
                else 
                     xPlayer.removeMoney(45)
                    xPlayer.addInventoryItem('water', 1)
                    TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter un ~g~cafe~w~ pour ~g~45$")
                end
                else 
                    TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
        
                end
            end)

            RegisterNetEvent('buyCupCake')
            AddEventHandler('buyCupCake', function()
                local _source = source
                local xPlayer = ESX.GetPlayerFromId(_source)
                local sourceItem = xPlayer.getInventoryItem('cake')
            
            
                  if xPlayer.getMoney() >= 45 then 
                    if sourceItem.limit ~= -1 and (sourceItem.count) > sourceItem.limit then
                        TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez de place dans votre ~g~inventaire!")
                    else 
                         xPlayer.removeMoney(45)
                        xPlayer.addInventoryItem('cake', 1)
                        TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter un ~g~CupCake~w~ pour ~g~45$")
                    end
                    else 
                        TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
            
                    end
                end)


                RegisterNetEvent('buyHamburger')
                AddEventHandler('buyHamburger', function()
                    local _source = source
                    local xPlayer = ESX.GetPlayerFromId(_source)
                    local sourceItem = xPlayer.getInventoryItem('hambburger')
                
                
                      if xPlayer.getMoney() >= 45 then 
                        if sourceItem.limit ~= -1 and (sourceItem.count) > sourceItem.limit then
                            TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez de place dans votre ~g~inventaire!")
                        else 
                             xPlayer.removeMoney(45)
                            xPlayer.addInventoryItem('hambburger', 1)
                            TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter un ~g~Hamburger~w~ pour ~g~45$")
                        end
                        else 
                            TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
                
                        end
                    end)