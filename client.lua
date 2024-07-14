local uniqueIdCounter = 0

local function generateUniqueId()
    uniqueIdCounter = uniqueIdCounter + 1
    return uniqueIdCounter
end

local function createDjZone(coords, size, rotation, name, distance, volume)
    local uniqueId = generateUniqueId()
    local zoneName = name .. uniqueId

    exports.ox_target:addBoxZone({
        coords = coords,
        size = size,
        rotation = rotation,
        options = {
            {
                name = zoneName,
                event = 'nota_dj:open',
                icon = 'fa-solid fa-headphones',
                label = Config.Locales[Config.UsedLocale].open_table,
                serverEvent = false,
                id = zoneName .. "_" .. uniqueId,
                song_distance = distance,
                volume = volume
            },
            {
                name = zoneName .. '_pause',
                event = 'nota_dj:pause',
                icon = 'fa-solid fa-pause',
                label = Config.Locales[Config.UsedLocale].pause_music,
                serverEvent = true,
                id = zoneName .. "_" .. uniqueId
            },
            {
                name = zoneName .. '_resume',
                event = 'nota_dj:resume',
                icon = 'fa-solid fa-play',
                label = Config.Locales[Config.UsedLocale].resume_music,
                serverEvent = true,
                id = zoneName .. "_" .. uniqueId
            },
            {
                name = zoneName .. '_stop',
                event = 'nota_dj:stop',
                icon = 'fa-solid fa-stop',
                label = Config.Locales[Config.UsedLocale].stop_music,
                serverEvent = true,
                id = zoneName .. "_" .. uniqueId
            }
        }
    })
end

AddEventHandler('nota_dj:open', function(data)
    local input = lib.inputDialog("DJ Menu", {
        {type = 'input', label = Config.Locales[Config.UsedLocale].label_url, required = true}
    })
    if input and input[1] then
        local coords = GetEntityCoords(PlayerPedId())
        TriggerServerEvent("nota_dj:server:playsound", data.id, input[1], coords, data.song_distance, data.volume)
    end
end)

AddEventHandler('nota_dj:pause', function(data)
    TriggerServerEvent("nota_dj:server:pausesound", data.id)
end)

AddEventHandler('nota_dj:resume', function(data)
    TriggerServerEvent("nota_dj:server:resumesound", data.id)
end)

AddEventHandler('nota_dj:stop', function(data)
    TriggerServerEvent("nota_dj:server:stopsound", data.id)
end)

-- Function to disable static emitters for a given zone
local function disableStaticEmitters(zone)
    for _, emitter in ipairs(zone.static_emitters) do
        SetStaticEmitterEnabled(emitter, false)
    end
end

-- Load zones from config
for name, zone in pairs(Config.Zones) do
    createDjZone(zone.position, zone.boxSize, zone.rotation, name, zone.distance, zone.volume)
end

-- Disable static emitters for all zones in the config
Citizen.CreateThread(function()
    for _, zone in pairs(Config.Zones) do
        disableStaticEmitters(zone)
    end
end)