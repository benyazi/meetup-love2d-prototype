local system = Tiny.processingSystem({
  filter = Tiny.filter('keyLock')
})

function system:process(e, dt)
  if not e.keyLock.active then
    return
  end
  local update = false
  for i, key in pairs(e.keyLock.combination) do
    if key.done then

    elseif love.keyboard.isDown(key.key) then
        key.done = true
        update = true
    end
  end
  if update then
    World:notifyChange(e)
  end
end

return system
