local system = Tiny.processingSystem({
  filter = Tiny.filter('keyLock')
})

function system:process(e, dt)
  if not e.keyLock.active then
    return
  end
  local done = true
  for i, key in pairs(e.keyLock.combination) do
    if not key.done then
      done =false
    end
  end
  if done then
    World:removeEntity(e)
    HOLES[e] = nil
    e = nil
  end
end

return system
