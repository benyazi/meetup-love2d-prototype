local system = Tiny.processingSystem({
  filter = Tiny.filter('waterLevel')
})

function system:process(e, dt)
  if e.waterLevel.level >= 100 then
    World:addEntity(Entities.events.GameOver())
    return
  end
  for hole,glag in pairs(HOLES) do
    if hole.hole.active then
      e.waterLevel.level = e.waterLevel.level + 0.1 * hole.hole.power * dt;
    end
  end
  World:notifyChange(e)
end

return system
