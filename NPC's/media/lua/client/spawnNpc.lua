local function spawnNpcs()
    local players = getOnlinePlayers()
    for i=0, players:size()-1 do
        local player = players:get(i)
        local x, y, z = player:getX(), player:getY(), player:getZ()
        local square = getCell():getGridSquare(x, y, z)
        if square ~= nil then
            local numZombies = square:getZombieCount()
            local maxZombies = square:getMaxZombies()
            local numSurvivors = square:getModData().numSurvivors or 0
            local maxSurvivors = math.floor(maxZombies/10)
            if numSurvivors < maxSurvivors then
                local survivorsToSpawn = maxSurvivors - numSurvivors
                local offset = ZombRand(10, 20)
                for i=1, survivorsToSpawn do
                    local angle = ZombRand()*math.pi*2
                    local offsetx = math.floor(offset * math.cos(angle))
                    local offsety = math.floor(offset * math.sin(angle))
                    local newspawnx = x + offsetx
                    local newspawny = y + offsety
                    spawnSurvivor(newspawnx, newspawny, z) -- llama a la función spawnSurvivor() del archivo spawnNpc.lua
                end
            end
        end
    end
end

Events.OnTick.Add(spawnNpcs)
