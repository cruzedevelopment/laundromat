-- // [CONFIG] \\ --

local Config = lib.callback.await('laundromat:getConfig')

-- // [BLIPS] \\ --

CreateThread(function()
    for _, blipData in ipairs(Config.Blips) do
        local blip = AddBlipForCoord(blipData["coords"]["x"], blipData["coords"]["y"], blipData["coords"]["z"])

        SetBlipSprite(blip, blipData["sprite"])
        SetBlipDisplay(blip, blipData["display"])
        SetBlipScale(blip, blipData["scale"])
        SetBlipColour(blip, blipData["colour"])
        SetBlipAsShortRange(blip, blipData["shortRange"])
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blipData["name"])
        EndTextCommandSetBlipName(blip)
    end
end)

-- // [FUNCTIONS] \\ --

local function startCleaning()
    local success = lib.skillCheck({
        Config["Laundromat"]["locations"]["configuration"]["skillCheck"]["difficulty"],
        Config["Laundromat"]["locations"]["configuration"]["skillCheck"]["difficulty"],
        {areaSize = 50, speedMultiplier = 1.5},    
    }, Config["Laundromat"]["locations"]["configuration"]["skillCheck"]["inputKeys"])

    if success then
        lib.callback('laundromat:server:processClothes', false, function(success, notification)
            lib.notify(Config["Laundromat"]["notifications"][notification["type"]])
        end)
    else
        lib.notify(Config["Laundromat"]["notifications"]["skillCheckFailed"])
    end
end

local function sellCleanClothes()
    local count = exports["ox_inventory"]:Search('count', Config["Laundromat"]["locations"]["configuration"]["items"]["outputItem"])

    if count > 0 then
        local totalEarnings = count * Config["Laundromat"]["locations"]["configuration"]["selling"]["pricePerItem"]

        lib.callback('laundromat:server:sellClothes', false, function(success, notification)
            lib.notify(Config["Laundromat"]["notifications"][notification["type"]])
        end, count, totalEarnings)
    end
end

-- // [TARGETS] \\ --

CreateThread(function()
    for _, coords in ipairs(Config["Laundromat"]["locations"]["laundryMachines"]) do
        exports["ox_target"]:addSphereZone({
            coords = coords,
            radius = 0.5,
            debug = false,
            options = {
                label = "Use Washing Machine",
                icon = "fas fa-tshirt",
                onSelect = function()
                    local count = exports["ox_inventory"]:Search('count', Config["Laundromat"]["locations"]["configuration"]["items"]["inputItem"])

                    if count > 0 then
                        startCleaning()
                    else
                        lib.notify(Config["Laundromat"]["notifications"]["noInputItem"])
                    end
                end
            }
        })
    end

    for _, coords in ipairs(Config["Laundromat"]["locations"]["sellingLocations"]) do
        exports["ox_target"]:addSphereZone({
            coords = coords,
            radius = 0.5,
            debug = false,
            options = {
                label = "Sell Clothes",
                icon = "fa-solid fa-dollar-sign",
                onSelect = function()
                    local count = exports["ox_inventory"]:Search('count', Config["Laundromat"]["locations"]["configuration"]["items"]["outputItem"])

                    if count > 0 then
                        sellCleanClothes()
                    else
                        lib.notify(Config["Laundromat"]["notifications"]["noOutputItem"])
                    end
                end
            }
        })
    end
end)
