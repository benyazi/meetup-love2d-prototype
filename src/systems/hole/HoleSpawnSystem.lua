local system = Tiny.processingSystem({
  filter = Tiny.filter('holeSpawner&position')
})

local spawnTimer = 2

function system:process(e, dt)
  if spawnTimer > 0 then
    spawnTimer = spawnTimer - dt
    return
  end

  local count = 0
  for k,v in pairs(HOLES) do count = count+1 end
  if count >= HOLE_MAX then
    return
  end

  local newX, newY = love.math.random(32,WindowWidth-96), love.math.random(32,WindowHeight-96)
  local hole = Entities.Hole(newX, newY)
  World:addEntity(hole)
  HOLES[hole] = true
  spawnTimer = love.math.random(2,10)
end

return system
