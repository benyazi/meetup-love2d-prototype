local system = Tiny.processingSystem({
  filter = Tiny.filter('waterLevel')
})

function system:process(e, dt)
  if e.waterLevel.level >= 100 then
    return
  end
  for hole,glag in pairs(HOLES) do
    -- print(Inspect(hole))
    if hole.hole.active then
      e.waterLevel.level = e.waterLevel.level + 0.1 * hole.hole.power * dt;
    end
  end
  World:notifyChange(e)
end

return system
