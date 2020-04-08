ESX = nil

print("By nezow")

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('buyKnife')
AddEventHandler('buyKnife', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceKnife
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_KNIFE', 1)
end)

RegisterNetEvent('buyBat')
AddEventHandler('buyBat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceBat
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_BAT', 1)
end)

RegisterNetEvent('buyGolfclub')
AddEventHandler('buyGolfclub', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceGlofclub
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_GOLFCLUB', 1)
end)

RegisterNetEvent('buyCrowbar')
AddEventHandler('buyCrowbar', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCrowbar
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_CROWBAR', 1)
end)

RegisterServerEvent('nezow_armuerie:remove')
AddEventHandler('nezow_armuerie:remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('nezow_armuerie:clipcli', source)
end)
