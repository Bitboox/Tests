require "ISUI/ISPanelJoypad"

ISUIMenu = ISPanelJoypad:derive("ISUIMenu")

function ISUIMenu:createChildren()
    self.listbox = ISScrollingListBox:new(0, 48, self.width, self.height - 48)
    self.listbox:initialise()
    self.listbox:instantiate()
    self:addChild(self.listbox)

    self:addListItems()
end

function ISUIMenu:addListItems()
    self.listbox:clear()
    local player = getSpecificPlayer(0)
    local npcList = getCell():getEntities():getAllZombies()
    for i = 0, npcList:size() - 1 do
        local npc = npcList:get(i)
        if npc:isSuvivor() then
            self.listbox:addItem(npc:getType(), npc)
        end
    end
end

function ISUIMenu:new(x, y, width, height)
    local o = ISPanelJoypad.new(self, x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    return o
end

function ISUIMenu:onGainJoypadFocus(joypadData)
    ISPanelJoypad.onGainJoypadFocus(self, joypadData)
    self.joypadFocusedButton = self.listbox
end

function ISUIMenu:onJoypadDown(button, joypadData)
    if button == Joypad.AButton then
        self.listbox.items[self.listbox.selected].item:Say("Hello!")
    elseif button == Joypad.BButton then
        self:close()
    else
        ISPanelJoypad.onJoypadDown(self, button, joypadData)
    end
end
