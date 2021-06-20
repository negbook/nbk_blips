Citizen.CreateThread(function()
    while true do 
        local ped = PlayerPedId()
        local blips = GetClosestBlip(ped)
        --print(blips)
        Citizen.Wait(1110)
        
    end 
end)
