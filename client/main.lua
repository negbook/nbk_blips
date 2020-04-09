local HookedSprite = {}
function GetBlips()
    local ActivesBlips = {} 
    for i = 1 , 528 do 
        local blip = GetFirstBlipInfoId(i) 
        local found = DoesBlipExist(blip)    
            while found do 
                table.insert(ActivesBlips,blip)
                blip = GetNextBlipInfoId(i)
                found = DoesBlipExist(blip)
                if not found then 
                    break
                end 
            end 
        
    end 
    return ActivesBlips
end 

function GetOnScreenBlips()
    local OnScreenBlips = {}
    for i,Blip in pairs (GetBlips()) do
        local BlipCoords = GetBlipCoords(Blip)
        local myCoords = GetEntityCoords(PlayerPedId())
        local dist = #(myCoords-BlipCoords)
        local retval = IsSphereVisible(BlipCoords,0.1) and dist < 40.0
        if retval then 
			table.insert(OnScreenBlips,Blip)
		elseif not retval then 
		end 
    end
    return OnScreenBlips
end 

function GetClosestBlip(ped)
    local xped = PlayerPedId() 
    if ped then xped = ped end 
    local myCoords = GetEntityCoords(xped)
    local closestBlipDistance = -1
    local closestBlip  = -1
    for i,Blip in pairs (GetBlips()) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        if distance < 40.0 then 
            if closestBlipDistance == -1 or closestBlipDistance > distance then
                closestBlip  = Blip
                closestBlipDistance = distance
            end
        end 
    end
    return closestBlip,closestBlipDistance
end 

function GetClosestBlipByCoords(coords)
    local myCoords = coords
    local closestBlipDistance = -1
    local closestBlip  = -1
    for i,Blip in pairs (GetBlips()) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        
            if closestBlipDistance == -1 or closestBlipDistance > distance then
                closestBlip  = Blip
                closestBlipDistance = distance
            end
         
    end
    return closestBlip,closestBlipDistance
end 

function GetOnScreenClosestBlip()
    local xped = PlayerPedId() 
    local myCoords = GetEntityCoords(xped)
    local closestBlipDistance = -1
    local closestBlip  = -1
    for i,Blip in pairs (GetOnScreenBlips()) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        if distance < 40.0 then 
            if closestBlipDistance == -1 or closestBlipDistance > distance then
                if IsSphereVisible(BlipCoords,0.1) then 
                closestBlip  = Blip
                closestBlipDistance = distance
                end 
            end
        end 
    end
    return closestBlip,closestBlipDistance
end 

function GetOnScreenClosestBlipByCoords(coords)
    local myCoords = coords
    local closestBlipDistance = -1
    local closestBlip  = -1
    for i,Blip in pairs (GetOnScreenBlips()) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        
            if closestBlipDistance == -1 or closestBlipDistance > distance then
                if IsSphereVisible(BlipCoords,0.1) then 
                closestBlip  = Blip
                closestBlipDistance = distance
                end 
            end
        
    end
    return closestBlip,closestBlipDistance
end 

function GetBlipsBySprite(id)
    local blipstable = {}
    local blip = GetFirstBlipInfoId(id) 
        local found = DoesBlipExist(blip)    
            while found do 
                table.insert(blipstable,blip)
                blip = GetNextBlipInfoId(id)
                found = DoesBlipExist(blip)
                if not found then 
                    break
                end 
            end 
    return blipstable
end 

function GetOnScreenBlipsBySprite(id)
    local OnScreenBlips = {}
    for i,Blip in pairs (GetBlipsBySprite(id)) do
        local BlipCoords = GetBlipCoords(Blip)
        local myCoords = GetEntityCoords(PlayerPedId())
        local dist = #(myCoords-BlipCoords)
        local retval = IsSphereVisible(BlipCoords,0.1) and dist < 40.0 
        if retval then 
			table.insert(OnScreenBlips,Blip)
		elseif not retval then 
		end 
    end
    return OnScreenBlips
end 

function GetClosestBlipBySprite(id,ped)
    local xped = PlayerPedId() 
    if ped then xped = ped end 
    local myCoords = GetEntityCoords(xped)
    local closestBlipDistance = -1
    local closestBlip  = -1
    for i,Blip in pairs (GetBlipsBySprite(id)) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        if distance < 40.0 then
            if closestBlipDistance == -1 or closestBlipDistance > distance then
                closestBlip  = Blip
                closestBlipDistance = distance
            end
        end
    end
    return closestBlip,closestBlipDistance
end 

function GetClosestBlipBySpriteByCoords(id,coords)
    local xped = PlayerPedId() 
    local myCoords = coords
    local closestBlipDistance = -1
    local closestBlip  = -1
    for i,Blip in pairs (GetBlipsBySprite(id)) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        
            if closestBlipDistance == -1 or closestBlipDistance > distance then
                closestBlip  = Blip
                closestBlipDistance = distance
            end
        
    end
    return closestBlip,closestBlipDistance
end 

function GetOnScreenClosestBlipBySprite(id)
    local xped = PlayerPedId() 
    local myCoords = GetEntityCoords(xped)
    local closestBlipDistance = -1
    local closestBlip  = -1
    for i,Blip in pairs (GetOnScreenBlipsBySprite(id)) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        if distance < 40.0 then
            if closestBlipDistance == -1 or closestBlipDistance > distance then
                if IsSphereVisible(BlipCoords,0.1) then 
                closestBlip  = Blip
                closestBlipDistance = distance
                end 
            end
        end 
    end
    return closestBlip,closestBlipDistance
end 

function GetOnScreenClosestBlipBySpriteByCoords(id,coords)
    local myCoords = coords
    local closestBlipDistance = -1
    local closestBlip  = -1
    for i,Blip in pairs (GetOnScreenBlipsBySprite(id)) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        
            if closestBlipDistance == -1 or closestBlipDistance > distance then
                if IsSphereVisible(BlipCoords,0.1) then 
                closestBlip  = Blip
                closestBlipDistance = distance
                end 
            end
        
    end
    return closestBlip,closestBlipDistance
end 

Citizen.CreateThread(function()
	
    local BlipsOnScreen = {}
	local BlipsHasBeenOnScreen = {}
	local OldClosestBlip = nil
	local CurrentClosestBlip = nil
	local OldOnScreenClosestBlip = nil
	local CurrentOnScreenClosestBlip = nil
	local OldClosestBlipBySprite = nil
	local CurrentClosestBlipBySprite = nil
	local OldOnScreenClosestBlipBySprite = nil
	local CurrentOnScreenClosestBlipBySprite = nil
    while true do 
        local coords = GetEntityCoords(PlayerPedId())
		
		CurrentClosestBlip = GetClosestBlipByCoords(coords)
		if OldClosestBlip ~= CurrentClosestBlip then 
			TriggerEvent('OnClosestBlipUpdate',CurrentClosestBlip,OldClosestBlip)
			OldClosestBlip = CurrentClosestBlip
		end 
		CurrentOnScreenClosestBlip = GetOnScreenClosestBlipByCoords(coords)
        if OldOnScreenClosestBlip ~= CurrentOnScreenClosestBlip then 
			TriggerEvent('OnOnScreenClosestBlipUpdate',CurrentOnScreenClosestBlip,OldOnScreenClosestBlip)
			OldOnScreenClosestBlip = CurrentOnScreenClosestBlip
		end 
		
		
		for i,Blip in pairs (GetBlips()) do
            local BlipCoords = GetBlipCoords(Blip)
            local dist = #(coords - BlipCoords)
            if dist < 40.0 then 
                --local bool,xper,yper = GetScreenCoordFromWorldCoord(BlipCoords.x,BlipCoords.y,BlipCoords.z)
                local bool = IsSphereVisible(BlipCoords,0.1)
				local sprite = GetBlipSprite(Blip)
                if bool then 
                    if not BlipsOnScreen[Blip] then 
                        BlipsOnScreen[Blip] = true
                        TriggerEvent('OnBlipOnScreen',sprite,Blip,BlipCoords)
                    end 
                    if not BlipsHasBeenOnScreen[Blip] then 
                        BlipsHasBeenOnScreen[Blip] = true 
                        TriggerEvent('OnBlipFirstOnScreen',sprite,Blip,BlipCoords)
                    end 
                else 
                    if BlipsOnScreen[Blip] then 
                        BlipsOnScreen[Blip] = false
                        TriggerEvent('OnBlipOutScreen',sprite,Blip,BlipCoords)
                    end 
                end 
            end 
        end
		for i,sprite in pairs (HookedSprite) do 
            if sprite then 
            if not CurrentClosestBlipBySprite then 
                CurrentClosestBlipBySprite = GetClosestBlipBySprite(sprite) 
            else 
                CurrentClosestBlipBySprite = GetClosestBlipBySprite(sprite) 
                if OldClosestBlipBySprite ~= CurrentClosestBlipBySprite then 
                    
                    TriggerEvent('OnClosestBlipBySpriteUpdate',CurrentClosestBlipBySprite,OldClosestBlipBySprite)
                    OldClosestBlipBySprite = CurrentClosestBlipBySprite
                end 
                CurrentOnScreenClosestBlipBySprite = GetOnScreenClosestBlipBySprite(sprite)
                if OldOnScreenClosestBlipBySprite ~= CurrentOnScreenClosestBlipBySprite then 
                    TriggerEvent('OnOnScreenClosestBlipBySpriteUpdate',CurrentOnScreenClosestBlipBySprite,OldOnScreenClosestBlipBySprite)
                    OldOnScreenClosestBlipBySprite = CurrentOnScreenClosestBlipBySprite
                end 
                end 
            end 
		end 
        Citizen.Wait(1000)
    end 
end)

function RegisterHook_ClosestBlipBySprite(spriteid)
	local found = false 
     
	for i,v in pairs(HookedSprite) do 
		if v == spriteid then 
			found = true 
			break
		end 
	end 
    
	if not found then 
		table.insert(HookedSprite,spriteid)
	end 
end 
RegisterNetEvent('nbk_blips:RegisterHook_ClosestBlipBySprite')
AddEventHandler('nbk_blips:RegisterHook_ClosestBlipBySprite', function(spriteid)
   
	RegisterHook_ClosestBlipBySprite(spriteid)
end)
