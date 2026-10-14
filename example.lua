-- Example usage of M3 Script Shield SDK inside your FiveM resources:

local M3Shield = exports['m3_script_shield_sdk']:GetShieldEngine()

-- Initialize Shield on resource start
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    M3Shield.Init(resourceName)
end)

-- Register a protected server event with automatic zero-trust validation
M3Shield.RegisterSecureEvent('my_resource:server:giveReward', function(source, amount)
    print(string.format("Authorized reward request for player ID %d: %s", source, tostring(amount)))
    -- Execute your database / inventory transaction here safely
end)
