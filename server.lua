local xSound = exports.xsound

RegisterNetEvent("nota_dj:server:playsound")
AddEventHandler("nota_dj:server:playsound", function(musicId, url, coords, distance, volume)
    xSound:PlayUrlPos(-1, musicId, url, volume/100, coords)
    xSound:Distance(-1, musicId, distance)
    xSound:setVolume(-1, musicId, volume/100)
end)

RegisterNetEvent('nota_dj:server:pausesound')
AddEventHandler('nota_dj:server:pausesound', function(id)
    xSound:Pause(-1, id)
end)

RegisterNetEvent('nota_dj:server:stopsound')
AddEventHandler('nota_dj:server:stopsound', function(id)
    xSound:Destroy(-1, id)
end)

RegisterNetEvent('nota_dj:server:resumesound')
AddEventHandler('nota_dj:server:resumesound', function(id)
    xSound:Resume(-1, id)
end)