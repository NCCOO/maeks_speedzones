-- Script made by Maeks -- Version 1.0.1 --


local BlitzerBildschirm = true 
local BlipsAn = true 

local auszahlung = true

ESX = nil
local wennerreicht = false
local endpreis = 0;

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

-- Nur die Blips!
local blips = {
	-- Zone1
	{title="Speedzone - Level 1", colour=2, id=161, x = 774.22, y = -2065.57, z = 29.38},
	{title="Speedzone - Level 1", colour=2, id=161, x = -187.84, y = -891.94, z = 29.34},
	{title="Speedzone - Level 1", colour=2, id=161, x = -172.1, y = 6359.22, z = 31.48},
	
	-- Zone2
	{title="Speedzone - Level 2", colour=5, id=161, x = 2506.0671, y = 4145.2431, z = 38.1054}, 
	{title="Speedzone - Level 2", colour=5, id=161, x = 1083.63, y = 538.74, z = 95.38}, 
	{title="Speedzone - Level 2", colour=5, id=161, x = -1274.55, y = 2515.34, z = 19.81}, 
	
	-- Zone3
	{title="Speedzone - Level 3", colour=1, id=161, x = -2727.59, y = 1.02, z = 15.52}, 
	{title="Speedzone - Level 3", colour=1, id=161, x = 2442.2006, y = -134.6004, z = 88.7765}, 
	{title="Speedzone - Level 3", colour=1, id=161, x = 2871.7951, y = 3540.5795, z = 53.0930} 
}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
		if BlipsAn == true then
			info.blip = AddBlipForCoord(info.x, info.y, info.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 1.0)
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		end
	end
end)

-- Zonen Mittelpunkt (Punkt zum Geld adden)
local speedzone1 = {
    {x = 774.22,y = -2065.57,z = 29.38},
	{x = -187.84,y = -891.94,z = 29.34},
	{x = -172.1,y = 6359.22,z = 31.48}
}

local speedzone2 = {
    {x = 2506.0671,y = 4145.2431,z = 38.1054},
    {x = 1083.63,y = 538.74,z = 95.38},
    {x = -1274.55,y = 2515.34,z = 19.81}
}

local speedzone3 = {
    {x = -2727.59,y = 1.02,z = 15.52},
    {x = 2442.2006,y = -134.6004,z = 88.7765},
    {x = 2871.7951,y = 3540.5795,z = 53.0930}
}

-- Zonen Einstellungen
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

		--  Zone Level 1
        for k in pairs(speedzone1) do
            local spielercoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(spielercoords.x, spielercoords.y, spielercoords.z, speedzone1[k].x, speedzone1[k].y, speedzone1[k].z)

            if dist <= 40.0 then
				local playerPed = GetPlayerPed(-1)
				local playerCar = GetVehiclePedIsIn(playerPed, false)
				local veh = GetVehiclePedIsIn(playerPed)
				local SpeedKM = GetEntitySpeed(playerPed)*3.6
				local maxSpeed = 150.0 
				
				if SpeedKM > maxSpeed then
					if IsPedInAnyVehicle(playerPed, false) then
						if (GetPedInVehicleSeat(playerCar, -1) == playerPed) then
							if wennerreicht == false then
								if GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE2" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE3" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE4" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICEB" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICET" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "SHERIFF" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "FIRETRUK" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "AMBULANCE" then 
								else
									
									if BlitzerBildschirm == true then
										TriggerServerEvent('maeks_speedzones:openGUI')
									end
									
									if BlitzerBildschirm == true then
										Citizen.Wait(3000)
										TriggerServerEvent('maeks_speedzones:closeGUI')
									end
									
									if auszahlung == true then
										TriggerServerEvent('maeks_speedzones:auszahlungzone1')
									end
								
									wennerreicht = true
									Citizen.Wait(5000) 
								end
							end
						end
					end
					
					wennerreicht = false
				end
            end
        end
		
		-- Zone Level 2
		for k in pairs(speedzone2) do
            local spielercoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(spielercoords.x, spielercoords.y, spielercoords.z, speedzone2[k].x, speedzone2[k].y, speedzone2[k].z)

            if dist <= 40.0 then
				local playerPed = GetPlayerPed(-1)
				local playerCar = GetVehiclePedIsIn(playerPed, false)
				local veh = GetVehiclePedIsIn(playerPed)
				local SpeedKM = GetEntitySpeed(playerPed)*3.6
				local maxSpeed = 200.0 
				
				if SpeedKM > maxSpeed then
					if IsPedInAnyVehicle(playerPed, false) then
						if (GetPedInVehicleSeat(playerCar, -1) == playerPed) then					
							if wennerreicht == false then
								if GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE" then
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE2" then
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE3" then
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE4" then
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICEB" then
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICET" then
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "FIRETRUK" then
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "AMBULANCE" then
								else
														
									if BlitzerBildschirm == true then
										TriggerServerEvent('maeks_speedzones:openGUI')
									end
									
									if BlitzerBildschirm == true then
										Citizen.Wait(3000)
										TriggerServerEvent('maeks_speedzones:closeGUI')
									end
									
									if auszahlung == true then
										TriggerServerEvent('maeks_speedzones:auszahlungzone2')
									end
									
									wennerreicht = true
									Citizen.Wait(5000) 
								end
							end
						end
					end
					
					wennerreicht = false
				end
            end
        end
		
		-- Zone Level 3
		for k in pairs(speedzone3) do
            local spielercoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(spielercoords.x, spielercoords.y, spielercoords.z, speedzone3[k].x, speedzone3[k].y, speedzone3[k].z)

            if dist <= 40.0 then
				local playerPed = GetPlayerPed(-1)
				local playerCar = GetVehiclePedIsIn(playerPed, false)
				local veh = GetVehiclePedIsIn(playerPed)
				local SpeedKM = GetEntitySpeed(playerPed)*3.6
				local maxSpeed = 300.0
				
				if SpeedKM > maxSpeed then
					if IsPedInAnyVehicle(playerPed, false) then
						if (GetPedInVehicleSeat(playerCar, -1) == playerPed) then 
							if wennerreicht == false then
								if GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE2" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE3" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICE4" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICEB" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "POLICET" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "FIRETRUK" then 
								elseif GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == "AMBULANCE" then 
								else
								
									if BlitzerBildschirm == true then
										TriggerServerEvent('maeks_speedzones:openGUI')
									end
									
									if BlitzerBildschirm == true then
										Citizen.Wait(3000)
										TriggerServerEvent('maeks_speedzones:closeGUI')
									end
										
									if auszahlung == true then
										TriggerServerEvent('maeks_speedzones:auszahlungzone3')
									end

									wennerreicht = true
									Citizen.Wait(5000) 
								end
							end
						end
					end
					
					wennerreicht = false
				end
            end
        end
    end
end)

RegisterNetEvent('maeks_speedzones:openGUI')
AddEventHandler('maeks_speedzones:openGUI', function()
    SetNuiFocus(false,false)
    SendNUIMessage({type = 'openSpeedcamera'})
end)   

RegisterNetEvent('maeks_speedzones:closeGUI')
AddEventHandler('maeks_speedzones:closeGUI', function()
    SendNUIMessage({type = 'closeSpeedcamera'})
end)
