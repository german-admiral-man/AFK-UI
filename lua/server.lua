RegisterCommand("afk", function(source, args, rawCommand)
    TriggerClientEvent("afk-ui:sAFK", source)
end, false)

RegisterCommand("afkoff", function(source, args, rawCommand)
    TriggerClientEvent("afk-ui:nAFK", source)
end, false)

RegisterServerEvent("afk-ui:kick") 
AddEventHandler("afk-ui:kick", function(time)
	DropPlayer(source, "Du warst " ..time.. " AFK und wurdest deswegen gekickt.")
end)