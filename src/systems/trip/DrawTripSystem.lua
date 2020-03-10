local system = Tiny.processingSystem({
  filter = Tiny.filter('tripManager'),
  isDrawGuiSystem = true})

function system:process(e)
  local percent = 33.3
	love.graphics.setColor(1,1,1)
  love.graphics.rectangle('fill', WindowWidth - 116, 16, 100, 3)
  love.graphics.draw(Assets['ship'], WindowWidth - (24 + 100 - e.tripManager.value), 0)
	love.graphics.setColor(1,1,1)
end

return system
