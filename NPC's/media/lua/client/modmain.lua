require "NPCs/ISUI/ISUIHandler"
require "NPCs/ISUI/ISUIMenu"
require "ISUI/ISPanelJoypad"
require "Professions"
require "spawnNpc"

local function isPlayerAdmin(player)
    return player ~= nil and player:isAdmin()
end

local function spawnNearPlayer(player, radius)
    local x, y, z = player:getX(), player:getY(), player:getZ()
    local square = getCell():getGridSquare(x, y, z)
    if square == nil then
        return
    end

    for i = 1, 5 do -- Genera hasta 5 NPCs
        local offsetx = ZombRand(-radius, radius)
        local offsety = ZombRand(-radius, radius)
        local newspawnx = x + offsetx
        local newspawny = y + offsety
        spawnNPC(newspawnx, newspawny) -- Llama a la función spawnNPC() del archivo spawnNpc.lua
    end
end

local function onPlayerUpdate(player)
    if isPlayerAdmin(player) then
        spawnNearPlayer(player, 30) -- Genera NPCs en un radio de 30 baldosas
    end
end

Events.OnPlayerUpdate.Add(onPlayerUpdate)
