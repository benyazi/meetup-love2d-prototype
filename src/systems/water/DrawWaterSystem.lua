local system = Tiny.processingSystem({
  filter = Tiny.filter('waterLevel'),
  isDrawGuiSystem = true})

function system:process(e)
  love.graphics.setColor(0, 0, 1, 0.25)
  local waterHeight = (WindowHeight/100) * e.waterLevel.level
  love.graphics.rectangle('fill', 0, WindowHeight-waterHeight, WindowWidth, waterHeight)
  -- return default color
  love.graphics.setColor(1,1,1)
end

return system
