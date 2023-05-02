require "NPCs/ISUI/ISUIHandler"
require "NPCs/ISUI/ISUIMenu"
require "ISUI/ISPanelJoypad"
require "scripts/Profession"
require "spawnNpc"

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


