require "NPCs/ISUI/ISUIHandler"
require "NPCs/ISUI/ISUIMenu"
require "ISUI/ISPanelJoypad"
require "Professions"

function spawnNPC(x, y)
    local square = getCell():getGridSquare(x, y, 0)
    if square == nil then
        return
    end

    local npc = getWorld():createNpc(getRandomProfession(), square)
    if npc == nil then
        return
    end

    npc:setName(getRandomName())
    npc:setCustomName(npc:getName())

    local traits = getRandomTraits()
    npc:getTraits():clear()
    for i = 1, #traits do
        npc:getTraits():add(traits[i])
    end

    npc:setModel(getRandomModel())

    npc:getStats():setMaxWeight(math.random(100, 200))
    npc:getStats():setHunger(0)
    npc:getStats():setThirst(0)
    npc:getStats():setPain(0)
    npc:getStats():setEndurance(1)
    npc:getStats():setFitness(1)
    npc:getStats():setStress(0)
    npc:getStats():setMorale(0)

    npc:Say("Hi there!")

    return npc
end

function getRandomName()
    local names = {"Alice", "Bob", "Charlie", "Daisy", "Ethan", "Frank", "Gina", "Harry", "Isabella", "Jacob", "Katie", "Liam", "Mia", "Nathan", "Olivia", "Penelope", "Quentin", "Rachel", "Sophie", "Thomas", "Ursula", "Victoria", "Walter", "Xavier", "Yvette", "Zachary"}
    return names[math.random(#names)]
end

function getRandomModel()
    local models = {"female_1", "female_2", "female_3", "male_1", "male_2", "male_3"}
    return models[math.random(#models)]
end

function getRandomProfession()
    return ProfessionTable[math.random(#ProfessionTable)].type
end

function getRandomTraits()
    local traits = {}
    while #traits < 2 do
        local trait = TraitFactory.getTrait(getRandomTrait())
        if trait and not trait:IsNegative() and not trait:IsMutation() then
            traits[#traits + 1] = trait
        end
    end
    return traits
end

function getRandomTrait()
    local traits = {"Brave", "Clumsy", "FastHealer", "Graceful", "Lucky", "Outdoorsman", "ProneToIllness", "SelfDefenseClass", "SlowHealer", "ThickSkinned", "FastReader", "Hiker", "LightEater", "Organized", "ShortSighted", "Asthmatic", "Hemophobic", "WeakStomach"}
    return traits[math.random(#traits)]
end
