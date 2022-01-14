local display = false 
strg = nil

RegisterNetEvent("afk-ui:sAFK")
AddEventHandler("afk-ui:sAFK", function(source)
    strg = true 
    oCoords = GetEntityCoords(PlayerPedId())
    afk(not display)
end)

RegisterNetEvent("afk-ui:nAFK")
AddEventHandler("afk-ui:nAFK", function(source)
    if strg then 
        local ped = PlayerPedId()
        SetEntityCoords(ped, oCoords.x, oCoords.y, oCoords.z, false, false, false, true)
        FreezeEntityPosition(ped, false)
        strg = false 
    else
		print("ERROR")
    end
end)

RegisterNUICallback("playerAFK", function(data)
    local playerPed = PlayerPedId()
    afk(false)
	
    SetEntityCoords(playerPed, Config.x, Config.y, Config.z, false, false, false, true)
    FreezeEntityPosition(playerPed, true)
	HideHudComponentThisFrame(19)
end)

Citizen.CreateThread(function()
    while true do 
        Wait(1000)
        if not strg then 
        if Config.kick then 
        playerPed = GetPlayerPed(1)
        if playerPed then 
            cCoords = GetEntityCoords(playerPed, true)
        if cCoords == oCoords then 
			if time > 0 then 
				if time == math.ceil(Config.time / 2) then 
                end 
                if time == math.ceil(Config.time / 3) then 
                end
                if time == math.ceil(Config.time / 6) then 
                end
                time = time - 1
            else 
                TriggerServerEvent("afk-ui:kick", Config.time.. " sekunden")
                end
            else
                time = Config.time 
            end
                oCoords = cCoords
				end
			end
        end
    end
end)

RegisterNUICallback('escape', function(data)
    afk(false)
end)

function afk(bool)
    display = bool 
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool
    })
end

RegisterNUICallback('fatal', function()
    TriggerEvent("showNotification", data.fatal)
end)

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display)
        DisableControlAction(0, 2, display)
        DisableControlAction(0, 142, display)
        DisableControlAction(0, 18, display)
        DisableControlAction(0, 322, display)
        DisableControlAction(0, 106, display)
    end
end)

