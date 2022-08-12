local QBCore = exports['qb-core']:GetCoreObject()

-- Variables --

local HiddenRoomBoxMoved = false
local onDuty = false
local PlayerJob = nil

-- Action Checks --

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.name == "postop" then
            onDuty = PlayerJob.onduty
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    if PlayerJob.name == Config.PostOP.System.JobName then
        TriggerEvent('cr-postop:client:ToggleSpawnInDuty')
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

-- Functions --

local function ConstantDevelopmentPostOPNotifications(notifType, message, title)
	if Config.Framework.Notifications == 'QBCore' then
		if notifType == 1 then
			QBCore.Functions.Notify(message, 'success')
		elseif notifType == 2 then
			QBCore.Functions.Notify(message, 'primary')
		elseif notifType == 3 then
			QBCore.Functions.Notify(message, 'error')
		end
	elseif Config.Framework.Notifications == "okok" then
		if notifType == 1 then
			exports['okokNotify']:Alert(title, message, 3000, 'success')
		elseif notifType == 2 then
			exports['okokNotify']:Alert(title, message, 3000, 'info')
		elseif notifType == 3 then
			exports['okokNotify']:Alert(title, message, 3000, 'error')
		end
	elseif Config.Framework.Notifications == "mythic" then
		if notifType == 1 then
			exports['mythic_notify']:DoHudText('success', message)
		elseif notifType == 2 then
			exports['mythic_notify']:DoHudText('inform', message)
		elseif notifType == 3 then
			exports['mythic_notify']:DoHudText('error', message)
		end
    elseif Config.Framework.Notifications == "tnj" then
        if notifType == 1 then
            exports['tnj-notify']:Notify(message, 'success', 3000)
		elseif notifType == 2 then
            exports['tnj-notify']:Notify(message, 'primary', 3000)
		elseif notifType == 3 then
            exports['tnj-notify']:Notify(message, 'error', 3000)
		end
	elseif Config.Framework.Notifications == 'chat' then
        if notifType == 1 then
            TriggerEvent('chatMessage', message)
		elseif notifType == 2 then
            TriggerEvent('chatMessage', message)
		elseif notifType == 3 then
            TriggerEvent('chatMessage', message)
		end
	end
end

local function CreatePostOPBlip(blipCoords, blipSprite, blipDisplay, blipScale, blipColour, blipName)
	local Blip = AddBlipForCoord(blipCoords)
	SetBlipSprite(Blip, blipSprite)
	SetBlipDisplay(Blip, blipDisplay)
	SetBlipScale(Blip, blipScale)
	SetBlipColour(Blip, blipColour)
	SetBlipAsShortRange(Blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName(blipName)
	EndTextCommandSetBlipName(Blip)
    if Config.Framework.Debug then
        print('Constant Development PostOP Delivery Activated')
    end
end

local function EnsurePedModel(pedModel)
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(10)
        if Config.Framework.Debug then
            print('Constant Development PostOP Delivery PED Requested')
        end
    end
end

local function CreatePedAtCoords(pedModel, coords, scenario, invincibility)
    if type(pedModel) == "string" then
        pedModel = GetHashKey(pedModel)
    end
    EnsurePedModel(pedModel)
    local ped = CreatePed(0, pedModel, coords.x, coords.y, coords.z - 1, coords.w, false, false)
    TaskStartScenarioInPlace(ped, scenario, -1, true) -- Task Scenario
    FreezeEntityPosition(ped, true) -- Freeze Position
    SetEntityVisible(ped, true) -- Toggles Visibility
    SetEntityInvincible(ped, invincibility) -- Invicible
    PlaceObjectOnGroundProperly(ped) -- Ground Check
    SetBlockingOfNonTemporaryEvents(ped, true) -- Blocking
    if Config.Framework.Debug then
        print('Constant Development PostOP Delivery PED Activated')
    end
    return ped
end

local function CreateProp(propCoords, propModel)
	local coords = propCoords
	PropModel = propModel
	RequestModel(PropModel)
	while not HasModelLoaded(PropModel) do
		Wait(3)
	end
	PropObject = CreateObject(PropModel, coords.x, coords.y, coords.z - 1, true, true)
	PlaceObjectOnGroundProperly(PropObject)
    SetEntityHeading(PropObject, coords.w)
	SetEntityInvincible(PropObject, true)
end

local function CreateSectorBlips(blipCoords, blipSprite, blipDisplay, blipScale, blipColour, blipName)
	local Blip = AddBlipForCoord(blipCoords)
	SetBlipSprite(Blip, blipSprite)
	SetBlipDisplay(Blip, blipDisplay)
	SetBlipScale(Blip, blipScale)
	SetBlipColour(Blip, blipColour)
	SetBlipAsShortRange(Blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName(blipName)
	EndTextCommandSetBlipName(Blip)
    if Config.Framework.Debug then
        print('Constant Development PostOP Delivery Activated')
    end
end

-- Events --

RegisterNetEvent("cr-postop:client:ToggleSpawnInDuty")
AddEventHandler("cr-postop:client:ToggleSpawnInDuty", function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    if PlayerJob.name == Config.PostOP.System.JobName and onDuty then
        TriggerServerEvent("QBCore:ToggleDuty")
        onDuty = false
    end
end)

RegisterNetEvent("cr-postop:client:ToggleDuty")
AddEventHandler("cr-postop:client:ToggleDuty", function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    if PlayerJob.name == Config.PostOP.System.JobName and onDuty then
        TriggerServerEvent("QBCore:ToggleDuty")
        onDuty = false
    elseif PlayerJob.name == Config.PostOP.System.JobName and not onDuty then
        TriggerServerEvent("QBCore:ToggleDuty")
        onDuty = true
    end
end)

RegisterNetEvent("cr-postop:client:ManagementMenu")
AddEventHandler("cr-postop:client:ManagementMenu", function()
    if PlayerJob.name == Config.PostOP.System.JobName and PlayerJob.isboss and PlayerJob.onduty then
        TriggerEvent('qb-bossmenu:client:OpenMenu')
    else
        ConstantDevelopmentPostOPNotifications(3, "You don\'t seem to know the Password...", Config.PostOP.System.NotificationTitle)
    end
end)

RegisterNetEvent("cr-postop:client:ManagementComputerMenu")
AddEventHandler("cr-postop:client:ManagementComputerMenu", function()
    exports['qb-menu']:openMenu( { {
        id = 1,
        header = "Management Computer",
        isMenuHeader = true
    }, {
        id = 2,
        header = "Toggle Duty",
        txt = "Toggle onto Duty and or Off Duty...",
        params = { event = "cr-postop:client:ToggleDuty", }
    }, {
        id = 3,
        header = "View Management System",
        txt = "Open and View Management Database System",
        params = { event = "cr-postop:client:ManagementMenu", }
    }, {
        id = 4,
        header = "Close",
        txt = "Turn Off the Computer",
        params = { event = "qb-menu:closeMenu" }
    } } )
end)

RegisterNetEvent("cr-postop:client:OpenManagementClothing")
AddEventHandler("cr-postop:client:OpenManagementClothing", function()
    if PlayerJob.name == Config.PostOP.System.JobName and PlayerJob.onduty and PlayerJob.grade.level >= Config.PostOP.System.GradeLevelRequirement then
        if Config.Framework.Clothing == 'fivem-appearance' then
            TriggerEvent('fivem-appearance:client:OpenClothingRoom')
        elseif Config.Framework.Clothing == 'qb' then
            TriggerEvent('qb-clothing:client:openClothingBoothMenu')
        end
    else
        ConstantDevelopmentPostOPNotifications(3, "It seems as if this isn\'t your Clothes...", Config.PostOP.System.NotificationTitle)
    end
end)

RegisterNetEvent("cr-postop:client:OpenRoomClothing")
AddEventHandler("cr-postop:client:OpenRoomClothing", function()
    if PlayerJob.name == Config.PostOP.System.JobName and PlayerJob.isboss then
        if Config.Framework.Clothing == 'fivem-appearance' then
            TriggerEvent('b-clothing:client:openOutfitMenu')
        elseif Config.Framework.Clothing == 'qb' then
            TriggerEvent('qb-clothing:client:openOutfitMenu')
        end
    else
        ConstantDevelopmentPostOPNotifications(3, "It seems as if this isn\'t your Clothes...", Config.PostOP.System.NotificationTitle)
    end
end)

RegisterNetEvent("cr-postop:client:OpenStash")
AddEventHandler("cr-postop:client:OpenStash", function(StashName, StashWeight, StashSize)
    if PlayerJob.name == Config.PostOP.System.JobName and PlayerJob.onduty and PlayerJob.grade.level >= Config.PostOP.System.GradeLevelRequirement then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", StashName, { maxweight = StashWeight, slots = StashSize })
        TriggerEvent("inventory:client:SetCurrentStash", StashName)
    else
        ConstantDevelopmentPostOPNotifications(3, "You don\'t seem to be allowed to Open this Stash...", Config.PostOP.System.NotificationTitle)
    end
end)

RegisterNetEvent("cr-postop:client:MoveHiddenRoomBox")
AddEventHandler("cr-postop:client:MoveHiddenRoomBox", function()
    if PlayerJob.name == Config.PostOP.System.JobName and PlayerJob.isboss or PlayerJob.name == Config.PostOP.System.PoliceJobName and PlayerJob.grade.level == Config.PostOP.PoliceGradeLevelHiddenFactorsMovement then
        if HiddenRoomBoxMoved then
            if Config.Framework.Doorlocks == 'nui' then
                TriggerServerEvent('nui_doorlock:server:updateState', 'PostOPHiddenDoor', true, false, false, true)
            elseif Config.Framework.Doorlocks == 'qb' then
                TriggerServerEvent('qb-doorlock:server:updateState', 'PostOPHiddenDoor', false)
            end
            HiddenRoomBoxMoved = false
            ConstantDevelopmentPostOPNotifications(2, "You have moved the Hidden Box...", Config.PostOP.System.NotificationTitle)
        else
            if Config.Framework.Doorlocks == 'nui' then
                TriggerServerEvent('nui_doorlock:server:updateState', 'PostOPHiddenDoor', false, false, false, true)
            elseif Config.Framework.Doorlocks == 'qb' then
                TriggerServerEvent('qb-doorlock:server:updateState', 'PostOPHiddenDoor', true)
            end
            HiddenRoomBoxMoved = true
            ConstantDevelopmentPostOPNotifications(2, "You have moved the Hidden Box...", Config.PostOP.System.NotificationTitle)
        end
    else
        ConstantDevelopmentPostOPNotifications(3, "You don\'t have the proper 'tools' to move this Box...", Config.PostOP.System.NotificationTitle)
    end
end)

RegisterNetEvent("cr-postop:client:ForgeryTable")
AddEventHandler("cr-postop:client:ForgeryTable", function()
    if PlayerJob.name == Config.PostOP.System.JobName then
        if Config.Framework.ForgerySystem == true then
            TriggerEvent('cr-forgery:client:IDForgery')
        else
            ConstantDevelopmentPostOPNotifications(3, "It seems the Table isn\'t setup at this time?", Config.PostOP.System.NotificationTitle)
        end
    else
        ConstantDevelopmentPostOPNotifications(3, "It seems as if you don\'t understand how to use this System...", Config.PostOP.System.NotificationTitle)
    end
end)

RegisterNetEvent("cr-postop:client:MoneyBoothMenu")
AddEventHandler("cr-postop:client:MoneyBoothMenu", function()
    if PlayerJob.name == Config.PostOP.System.JobName then
        exports['qb-menu']:openMenu( { {
            id = 1,
            header = "MoneyBooth System",
            isMenuHeader = true
        }, {
            id = 2,
            header = "Trade Money",
            txt = "Convert or Clean your Currencies...",
            params = { event = "cr-postop:client:TradeMoneyMenu", }
        }, {
            id = 3,
            header = "Create Money",
            txt = "Create Fake Money",
            params = { event = "cr-postop:client:CreateMoneyMenu", }
        }, {
            id = 4,
            header = "Close",
            txt = "Close the System",
            params = { event = "qb-menu:closeMenu" }
        } } )
    else
        ConstantDevelopmentPostOPNotifications(3, "It seems as if you don\'t understand how to use this System...", Config.PostOP.System.NotificationTitle)
    end
end)

RegisterNetEvent("cr-postop:client:TradeMoneyMenu")
AddEventHandler("cr-postop:client:TradeMoneyMenu", function()
    if PlayerJob.name == Config.PostOP.System.JobName then
        exports['qb-menu']:openMenu( { {
            id = 1,
            header = "Trade Money System",
            isMenuHeader = true
        }, {
            id = 2,
            header = "Clean Marked Money",
            txt = "Clean your Marked Money...",
            params = { event = "cr-postop:client:CleanMarkedMoney", }
        }, {
            id = 3,
            header = "Close",
            txt = "Close the System",
            params = { event = "qb-menu:closeMenu" }
        } } )
    end
end)

RegisterNetEvent("cr-postop:client:CleanMarkedMoney")
AddEventHandler("cr-postop:client:CleanMarkedMoney", function()
    local luck = math.random(1, 10)
    if PlayerJob.name == Config.PostOP.System.JobName then
        QBCore.Functions.TriggerCallback('cr-postop:server:CleanMoneyCooldown', function(result)
            if result then
                TriggerServerEvent('cr-postop:server:CleanMarkedMoney')
                if luck >= 8 then
                    TriggerServerEvent('cr-postop:server:SetCleanMoneyCooldown')
                end
            else
                ConstantDevelopmentPostOPNotifications(2, "It seems as if the Station is Charging...")
            end
        end)
    end
end)

RegisterNetEvent("cr-postop:client:CreateMoneyMenu")
AddEventHandler("cr-postop:client:CreateMoneyMenu", function()
    if PlayerJob.name == Config.PostOP.System.JobName then
        exports['qb-menu']:openMenu( { {
            id = 1,
            header = "Create Money System",
            isMenuHeader = true
        }, {
            id = 2,
            header = "Create Money",
            txt = "Create 'Fake' Money that can be used...",
            params = { event = "cr-postop:client:CreateMoney", }
        }, {
            id = 3,
            header = "Close",
            txt = "Close the System",
            params = { event = "qb-menu:closeMenu" }
        } } )
    end
end)

RegisterNetEvent("cr-postop:client:CreateMoney")
AddEventHandler("cr-postop:client:CreateMoney", function()
    if PlayerJob.name == Config.PostOP.System.JobName then
        ConstantDevelopmentPostOPNotifications(2, "It seems as if this isn\'t operationl...", Config.PostOP.System.NotificationTitle)
    end
end)

-- Threads --

Citizen.CreateThread(function()

    CreatePostOPBlip(Config.PostOP.Blip.Coords, Config.PostOP.Blip.Sprite, Config.PostOP.Blip.Display, Config.PostOP.Blip.Scale, Config.PostOP.Blip.Colour, Config.PostOP.Blip.Label)

    exports['qb-target']:AddBoxZone('PostOPManagementComputer', Config.PostOP.Targets.Management.Computer.Coords,  Config.PostOP.Targets.Management.Computer.Length, Config.PostOP.Targets.Management.Computer.Width, {
        name = 'PostOPManagementComputer',
        heading = Config.PostOP.Targets.Management.Computer.Heading,
        debugPoly = Config.Framework.Debug,
        minZ = Config.PostOP.Targets.Management.Computer.minZ,
        maxZ = Config.PostOP.Targets.Management.Computer.maxZ,
    }, {
        options = {
            {
                type = 'client',
                event = 'cr-postop:client:ManagementComputerMenu',
                icon = "fas fa-laptop",
                label = "Log Into Computer",
                job = Config.PostOP.System.JobName
            },
        },
        distance = 1
    })

    exports['qb-target']:AddBoxZone('PostOPManagementClothing', Config.PostOP.Targets.Management.Clothing.Coords,  Config.PostOP.Targets.Management.Clothing.Length, Config.PostOP.Targets.Management.Clothing.Width, {
        name = 'PostOPManagementClothing',
        heading = Config.PostOP.Targets.Management.Clothing.Heading,
        debugPoly = Config.Framework.Debug,
        minZ = Config.PostOP.Targets.Management.Clothing.minZ,
        maxZ = Config.PostOP.Targets.Management.Clothing.maxZ,
    }, {
        options = {
            {
                type = 'client',
                event = 'cr-postop:client:OpenManagementClothing',
                icon = "fas fa-tshirt",
                label = "Change Clothes",
                job = Config.PostOP.System.JobName
            },
        },
        distance = 2
    })

    for k, v in pairs(Config.StashSpots) do
        exports['qb-target']:AddBoxZone('MiniStash'..k, v.Coords,  v.Length, v.Width, {
            name = 'MiniStash'..k,
            heading = v.Heading,
            debugPoly = Config.Framework.Debug,
            minZ = v.minZ,
            maxZ = v.maxZ,
        }, {
            options = {
                {
                    icon = "fas fa-box-open",
                    label = "Open Stash",
                    job = Config.PostOP.System.JobName,
                    action = function()
                        TriggerEvent('cr-postop:client:OpenStash', k, v.StashWeight, v.StashSize)
                    end
                },
            },
            distance = 2
        })
    end

    exports['qb-target']:AddBoxZone('PostOPForgery', Config.PostOP.Targets.Forgery.Coords,  Config.PostOP.Targets.Forgery.Length, Config.PostOP.Targets.Forgery.Width, {
        name = 'PostOPForgery',
        heading = Config.PostOP.Targets.Forgery.Heading,
        debugPoly = Config.Framework.Debug,
        minZ = Config.PostOP.Targets.Forgery.minZ,
        maxZ = Config.PostOP.Targets.Forgery.maxZ,
    }, {
        options = {
            {
                type = 'client',
                event = 'cr-postop:client:ForgeryTable',
                icon = "fa-solid fa-gear",
                label = "Open Forgery",
                job = Config.PostOP.System.JobName
            },
        },
        distance = 1
    })

    exports['qb-target']:AddBoxZone('PostOPMoneyBooth', Config.PostOP.Targets.MoneyBooth.Coords,  Config.PostOP.Targets.MoneyBooth.Length, Config.PostOP.Targets.MoneyBooth.Width, {
        name = 'PostOPMoneyBooth',
        heading = Config.PostOP.Targets.MoneyBooth.Heading,
        debugPoly = Config.Framework.Debug,
        minZ = Config.PostOP.Targets.MoneyBooth.minZ,
        maxZ = Config.PostOP.Targets.MoneyBooth.maxZ,
    }, {
        options = {
            {
                type = 'client',
                event = 'cr-postop:client:MoneyBoothMenu',
                icon = "fa-solid fa-money-bill",
                label = "Open MoneyBooth",
                job = Config.PostOP.System.JobName
            },
        },
        distance = 1
    })

    exports['qb-target']:AddBoxZone('PostOPHiddenRoomClothingBooth', Config.PostOP.Targets.HiddenRoom.ClothingBooth.Coords,  Config.PostOP.Targets.HiddenRoom.ClothingBooth.Length, Config.PostOP.Targets.HiddenRoom.ClothingBooth.Width, {
        name = 'PostOPHiddenRoomClothingBooth',
        heading = Config.PostOP.Targets.HiddenRoom.ClothingBooth.Heading,
        debugPoly = Config.Framework.Debug,
        minZ = Config.PostOP.Targets.HiddenRoom.ClothingBooth.minZ,
        maxZ = Config.PostOP.Targets.HiddenRoom.ClothingBooth.maxZ,
    }, {
        options = {
            {
                type = 'client',
                event = 'cr-postop:client:OpenRoomClothing',
                icon = "fa-solid fa-money-bill",
                label = "Open Clothing Booth",
                job = Config.PostOP.System.JobName
            },
        },
        distance = 1
    })

    exports['qb-target']:AddBoxZone('PostOPMoveHiddenBox', Config.PostOP.Targets.HiddenBox.Coords,  Config.PostOP.Targets.HiddenBox.Length, Config.PostOP.Targets.HiddenBox.Width, {
        name = 'PostOPMoveHiddenBox',
        heading = Config.PostOP.Targets.HiddenBox.Heading,
        debugPoly = Config.Framework.Debug,
        minZ = Config.PostOP.Targets.HiddenBox.minZ,
        maxZ = Config.PostOP.Targets.HiddenBox.maxZ,
    }, {
        options = {
            {
                type = 'client',
                event = 'cr-postop:client:MoveHiddenRoomBox',
                icon = "fas fa-box-alt",
                label = "Attempt to Move Box",
            },
        },
        distance = 1.5
    })

end)
