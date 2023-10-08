-- PAID CHEAP ANTICHEAT
-- https://discord.gg/XUNpKEpVFp

CreateThread(function()
    while true do
        Wait(5000)
        for k,v in pairs(Config.blacklistedWeapons) do
            local currentWeaponHash = GetSelectedPedWeapon(PlayerPedId())
                if currentWeaponHash == GetHashKey(v) then
                    RemoveAllPedWeapons(ped, true)
                    TriggerServerEvent("afr:ban", v)                    
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(5000)
            TriggerServerEvent("afr:checkGuns")
    end
end)

-- PAID CHEAP ANTICHEAT
-- https://discord.gg/XUNpKEpVFp