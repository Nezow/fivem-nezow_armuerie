ESX = nil

print("By nezow")

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('buyKnife')
AddEventHandler('buyKnife', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1550
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_KNIFE', 1)
end)

RegisterNetEvent('buyBat')
AddEventHandler('buyBat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 950
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_BAT', 1)
end)

RegisterNetEvent('buyGolfclub')
AddEventHandler('buyGolfclub', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1150
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_GOLFCLUB', 1)
end)

RegisterNetEvent('buyCrowbar')
AddEventHandler('buyCrowbar', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 2000
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_CROWBAR', 1)
end)
