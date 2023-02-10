RedEM = exports["redem_roleplay"]:RedEM()

MenuData = {}
TriggerEvent("redemrp_menu_base:getData", function(call)
    MenuData = call
end)

function OpenMenu()
    MenuData.CloseAll()
    local elements = {
        { label = "Walk styles", value = "WS", desc = "chooseAnim" },

    }

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi', {
        title    = 'Walk Style',
        subtext  = 'Change Style',
        align    = 'top-left',
        elements = elements,

    },
        function(data, menu)

            if data.current.value == "WS" then

                OpenWalkMenu()
            end

        end,

        function(data, menu)
            menu.close()
            DisplayRadar(true)
        end)

end

function OpenWalkMenu()
    MenuData.CloseAll()
    --isInMenu = true
    local elements = {
        { label = _U("Casual"), value = "A1", desc = _U("chooseAnim"), info = "MP_Style_Casual" },
        { label = _U("Crazy"), value = "A2", desc = _U("chooseAnim"), info = "MP_Style_Crazy" },
        { label = _U("Drunk"), value = "A3", desc = _U("chooseAnim"), info = "mp_style_drunk" },
        { label = _U("EasyRider"), value = "A4", desc = _U("chooseAnim"), info = "MP_Style_EasyRider" },
        { label = _U("Flamboyant"), value = "A5", desc = _U("chooseAnim"), info = "MP_Style_Flamboyant" },
        { label = _U("Greenhorn"), value = "A6", desc = _U("chooseAnim"), info = "MP_Style_Greenhorn" },
        { label = _U("Gunslinger"), value = "A7", desc = _U("chooseAnim"), info = "MP_Style_Gunslinger" },
        { label = _U("Inquisitive"), value = "A8", desc = _U("chooseAnim"), info = "mp_style_inquisitive" },
        { label = _U("Refined"), value = "A9", desc = _U("chooseAnim"), info = "MP_Style_Refined" },
        { label = _U("SilentType"), value = "A10", desc = _U("chooseAnim"), info = "MP_Style_SilentType" },
        { label = _U("Veteran"), value = "A11", desc = _U("chooseAnim"), info = "MP_Style_Veteran" },
        { label = _U("RemoveWalk"), value = "removeA", desc = _U("removedesc"), info = "noanim" },
    }

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi', {
        title    = 'Walk Style',
        subtext  = 'Change Style',
        align    = 'top-left',
        elements = elements,

    },
        function(data, menu)
            if data.current == "backup" then
                _G[data.trigger]()
            end

            if data.current.value then
                local animation = data.current.info
                TriggerEvent("redemrp_walkanim:setAnim", animation)

                DisplayRadar(true)
                menu.close()
            end

        end,

        function(data, menu)
            menu.close()
            DisplayRadar(true)
        end)

end


RegisterNetEvent("redemrp_walkanim:getwalk2")
AddEventHandler("redemrp_walkanim:getwalk2", function(walk)
    local animation = walk
    local player = PlayerPedId()
    if animation == "noanim" then
        Citizen.InvokeNative(0xCB9401F918CB0F75, player, animation, 0, -1)
        Wait(500)
        TriggerServerEvent("redemrp_walkanim:setwalk", animation)
    else
        Citizen.InvokeNative(0xCB9401F918CB0F75, player, animation, 1, -1)
    end

end)

AddEventHandler("redemrp_walkanim:setAnim", function(animation)
    local player = PlayerPedId()

    if animation == "noanim" then
        Citizen.InvokeNative(0xCB9401F918CB0F75, player, animation, 0, -1)
        Wait(500)
        TriggerServerEvent("redemrp_walkanim:setwalk", animation)
        Wait(500)
        ExecuteCommand("rc")
    else

        Citizen.InvokeNative(0xCB9401F918CB0F75, player, animation, 0, -1)
        Wait(500)
        Citizen.InvokeNative(0xCB9401F918CB0F75, player, animation, 1, -1)
        TriggerServerEvent("redemrp_walkanim:setwalk", animation)
        Wait(500)
        ExecuteCommand("rc")
    end

end)

AddEventHandler("onResourceStart", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Wait(10000)
        TriggerServerEvent("redemrp_walkanim:getwalk")
    end
end)

RegisterCommand("walkstyle", function(source, args, rawCommand)
	OpenMenu()
end)

Command = false

RegisterCommand("walkslow", function(source, args, rawCommand)
	if not Command then
        Command = true
        while Command do
            Citizen.Wait(15)
            SetPedMaxMoveBlendRatio(PlayerPedId(), 0.2)

        end
    else
        Command = false
        SetPedMaxMoveBlendRatio(PlayerPedId(), 3.0)

    end
end)

