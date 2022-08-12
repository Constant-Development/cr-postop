Config = {}

Config.Framework = {
    Notifications = 'QBCore',
    -- 'QBCore' = QBCoreNotify
    -- 'okok' = okokNotify
    -- 'mythic' = mythic_notify
    -- 'tnj' = tnj-notify
    -- 'chat' = Chat Message
    Doorlocks = 'qb',
    -- 'qb' = qb_doorlock
    -- 'nui' = nui_doorlock
    Clothing = 'qb',
    -- 'qb' = qb-clothing
    -- 'fivem-appearance' = fivem-appearance
    Minigame = 'ps-ui',
    -- 'qb-lock' = QBCore Lock Circle Minigame
    -- 'ps-ui' = Project Sloth UI Circle Minigame
    Logs = false, -- Currrently setup via QBCore Logs | Currently not used
    -- True = Logs Enabled
    -- False = Logs Disabled
    Debug = false,
    -- true = Poly's & Prints Enabled
    -- false = Poly's & Prints Disabled
    ForgerySystem = false,
    -- true = Forgery System Enabled | https://constant-development.tebex.io/package/5066459
    -- false = Forgery System Disabled | https://constant-development.tebex.io/package/5066459
}

Config.PostOP = {
    System = {
        SystemName = "PostOP System",
        JobName = "postop", -- JobName must be entered | If no Job set to nil(Not Tested)
        GradeLevelRequirement = 2, -- Level Job Ranking Required to 'Access' Closed Shop
        GradeLevelRequirementHiddenFactors = 3, -- Level Job Ranking Required to 'Access'
        PoliceJobName = 'police', -- Your Police Job Name
        PoliceGradeLevelHiddenFactorsMovement = 5, -- Level Job Ranking Required to Move Box for 'Police'
        NotificationTitle = "PostOP Aid",
    },
    Targets = { -- https://www.youtube.com/watch?v=Ipyw7rIbEg8 | How To Use PolyZone
        Management = {
            Computer = {
                Coords = vector3(-301.71, -1286.34, 31.25), -- Target's Coorindates
                Length = 0.5, -- Target's Length
                Width = 0.5, -- Target's Width
                Heading = 0, -- Target's Heading
                minZ = 30.85, -- Minimum Target's 'Z'
                maxZ = 31.45, -- Maximum Target's 'Z'
            },
            Clothing = {
                Coords = vector3(-301.85, -1282.4, 31.25), -- Target's Coorindates
                Length = 0.5, -- Target's Length
                Width = 1, -- Target's Width
                Heading = 0, -- Target's Heading
                minZ = 30.45, -- Minimum Target's 'Z'
                maxZ = 32.25, -- Maximum Target's 'Z'
            },
        },
        HiddenBox = { -- Box that is Moved
            Coords = vector3(-312.52, -1293.3, 31.24), -- Target's Coorindates
            Length = 5.4, -- Target's Length
            Width = 2, -- Target's Width
            Heading = 0, -- Target's Heading
            minZ = 30.24, -- Minimum Target's 'Z'
            maxZ = 32.24, -- Maximum Target's 'Z'
        },
        Forgery = { -- Weapon Room Booth | Future Idea
            Coords = vector3(-309.48, -1316.68, 31.26), -- Target's Coorindates
            Length = 4.5, -- Target's Length
            Width = 1, -- Target's Width
            Heading = 0, -- Target's Heading
            minZ = 30.26, -- Minimum Target's 'Z'
            maxZ = 31.86, -- Maximum Target's 'Z'
        },
        MoneyBooth = {
            Coords = vector3(-312.77, -1320.2, 31.26), -- Target's Coorindates
            Length = 5.2, -- Target's Length
            Width = 1.1, -- Target's Width
            Heading = 270, -- Target's Heading
            minZ = 30.26, -- Minimum Target's 'Z'
            maxZ = 31.46, -- Maximum Target's 'Z'
        },
        WeaponRoomBox = { -- Weapon Room Booth | Future Idea
            Coords = vector3(-319.42, -1305.82, 31.26), -- Target's Coorindates
            Length = 0.5, -- Target's Length
            Width = 1, -- Target's Width
            Heading = 0, -- Target's Heading
            minZ = 30.86, -- Minimum Target's 'Z'
            maxZ = 31.66, -- Maximum Target's 'Z'
        },
        CraftingBench = { -- Weapon Room Crafting Bench | Future Idea
            Coords = vector3(-322.36, -1301.34, 31.26), -- Target's Coorindates
            Length = 4, -- Target's Length
            Width = 1, -- Target's Width
            Heading = 0, -- Target's Heading
            minZ = 30.26, -- Minimum Target's 'Z'
            maxZ = 32.46, -- Maximum Target's 'Z'
        },
        HiddenRoom = {
            ClothingBooth = {
                Coords = vector3(-307.75, -1315.71, 31.26), -- Target's Coorindates
                Length = 3.5, -- Target's Length
                Width = 0.8, -- Target's Width
                Heading = 0, -- Target's Heading
                minZ = 30.26, -- Minimum Target's 'Z'
                maxZ = 33.66, -- Maximum Target's 'Z'
            },
        },
    },
    Blip = { -- https://docs.fivem.net/docs/game-references/blips/
        Enabled = true,
        Label = "PostOP Delivery Services", -- Blip's Label
        Coords = vector4(-310.5312, -1288.2697, 31.2438, 85.8038), -- Realistically should be the 'Center' of the MLO
        Sprite = 318, -- Blip's Sprite
        Display = 4, -- Blip's Display
        Scale = 0.6, -- Blip's Scale
        Colour = 81, -- Blip's Colour
    },
    Deliveries = { -- Future System | Deliver Goods to Points & Pick-Up Goods from Points | Furthermore, I wanted to add a Reputation System within this.
        DeliveryZones = {
            vector4(0, 0, 0, 0), -- Can Add As Many Zones
            vector4(0, 0, 0, 0)
        },
        PickUpZones = {
            vector4(0, 0, 0, 0), -- Can Add As Many Zones
            vector4(0, 0, 0, 0)
        },
        PickUpType = 'PED', -- PickUP Type can be a 'PED' or 'Prop' | Whichever you use, must have the Filters filled out
        PEDFactors = {
            Enabled = false, -- If 'false' than "Prop" is Enabled('true')
            Coords = vector4(-1182.0186, -883.1359, 13.7921, 302.2321), -- PED's Coordinates | Lower 'Z' by 1 or Add "-1" to the End of 'Z'
            Model = 's_m_m_linecook', -- PED's Model | https://docs.fivem.net/docs/game-references/ped-models/
            Name = 'Andy', -- PED's Name
            Scenario = "WORLD_HUMAN_STAND_IMPATIENT", -- PED's Tasked Scenario | https://gtaforums.com/topic/796181-list-of-scenarios-for-peds/ | Standing Recommended due to Target
            Invincible = true -- If PED is Invisible | If PED is Invisible then it can't Die
        },
        PropFactors = {
            Enabled = true, -- If 'false' than "PED" is Enabled('true')
            Coords = vector3(-1182.0186, -883.1359, 13.7921), -- The " - 1 " is used to Adjust the Prop onto the Ground | Make sure you add the " - 1 " to your 'z' Coordinate
            Model = 'prop_vend_snak_01_tu', -- Should be a (Vending)'Machine' | https://gta-objects.xyz/
            PropName = 'Vending Machine'
        },
    },
    ShopItems = {
        Enabled = false,
        Slots = 0,
        Items = {}
    },
}

Config.StashSpots = {
    ['MiniStorageOne'] = { -- Hidden Safe Stash
        Coords = vector3(-322.18, -1298.76, 31.26), -- Target's Coorindates
        Length = 1, -- Target's Length
        Width = 1, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 32.06, -- Maximum Target's 'Z'
        StashWeight = 5000000,
        StashSize = 50
    },
    ['MiniStorageTwo'] = { -- Weapon-Crate Stash inside of HiddenRoom(Not Stacks of Crates)
        Coords = vector3(-315.42, -1299.98, 31.26), -- Target's Coorindates
        Length = 1.8, -- Target's Length
        Width = 1, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 31.26, -- Maximum Target's 'Z'
        StashWeight = 5000000,
        StashSize = 50
    },
    ['MediumStorageOne'] = { -- Storage Room Crate | Hidden Room
        Coords = vector3(-317.41, -1315.98, 31.26), -- Target's Coorindates
        Length = 1.9, -- Target's Length
        Width = 1.8, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 31.06, -- Maximum Target's 'Z'
        StashWeight = 10000000,
        StashSize = 100
    },
    ['MediumStorageTwo'] = { -- Storage Room Crate | Hidden Room
        Coords = vector3(-317.44, -1313.9, 31.26), -- Target's Coorindates
        Length = 2.2, -- Target's Length
        Width = 2, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 31.86, -- Maximum Target's 'Z'
        StashWeight = 10000000,
        StashSize = 100
    },
    ['MediumStorageThree'] = { -- Storage Room Crate | Hidden Room
        Coords = vector3(-317.28, -1317.34, 31.26), -- Target's Coorindates
        Length = 0.9, -- Target's Length
        Width = 2, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 32.66, -- Maximum Target's 'Z'
        StashWeight = 10000000,
        StashSize = 100
    },
    ['MediumStorageFour'] = { -- Storage Room Crate | Hidden Room
        Coords = vector3(-320.55, -1319.4, 31.26), -- Target's Coorindates
        Length = 2, -- Target's Length
        Width = 1.3, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 32.06, -- Maximum Target's 'Z'
        StashWeight = 10000000,
        StashSize = 100
    },
    ['MediumStorageFive'] = { -- Meeting Room Stash | Hidden Room
        Coords = vector3(-307.36, -1308.93, 31.26), -- Target's Coorindates
        Length = 5, -- Target's Length
        Width = 1, -- Target's Width
        Heading = 270, -- Target's Heading
        minZ = 29.66, -- Minimum Target's 'Z'
        maxZ = 32.46, -- Maximum Target's 'Z'
        StashWeight = 10000000,
        StashSize = 100
    },
    ['MediumStorageSix'] = { -- Entrance Stash | Key Deposit Box Prop
        Coords = vector3(-299.75, -1296.68, 31.25), -- Target's Coorindates
        Length = 3, -- Target's Length
        Width = 1, -- Target's Width
        Heading = 270, -- Target's Heading
        minZ = 30.25, -- Minimum Target's 'Z'
        maxZ = 32.85, -- Maximum Target's 'Z'
        StashWeight = 5000000,
        StashSize = 50
    },
    ['LargeStorageOne'] = { -- Storage Room Crate | Hidden Room
        Coords = vector3(-317.56, -1318.73, 31.26), -- Target's Coorindates
        Length = 1.8, -- Target's Length
        Width = 1.8, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 33.06, -- Maximum Target's 'Z'
        StashWeight = 25000000,
        StashSize = 250
    },
    ['LargeStorageTwo'] = { -- Storage Room Crate | Hidden Room
        Coords = vector3(-322.23, -1318.89, 31.26), -- Target's Coorindates
        Length = 2, -- Target's Length
        Width = 2, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 32.46, -- Maximum Target's 'Z'
        StashWeight = 25000000,
        StashSize = 250
    },
    ['LargeStorageThree'] = { -- Storage Room Crate | Hidden Room
        Coords = vector3(-322.41, -1312.23, 31.26), -- Target's Coorindates
        Length = 2, -- Target's Length
        Width = 2, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 33.06, -- Maximum Target's 'Z'
        StashWeight = 25000000,
        StashSize = 250
    },
    ['LargeStorageFour'] = { -- Storage Room Crate | Hidden Room
        Coords = vector3(-322.5, -1310.09, 31.26), -- Target's Coorindates
        Length = 2, -- Target's Length
        Width = 2, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 33.06, -- Maximum Target's 'Z'
        StashWeight = 25000000,
        StashSize = 250
    },
    ['LargeStorageFive'] = { -- Storage Room Crate | Hidden Room
        Coords = vector3(-317.29, -1310.23, 31.26), -- Target's Coorindates
        Length = 2, -- Target's Length
        Width = 2, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 32.86, -- Maximum Target's 'Z'
        StashWeight = 25000000,
        StashSize = 250
    },
    ['LargeStorageSix'] = { -- Stack of Weapon Crates | Hidden Room
        Coords = vector3(-318.73, -1302.28, 31.26), -- Target's Coorindates
        Length = 2.2, -- Target's Length
        Width = 1.8, -- Target's Width
        Heading = 0, -- Target's Heading
        minZ = 30.26, -- Minimum Target's 'Z'
        maxZ = 32.46, -- Maximum Target's 'Z'
        StashWeight = 25000000,
        StashSize = 250
    }
}
