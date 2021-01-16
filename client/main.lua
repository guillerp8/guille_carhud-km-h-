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
        local jugador = GetPlayerPed(-1)
        if IsPedInAnyVehicle(jugador) then

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
    end
end)