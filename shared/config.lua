Config = {}

Config.Blips = {
    ["coords"] =  vector3(899.2502, -1041.5011, 36.7690),
    ["name"] = "Laundromat",
    ["sprite"] = 445,
    ["colour"] = 3,
    ["scale"] = 0.8,
    ["display"] = 2,
    ["shortRange"] = true
}

Config.Laundromat = {
    ["locations"] = {
        ["sellingLocations"] = {
            vector3(890.5322, -1038.1282, 36.2133 - 1.0)
        },

        ["laundryMachines"] = {
            vector3(897.1668, -1040.3945, 36.1249 - 1.0),
            vector3(898.3244, -1040.4786, 36.1125 - 1.0),
            vector3(899.4736, -1040.3480, 36.1276 - 1.0),
            vector3(900.6315, -1040.4146, 36.1138 - 1.0),
            vector3(901.7789, -1040.3977, 36.1175 - 1.0)
        },

        ["configuration"] = {
            ["skillCheck"] = {
                ["difficulty"] = "medium",
                ["inputKeys"] = { "w", "a", "s", "d" },
            },

            ["selling"] = {
                ["pricePerItem"] = 50,
            },

            ["items"] = {
                ["inputItem"] = "dirty_clothes",
                ["outputItem"] = "clean_clothes",
                ["inputItemLabel"] = "Dirty Clothes",
                ["outputItemLabel"] = "Clean Clothes"
            }
        }
    },

    ["notifications"] = {
        ["sellSuccess"] = { type = 'success', description = 'You successfully sold your clean clothes!' },
        ["successClean"] = { type = 'success', description = 'You successfully cleaned your clean clothes!' },
        ["failedToAdd"] = { type = 'error', description = 'Failed to add.' },
        ["failedToRemoveOutputItem"] = { type = 'error', description = 'Failed to remove clean clothes from your inventory.' },
        ["noOutputItem"] = { type = 'error', description = 'You do not have any clean clothes to sell.' },
        ["skillCheckFailed"] = { type = 'error', description = 'You failed to complete the skill check. Try again!' },
        ["success"] = { type = 'success', description = 'Your clothes are now sparkling clean!' },
        ["failedToRemove"] = { type = 'error', description = 'Unable to remove dirty clothes from your inventory.' },
        ["noInputItem"] = { type = 'error', description = 'You do not have any dirty clothes to clean.' }
    }
}
