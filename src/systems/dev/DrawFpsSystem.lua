local system = Tiny.processingSystem({
  filter = Tiny.filter('guiManager'),
  isDrawGuiSystem = true})

function system:process(e)
	love.graphics.setColor(1,0,0)
  love.graphics.print("FPS: " .. love.timer.getFPS(), 37, 37)
	love.graphics.setColor(1,1,1)
end

return system
