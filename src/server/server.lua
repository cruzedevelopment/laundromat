-- // [CONFIG/CALLBACK] \\ --

lib.callback.register('laundromat:getConfig', function(source)
    return Config
end)

-- // [CALLBACKS] \\ --

lib.callback.register('laundromat:server:processClothes', function(source)
    local count = exports["ox_inventory"]:GetItemCount(source, Config["Laundromat"]["locations"]["configuration"]["items"]["inputItem"])

    if count > 0 then
        local success = exports["ox_inventory"]:RemoveItem(source, Config["Laundromat"]["locations"]["configuration"]["items"]["inputItem"], 1)

        if success then
            local addSuccess = exports["ox_inventory"]:AddItem(source, Config["Laundromat"]["locations"]["configuration"]["items"]["outputItem"], 1)

            if addSuccess then
                return true, { ["type"] = "successClean" }
            else
                return false, { ["type"] = "failedToAdd" }
            end
        else
            return false, { ["type"] = "FailedToRemove" }
        end
    else
        return false, { ["type"] = "noInputitem" }
    end
end)

lib.callback.register('laundromat:server:sellClothes', function(source, count, totalEarnings)
    local itemCount = exports["ox_inventory"]:GetItemCount(source, Config["Laundromat"]["locations"]["configuration"]["items"]["outputItem"])

    if itemCount >= count then
        local success = exports["ox_inventory"]:RemoveItem(source, Config["Laundromat"]["locations"]["configuration"]["items"]["outputItem"], 1)

        if success then
            local moneyAdded = exports["ox_inventory"]:AddItem(source, 'cash', totalEarnings)

            if moneyAdded then
                return true, { ["type"] = "sellSuccess" }
            else
                return false, { ["type"] = "failedToAdd" }
            end
        else
            return false, { ["type"] = "failedToRemoveOutputItem" }
        end
    else
        return false, { ["type"] = "noOutputItem" }
    end
end)
