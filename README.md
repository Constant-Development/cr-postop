# cr-postop

## PostOP Job System

[Constant Development Discord](https://discord.gg/gSQbshCNv4)
[Constant Development Tebex](https://constant-development.tebex.io/)
[Constant RolePlay Discord](https://discord.gg/constantroleplay)

Within this Resource, you will have a Job System based on the PostOP MLO.
 Being said, understand that this Job will be intricated over-time and is
planned to contain 0 Direct Depedencies other than the MLO itself. With that,
expect the Resource to contain multiple different Configurable Options within
Config.Framework. 

To further add onto that, this Resource currently contains the following:
 - Intricated Management Menu System
  - Contains Toggle Duty Factors
  - Contains Boss/Management Menu Factors
 - Hidden Room Box Movement Factor
 - Intricated Forgery Table
 - Intricated Money Table
 - Intricated Stash System
 - PostOP MLO Doorlocks
 - External Sounds and Images

## Dependencies:

### MLO:
 - [K4MB1's Post OP MLO](https://www.k4mb1maps.com/package/5015427)

## Optionals:

### Optional Targets:

 - [qb-target](https://github.com/Renewed-Scripts/qb-target)
 - [qtarget](https://github.com/overextended/qtarget)

### Optional Notifications:

 - [QBCore:Notify](https://github.com/qbcore-framework/qb-core)
 - [okokNotify](https://okok.tebex.io/package/4724993)
 - [mythic_notify](https://github.com/wowpanda/mythic_notify)
 - [tnj-notify](https://github.com/tnj-development/tnj-notify)
 - [Chat-Notification]

### Optional Doorlocks System:

 - [qb-doorlock](https://github.com/qbcore-framework/qb-doorlock)
 - [nui_doorlock](https://github.com/BerkieBb/nui_doorlock)

### Optional Clothing Menus:

 - [qb-clothing](https://github.com/qbcore-framework/qb-clothing)
 - [fivem-appearance](https://github.com/iLLeniumStudios/fivem-appearance)

### Optional Minigame:

 - [ps-ui](https://github.com/Project-Sloth/ps-ui)
 - [qb-lock](https://github.com/Nathan-FiveM/qb-lock)

### Optional Forgery Table:

- [cr-forgery](https://constant-development.tebex.io/package/5066459)
* Note, you only need this Resource due to us using it to 'implement' the Forgery Table

## Installation

* If you encounter any issues whilst Installing or Using/Enforcing this Resource, please feel free to Open a Ticket within the [Constant Development Discord](https://discord.gg/gSQbshCNv4).

### qb-core/shared/items.lua
* Add the following Snippet into your Items List
```
    ['postopkey'] = {
        ["name"] = "postopkey",
        ["label"] = "Key 0034",
        ["weight"] = 200,
        ["type"] = "item",
        ["image"] = "meth_key.png",
        ["unique"] = false,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Key",
        ["created"] = nil,
        ["decay"] = 16.0
    },
    ['postopmasterkey'] = {
        ["name"] = "postopmasterkey",
        ["label"] = "Key 0035",
        ["weight"] = 200,
        ["type"] = "item",
        ["image"] = "meth_key.png",
        ["unique"] = false,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Key",
        ["created"] = nil,
        ["decay"] = 16.0
    },
```

### qb-core/shared/jobs.lua
* Add the following Snippet into your Jobs List
```
    ['postop'] = {
		label = 'Post OP',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 150
            },
            ['1'] = {
                name = 'Delivery Driver',
                payment = 200
            },
            ['2'] = {
                name = 'Warehouse Stocker',
                payment = 250
            },
            ['3'] = {
                name = 'Assistant Manager',
                payment = 400
            },
            ['4'] = {
                name = 'Manager',
                isboss = true,
                payment = 450
            },
            ['5'] = {
                name = 'CEO',
                isboss = true,
                payment = 600
            },
        },
	},
```

### Doorlocks Factor
* Implement the 'Doorlock' File into (nui/qb)_doorlock/configs
* Make sure that you have metal-locker.ogg and metallic-creak.ogg inside of (nui/qb)_doorlock/html/sounds

## Optional Installations"

### qb-smallresources/server/logs.lua
* If using Logs --> qb-smallresources/server/logs.lua | Add the following within ```local Webhooks {}```
```
    ['constantdevelopmentpostop'] = 'YOUR_WEBHOOK_HERE',
```

### qb-clothing/client/main.lua
* If using QBCore Clothing --> qb-clothing/client/main.lau | Add the following snippet,
```
RegisterNetEvent('qb-clothing:client:openClothingBoothMenu')
AddEventHandler('qb-clothing:client:openClothingBoothMenu', function()
    customCamLocation = nil
    openMenu({
        {menu = "character", label = "Character", selected = false},
        {menu = "clothing", label = "Features", selected = true},
        {menu = "accessoires", label = "Accessories", selected = true}
    })
end)
```
