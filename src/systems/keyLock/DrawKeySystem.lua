local system = Tiny.processingSystem({
  filter = Tiny.filter('keyLock&position'),
  isDrawSystem = true})

function system:process(e)
  if not e.keyLock.active then
    return
  end
  love.graphics.setColor(0,1,0)
  love.graphics.rectangle('fill', e.position.x - 5, e.position.y - 5, e.size.w + 10, e.size.h + 10)
  for i,key in pairs(e.keyLock.combination) do
    if key.done then
      love.graphics.setColor(0,1,0)
    else
      love.graphics.setColor(1,1,1)
    end
    love.graphics.draw(Assets['arrow_' .. key.key], e.position.x + (i-1)*10,  e.position.y - 25)
    -- love.graphics.print(key.key, e.position.x + (i-1)*30,  e.position.y - 25)
  end
  -- return default color
  love.graphics.setColor(0,0,0)
end

return system
