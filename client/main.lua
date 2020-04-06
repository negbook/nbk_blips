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
        local retval = IsSphereVisible(BlipCoords,1.0)
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
        if closestBlipDistance == -1 or closestBlipDistance > distance then
            closestBlip  = Blip
            closestBlipDistance = distance
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
    for i,Blip in pairs (GetBlips()) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        if closestBlipDistance == -1 or closestBlipDistance > distance then
            if IsSphereVisible(BlipCoords,1.0) then 
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
        local retval = IsSphereVisible(BlipCoords,1.0)
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
    for i,Blip in pairs (GetBlipsBySprite(id)) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        if closestBlipDistance == -1 or closestBlipDistance > distance then
            if IsSphereVisible(BlipCoords,1.0) then 
            closestBlip  = Blip
            closestBlipDistance = distance
            end 
        end
    end
    return closestBlip,closestBlipDistance
end 

function GetOnScreenClosestBlipBySpriteByCoords(id,coords)
    local myCoords = coords
    local closestBlipDistance = -1
    local closestBlip  = -1
    for i,Blip in pairs (GetBlipsBySprite(id)) do
        local BlipCoords = GetBlipCoords(Blip)
        local distance      = #(BlipCoords - myCoords)
        if closestBlipDistance == -1 or closestBlipDistance > distance then
            if IsSphereVisible(BlipCoords,1.0) then 
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
    while true do 
        local coords = GetEntityCoords(PlayerPedId())
        for i,Blip in pairs (GetBlips()) do
            local BlipCoords = GetBlipCoords(Blip)
            local dist = #(coords - BlipCoords)
            local bool,xper,yper = GetScreenCoordFromWorldCoord(BlipCoords.x,BlipCoords.y,BlipCoords.z)
            if bool and dist < 80.0 and xper > 0.31 and xper < 0.68  and yper > 0.31 and yper < 0.68  then 
                if not BlipsOnScreen[Blip] then 
                    BlipsOnScreen[Blip] = true
                    TriggerEvent('OnBlipOnScreen',GetBlipSprite(Blip),Blip,BlipCoords)
                end 
				if not BlipsHasBeenOnScreen[Blip] then 
					BlipsHasBeenOnScreen[Blip] = true 
					TriggerEvent('OnBlipFirstOnScreen',GetBlipSprite(Blip),Blip,BlipCoords)
				end 
            else 
                if BlipsOnScreen[Blip] then 
                    BlipsOnScreen[Blip] = false
                    TriggerEvent('OnBlipOutScreen',GetBlipSprite(Blip),Blip,BlipCoords)
                end 
            end 
        end
        Citizen.Wait(1000)
    end 
end)
