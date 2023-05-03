require "ISUI/ISUIHandler"
require "ISUI/ISUIMenu"
require "ISUI/ISPanelJoypad"
require "scripts/Professions"

function SpawnNpcs()
    local player = getSpecificPlayer(0)
    if player then
        local x, y, z = player:getX(), player:getY(), player:getZ()
        if not AreNpcsNearby(player, x, y, z, 30) then
            local numNpcs = ZombRand(5) + 1 -- Genera entre 1 y 5 NPCs
            for i=1,numNpcs do
                local name = getFullName()
                local profession = getProfession()
                local npc = addNpc(x, y, z, name, profession, "Melee", nil, nil, nil)
                npc:getInventory():AddItem("Base.Bat")
            end
        end
    end
end

function AreNpcsNearby(player, x, y, z, radius)
    local squareRadius = radius * radius
    for _,npc in ipairs(getOnlineNpcs()) do
        if npc:isInWorld() and npc:isDead() == false then
            local dx, dy, dz = npc:getX() - x, npc:getY() - y, npc:getZ() - z
            if dx * dx + dy * dy + dz * dz <= squareRadius then
                return true
            end
        end
    end
    return false
end

Events.OnTick.Add(SpawnNpcs)

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
