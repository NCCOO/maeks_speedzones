ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('maeks_speedzones:auszahlungzone1')
AddEventHandler('maeks_speedzones:auszahlungzone1', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.addMoney(700)
end)

RegisterServerEvent('maeks_speedzones:auszahlungzone2')
AddEventHandler('maeks_speedzones:auszahlungzone2', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.addMoney(2500)	
end)

RegisterServerEvent('maeks_speedzones:auszahlungzone3')
AddEventHandler('maeks_speedzones:auszahlungzone3', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.addMoney(5000)
end)

RegisterServerEvent('maeks_speedzones:openGUI')
AddEventHandler('maeks_speedzones:openGUI', function()
	TriggerClientEvent('maeks_speedzones:openGUI', source)
end)

RegisterServerEvent('maeks_speedzones:closeGUI')
AddEventHandler('maeks_speedzones:closeGUI', function()
	TriggerClientEvent('maeks_speedzones:closeGUI', source)
end)


function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end
