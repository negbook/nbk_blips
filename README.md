Credits:
negbook


exports functions: 
```
    exports.nbk_blips:GetBlips()
    exports.nbk_blips:GetCloestBlip()
    exports.nbk_blips:GetOnScreenBlips()
    exports.nbk_blips:GetBlipsBySprite()
    exports.nbk_blips:GetCloestBlipBySprite()
    exports.nbk_blips:GetOnScreenBlipsBySprite()
```
    
example:
```
Citizen.CreateThread(function()
    while true do 
        local blips = exports.nbk_blips:GetCloestBlipBySprite(277)
        local coords = GetBlipCoords(blips) 
        print("The Cloest ATM Blips:"..blips.." x:".. coords.x  .. "y:"..coords.y  .."z:"..coords.z )
        Citizen.Wait(330)
    end 
end)

```