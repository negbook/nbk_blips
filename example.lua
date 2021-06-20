
TriggerEvent('nbk_blips:RequestClosestBlipBySpriteUpdate',277,function(blip,sprite) 
    print('(AllTypes) ClosestBlip updated',blip,sprite)
 
end)

TriggerEvent('nbk_blips:RequestOnScreenClosestBlipBySpriteUpdate',277,function(blip,sprite,onscreen) 
    print('OnScreen ClosestBlip updated',blip,sprite,onscreen)
end)