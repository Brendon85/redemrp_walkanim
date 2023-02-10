RedEM = exports["redem_roleplay"]:RedEM()

RegisterServerEvent("redemrp_walkanim:getwalk", function()
    local _source = source
    local user = RedEM.GetPlayer(_source)
    TriggerClientEvent("redemrp_walkanim:getwalk2", _source, user.metadata.walk)
end)

RegisterServerEvent("redemrp_walkanim:setwalk", function(animation)
    local _source = source
    local user = RedEM.GetPlayer(_source)
    user.SetMetaData("walk", animation)
    print(animation)
end)

