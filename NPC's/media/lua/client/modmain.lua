require "ISUI/ISUIHandler"
require "ISUI/ISUIMenu"
require "ISUI/ISPanelJoypad"
require "scripts/Professions"

function AreNpcsNearby(player, x, y, z, radius)
    for i=0,getWorld():getNumZombies()-1 do
        local npc = getWorld():getZombieByIndex(i)
        if npc and npc:isSpawned() and not npc:isDead() and npc:getDistanceWith(x, y, z) <= radius then
            return true
        end
    end
    return false
end

function SpawnNpcs()
    local player = getSpecificPlayer(0)
    if player and not AreNpcsNearby(player, player:getX(), player:getY(), player:getZ(), 5) then
        if ZombRand(100) < 10 then
            local x, y, z = player:getX(), player:getY(), player:getZ()
            local numNpcs = ZombRand(5) + 1 -- Genera entre 1 y 5 NPCs
            for i=1,numNpcs do
                local name = getFullName()
                local profession = getProfession()
                local npc = addNpc(x, y, z, name, profession, "Melee", nil, nil, nil)
                npc:getInventory():Add("Base.Bat")
            end
        end
    end
end

function getFullName()
    local firstName = getFullNamePart("firstName")
    local lastName = getFullNamePart("lastName")
    return firstName .. " " .. lastName
end

function getFullNamePart(partType)
    local parts = getText("IGUI_Names_" .. partType)
    local partsTable = {}
    for part in string.gmatch(parts, '([^,]+)') do
        table.insert(partsTable, part)
    end
    return partsTable[ZombRand(#partsTable)]
end

function getProfession()
    local professions = ProfessionFactory.getProfessions()
    local professionTable = {}
    for _, profession in ipairs(professions) do
        if not profession.isFake then
            table.insert(professionTable, profession)
        end
    end
    return professionTable[ZombRand(#professionTable)].type
end

function OnGameStart()
    SpawnNpcs()
    addTimer(900000, SpawnNpcs) -- Llama a SpawnNpcs cada 15 minutos (900000ms)
end

Events.OnGameStart.Add(OnGameStart)
