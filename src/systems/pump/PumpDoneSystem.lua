local system = Tiny.processingSystem({
  filter = Tiny.filter('keyLock&isPump')
})

function system:process(e, dt)
  if not e.keyLock.active then
    return
  end
  local done = true
  for i, key in pairs(e.keyLock.combination) do
    if not key.done then
      done=false
    end
  end
  if done then
    for i, key in pairs(e.keyLock.combination) do
      key.done = false
    end
    WaterManager.waterLevel.level = WaterManager.waterLevel.level - 10
    if WaterManager.waterLevel.level < 0 then
      WaterManager.waterLevel.level = 0
    end
    World:notifyChange(e)
    World:notifyChange(WaterManager)
  end
end

return system
