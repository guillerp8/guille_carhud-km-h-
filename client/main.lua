-- Guille_Carhud Optimized by VisiBait -> https://github.com/visibait. Original author: guillerp8 -> https://github.com/guillerp8

ESX = nil

Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0)
    end 
end)




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        local jugador = PlayerPedId()
        local sleep = true
        if IsPedInAnyVehicle(jugador) then
            sleep = false
            local vehiculo = GetVehiclePedIsUsing(jugador)
            local velo = (GetEntitySpeed(vehiculo)* 3.6) -- Relación con km/h http://www.kronzky.info/fivemwiki/index.php?title=GetEntitySpeed
            local gaso = GetVehicleFuelLevel(vehiculo)
            local marcha = GetVehicleCurrentGear(vehiculo)
            local revoluciones = (ESX.Math.Round(GetVehicleCurrentRpm(vehiculo), 3) * 1000)
            local vida = GetVehicleEngineHealth(vehiculo)
            local coche = IsPedSittingInAnyVehicle(jugador)

        
            Citizen.Wait(20)
            SendNUIMessage({
                coche = coche; 
                vel = velo; 
                gasolina = gaso;
                cuent = marcha;
                rpm = revoluciones;
                vida = vida;
            })
        else
            SendNUIMessage({
                coche = false;
            })
        end
        if sleep then Citizen.Wait(250) end
    end
end)
