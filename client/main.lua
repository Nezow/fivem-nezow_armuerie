local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
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
        Citizen.Wait(1)
        ESX.ShowAdvancedNotification("Armurie", "Vous avez acheter un ~b~Couteau", "", "CHAR_ARTHUR", 1)
        print("achat effectué by nezow")
    elseif item == bat then
    	TriggerServerEvent('buyBat')
    	Citizen.Wait(1)
    	ESX.ShowAdvancedNotification("Armuerie", "Vous avez acheter une ~b~Bat", "", "CHAR_ARTHUR", 1)
        print("achat effectué by nezow")
    elseif item == golfclub then
    	TriggerServerEvent('buyGolfclub')
    	Citizen.Wait(1)
    	ESX.ShowAdvancedNotification("Armuerie", "Vous avez achetez un ~b~Club de Golf", "", "CHAR_ARTHUR", 1)
        print("achat effectué by nezow")
    elseif item == crowbar then
    	TriggerServerEvent('buyCrowbar')
    	Citizen.Wait(1)
    	ESX.ShowAdvancedNotification("Armuerie", "Vous avez achetez un Pied de Biche", "", "CHAR_ARTHUR", 1)
        print("achat effectué by nezow")
        end
    end
end

AddArmurieMenu(mainMenu)
_menuPool:RefreshIndex()

local nezow = {
	{title="Armuerie", colour=1, id=313, x = -662.1002197265625, y = -935.2487182617188, z = 20.856788635253906}
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
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(nezow) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, nezow[k].x, nezow[k].y, nezow[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur [~g~E~w~] pour ouvrir l'~g~armurie")
                print("by nezow")
				if IsControlJustPressed(1,51) then 
                    mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)
