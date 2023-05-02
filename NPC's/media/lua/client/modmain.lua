function CreateRandomSurvivor()
    local character = SurvivorFactory.CreateSurvivor()
    character:getStats():setMaxWeight(math.random(100, 200)) -- Establece un peso máximo aleatorio
    character:setName(getName()) -- Asigna un nombre aleatorio
    character:setMale(math.random() > 0.5) -- Establece el género aleatoriamente
    character:setModel(getModel()) -- Asigna un modelo de personaje aleatorio
    character:getStats():setHunger(0) -- Establece el hambre en 0
    character:getStats():setThirst(0) -- Establece la sed en 0
    character:getStats():setPain(0) -- Establece el dolor en 0
    character:getStats():setEndurance(1) -- Establece la resistencia en 1
    character:getStats():setFitness(1) -- Establece la forma física en 1
    character:getStats():setStress(0) -- Establece el estrés en 0
    character:getStats():setMorale(0) -- Establece la moral en 0
    getWorld():getLuaEventManager():triggerEvent("OnCreatePlayer", character) -- Evento que se dispara cuando se crea un jugador
end

function getName()
    -- Lista de nombres aleatorios
    local names = {"Alice", "Bob", "Charlie", "Daisy", "Ethan", "Frank", "Gina", "Harry", "Isabella", "Jacob", "Katie", "Liam", "Mia", "Nathan", "Olivia", "Penelope", "Quentin", "Rachel", "Sophie", "Thomas", "Ursula", "Victoria", "Walter", "Xavier", "Yvette", "Zachary"}
    -- Devuelve un nombre aleatorio de la lista
    return names[math.random(#names)]
end

function getModel()
    -- Lista de modelos de personajes aleatorios
    local models = {"female_1", "female_2", "female_3", "male_1", "male_2", "male_3"}
    -- Devuelve un modelo de personaje aleatorio de la lista
    return models[math.random(#models)]
end

Events.OnGameStart.Add(CreateRandomSurvivor) -- Se llama a la función al inicio del juego
