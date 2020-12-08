ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Wait(0)
    end
end)

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Armurie","")
_menuPool:Add(mainMenu)

function AddArmurieMenu(menu)
	local armuriemenu = _menuPool:AddSubMenu(menu, "Arme blanche", nil, nil, "shopui_title_conveniencestore", "shopui_title_conveniencestore")

    local knife = NativeUI.CreateItem("~g~Couteau", "")
    armuriemenu.SubMenu:AddItem(knife)
    knife:RightLabel("~g~1550$")

    local crowbar = NativeUI.CreateItem("~g~Pied de Biche", "")
    armuriemenu.SubMenu:AddItem(crowbar)
    crowbar:RightLabel("~g~2000")

    local golfclub = NativeUI.CreateItem("~g~Club de Golf", "")
    armuriemenu.SubMenu:AddItem(golfclub)
    golfclub:RightLabel("~g~1150")

    local bat = NativeUI.CreateItem("~g~Bat", "")
    armuriemenu.SubMenu:AddItem(bat)
    bat:RightLabel("~g~950")

    armuriemenu.SubMenu.OnItemSelect = function(menu, item)
    if item == knife then
        TriggerServerEvent('buyKnife')
        ESX.ShowAdvancedNotification("Armurie", "Vous avez acheter un ~b~Couteau", "", "CHAR_ARTHUR", 1)
    elseif item == bat then
    	TriggerServerEvent('buyBat')
    	ESX.ShowAdvancedNotification("Armuerie", "Vous avez acheter une ~b~Bat", "", "CHAR_ARTHUR", 1)
    elseif item == golfclub then
    	TriggerServerEvent('buyGolfclub')
    	ESX.ShowAdvancedNotification("Armuerie", "Vous avez achetez un ~b~Club de Golf", "", "CHAR_ARTHUR", 1)
    elseif item == crowbar then
    	TriggerServerEvent('buyCrowbar')
    	ESX.ShowAdvancedNotification("Armuerie", "Vous avez achetez un Pied de Biche", "", "CHAR_ARTHUR", 1)
        end
    end
end

AddArmurieMenu(mainMenu)
_menuPool:RefreshIndex()

local nezow = {
	{title="Armurerie", colour=1, id=313, x = -662.10, y = -935.24, z = 20.85}
}

Citizen.CreateThread(function()
    for _, info in pairs(nezow) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.8)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        local arm = false
        _menuPool:ProcessMenus()
        for k in pairs(nezow) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, nezow[k].x, nezow[k].y, nezow[k].z)
            if dist <= 1.2 then
                arm = true
                ESX.ShowHelpNotification("Appuyez sur [~g~E~w~] pour ouvrir l'~g~armurerie")
				if IsControlJustPressed(1,51) then 
                    mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
        if arm then
            Wait(1)
        else
            Wait(400)
        end
    end
end)
