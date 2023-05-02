require "spawnNPC"

function CreateRandomNPC()
    local x, y = getPlayer():getX(), getPlayer():getY()
    spawnNPC(x, y)
end

function SpawnNPCItem(player, item)
    local x, y = player:getX(), player:getY()
    spawnNPC(x, y)
end

Events.OnGameStart.Add(CreateRandomNPC)

-- Agregar un item llamado "spawnNPCItem"
local item = scriptManager:CreateItem("Base.Hammer")
item:setDisplayName("Spawn NPC Item")
item:setName("spawnNPCItem")
item:setUseDelta(0.1)
item:setCustomContextMenuOption("Spawn NPC", SpawnNPCItem)
item:toLuaItem():setAlwaysWelcomeGift(true)
