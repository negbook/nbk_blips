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

function GetCloestBlip()
    local myCoords = GetEntityCoords(PlayerPedId())
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

function GetCloestBlipBySprite(id)
    local myCoords = GetEntityCoords(PlayerPedId())
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

