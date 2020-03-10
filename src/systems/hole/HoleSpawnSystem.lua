local system = Tiny.processingSystem({
  filter = Tiny.filter('holeSpawner&position')
})
local spawnTimer = 10
function system:process(e, dt)
  if spawnTimer > 0 then
    spawnTimer = spawnTimer - 2*dt
    return
  end
  local newX, newY = love.math.random(32,WindowWidth-96), e.position.y
  local hole = Entities.Hole(newX, newY)
  World:addEntity(hole)
  HOLES[hole] = true
  spawnTimer = love.math.random(10,25)
end

return system
