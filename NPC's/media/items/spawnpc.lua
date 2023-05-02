require "ISUI/ISInventoryPane"

MyCustomItem = {}
MyCustomItem.type = "Spawn NPC"
MyCustomItem.displayname = "NPC Invocador"
MyCustomItem.texture = "textures/NpcNotePad.png"
MyCustomItem.description = "Un objeto que invoca un NPC"
MyCustomItem.maxStack = 1
MyCustomItem.inventoryItem = true
MyCustomItem.weight = 0.5

function MyCustomItem:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function MyCustomItem:getName()
    return self.displayname
end

function MyCustomItem:getDisplayObject()
    local texture = getTexture(self.texture)
    local itemTexture = texture and texture or Texture.new("media/textures/NpcNotePad.png")
    local o = ISInventoryPaneImage:new(0, 0, 64, 64, itemTexture)
    o:initialise()
    o:instantiate()
    o:setTooltip(self:getName())
    return o
end

function MyCustomItem:use()
    spawnNPC(getSpecificPlayer(0):getX(), getSpecificPlayer(0):getY())
end

function spawnNPC(x, y)
    local playerObj = getSpecificPlayer(0)
    local sq = getCell():getGridSquare(x, y, 0)
    local survivor = addSurvivor(sq, "Random Name")
    if survivor then
        print("NPC spawned at: " .. x .. ", " .. y)
    end
end

MyCustomItem = MyCustomItem:new()
