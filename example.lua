Citizen.CreateThread(function()
    while true do 
        local ped = PlayerPedId()
        local blips = GetClosestBlip(ped)
        --print(blips)
        Citizen.Wait(1110)
        
    end 
end)
TriggerEvent('nbk_blips:RequestClosestBlipBySpriteUpdate',277,function(blip,sprite) 
    print('(AllTypes) ClosestBlip updated',blip,sprite)
 
end)

TriggerEvent('nbk_blips:RequestOnScreenClosestBlipBySpriteUpdate',277,function(blip,sprite) 
    print('OnScreen ClosestBlip updated',blip,sprite)
end)