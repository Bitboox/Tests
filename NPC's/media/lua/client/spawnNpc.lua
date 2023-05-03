Events.OnGameStart.Add(function()
    SpawnNpcs()
    addTimer(900000, SpawnNpcs) -- Llama a SpawnNpcs cada 15 minutos (900000ms)
end)
