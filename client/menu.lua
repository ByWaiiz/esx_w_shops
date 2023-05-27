local Keys = {
	["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57
}

ESX = nil 

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
    
    AddEventHandler('esx:onPlayerDeath', function()
	isDead = true
	_menuPool:CloseAllMenus()
	NativeUI.CloseAll()
end)
-------------------# Menu Principal #-------------------
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("", "Superette", nil, nil, "shopui_title_conveniencestore", "shopui_title_conveniencestore",true)
_menuPool:Add(mainMenu)


---------------------# Sub Menu #----------------------

function AddShopsMenu(menu)
    local shopsmenu = _menuPool:AddSubMenu(menu, "Boire","",true,true,true)

    local shopsmenu2 = _menuPool:AddSubMenu(menu, "Manger","",true,true,true)

    local eau = NativeUI.CreateItem("Eau", "Acheter une Bouteille de l'eau pour ~g~45$")
    shopsmenu.SubMenu:AddItem(eau)
    eau:RightLabel(" →")

    local coffe = NativeUI.CreateItem("Café", "Acheter un Café pour ~g~50$")
    shopsmenu.SubMenu:AddItem(coffe)
    coffe:RightLabel(" →")

    local hamburger = NativeUI.CreateItem("Hamburger", "Acheter un Hamburger pour ~g~50$")
    shopsmenu2.SubMenu:AddItem(hamburger)
    hamburger:RightLabel(" →")

    local cupcake = NativeUI.CreateItem("CupCake", "Acheter un CupCake pour ~g~60$")
    shopsmenu2.SubMenu:AddItem(cupcake)
    cupcake:RightLabel(" →")



    shopsmenu.SubMenu.OnItemSelect = function(menu, item)
    if item == eau then
            TriggerServerEvent('buyEau')
            Citizen.Wait(1)
        elseif item == coffe then
            TriggerServerEvent('buyCafe')
            Citizen.Wait(1)

            end
    end
    
    shopsmenu2.SubMenu.OnItemSelect = function(menu, item)
    if item == pain then
            TriggerServerEvent('buyHamburger')
            Citizen.Wait(1)
    elseif item == cupcake then
            TriggerServerEvent('buyCupCake')
            Citizen.Wait(1)

                 end

        end
end



AddShopsMenu(mainMenu)
_menuPool:RefreshIndex()


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        local playerCoords = GetEntityCoords(PlayerPedId())

        for k, v in pairs(Config.Shops_Config.Positions) do
            local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

            if distance < 10.0 then
                actualZone = v

                zoneDistance = GetDistanceBetweenCoords(playerCoords, actualZone.x, actualZone.y, actualZone.z, true)

              --  DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, --Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
            end
            
            if distance <= 1.5 then
                ESX.ShowHelpNotification('Appuyez sur ~INPUT_TALK~ pour parlez avec ~g~Apu')

                if IsControlJustPressed(1, 51) then
                    mainMenu:Visible(not mainMenu:Visible())
                end
            end

            if zoneDistance ~= nil then
                if zoneDistance > 1.5 then
                    _menuPool:CloseAllMenus()
                end
            end
        end
    end
end)
---------------------# Map #---------------------


Citizen.CreateThread(function()
    for k, v in pairs(Config.Shops_Config.Positions) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)

        SetBlipSprite(blip, 52)
        SetBlipScale (blip, 0.8)
        SetBlipColour(blip, 3)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Superette")
        EndTextCommandSetBlipName(blip)
    end
end)