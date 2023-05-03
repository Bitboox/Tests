-- Requerir los archivos necesarios
require "media/scripts/NameGen"
require "media/scripts/Professions"

-- Función para crear un NPC sobreviviente
function createSurvivor()
  -- Crear un objeto NPC
	local npc = SurvivorFactory.CreateSurvivor()

  -- Generar género aleatorio
  if ZombRand(2) == 0 then
    npc:setFemale()
  else
    npc:setMale()
  end

  -- Seleccionar un nombre aleatorio dependiendo del género
  if npc:isMale() then
    npc:setForename(NameGen.GenerateMaleForename())
  else
    npc:setForename(NameGen.GenerateFemaleForename())
  end

  -- Seleccionar un apellido aleatorio
  npc:setSurname(NameGen.GenerateSurname())

  -- Seleccionar una profesión aleatoria
  npc:setJob(table.random(Professions))

  -- Asignar un bate de béisbol como arma melee
  npc:getInventory():Add("Base.BaseballBat")

  -- Retornar el objeto NPC
  return npc
end
