local QBCore = exports['qb-core']:GetCoreObject()

-- Useful Events --

--[[
if Config.Framework.Logs then
    User Purchased Item Log
    TriggerEvent('qb-log:server:CreateLog', 'constantdevelopmentclosedshops', 'User Purchased Item', 'green', '**Constant Development** **Player : **'..GetPlayerName(src)..'\n**Item : **'..Item..' **Amount : **'..Amount.. ' **Cost : ** '..Cost)
    User Stocked Item Log
    TriggerEvent('qb-log:server:CreateLog', 'constantdevelopmentclosedshops', 'User Stocked Item', 'green', '**Constant Development** **Player : **'..GetPlayerName(src)..'\n**Item : **'..Item..' **Amount : **'..Amount.. ' **Cost : ** '..Cost)
    User Un-Stocked Item Log
    TriggerEvent('qb-log:server:CreateLog', 'constantdevelopmentclosedshops', 'User Removed Item', 'green', '**Constant Development** **Player : **'..GetPlayerName(src)..'\n**Item : **'..Item..' **Amount : **'..Amount.. ' **Cost : ** '..Cost)
end
]]

-- Variables --

local isCleanMoneyCoolDownActive = false

-- Functions --

local function ConstantDevelopmentPostOPNotifications(notifType, message, title)
    local src = source
    if Config.Notifications == 'qb' or 'tnj' then
        if notifType == 1 then
            TriggerClientEvent('QBCore:Notify', src, message, 'success')
        elseif notifType == 2 then
            TriggerClientEvent('QBCore:Notify', src, message, 'primary')
        elseif notifType == 3 then
            TriggerClientEvent('QBCore:Notify', src, message, 'error')
        end
    elseif Config.Notifications == 'okok' then
        if notifType == 1 then
            TriggerClientEvent('okokNotify:Alert', src, title, message, 5000, 'success')
        elseif notifType == 2 then
            TriggerClientEvent('okokNotify:Alert', src, title, message, 5000, 'info')
        elseif notifType == 3 then
            TriggerClientEvent('okokNotify:Alert', src, title, message, 5000, 'error')
        end
    elseif Config.Notifications == 'mythic' then
        if notifType == 1 then
            TriggerClientEvent('mythic_notify:client:SendAlert:custom', src, { type = 'success', text = message, length = 5000})
        elseif notifType == 2 then
            TriggerClientEvent('mythic_notify:client:SendAlert:custom', src, { type = 'inform', text = message, length = 5000})
        elseif notifType == 3 then
            TriggerClientEvent('mythic_notify:client:SendAlert:custom', src, { type = 'error', text = message, length = 5000})
        end
    elseif Config.Notifications == 'chat' then
        TriggerClientEvent('chatMessage', src, message)
    end
end

-- Events --

RegisterNetEvent('cr-postop:server:CleanMarkedMoney', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MarkedBills = Player.Functions.GetItemByName('markedbills')
    local MoneyAmount = MarkedBills.info.worth
    if MarkedBills then
        Player.Functions.RemoveItem('markedbills', 1)
        Player.Functions.AddMoney('cash', MoneyAmount)
    else
        ConstantDevelopmentPostOPNotifications(3, "You don\'t seem to have Marked Money on you at this time...", Config.PostOP.System.NotificationTitle)
    end
end)

RegisterNetEvent('cr-postop:server:SetCleanMoneyCooldown')
AddEventHandler('cr-postop:server:SetCleanMoneyCooldown', function()
    isCleanMoneyCoolDownActive = true
    Wait((15 * 1000) * 60)
    isCleanMoneyCoolDownActive = false
end)

-- Callbacks --

QBCore.Functions.CreateCallback("cr-postop:server:CleanMoneyCooldown",function(_, cb)
    if isCleanMoneyCoolDownActive then
        cb(true)
    else
        cb(false)
    end
end)

-- Commands --

-- Threads --
