local system = Tiny.processingSystem({
  filter = Tiny.filter('guiManager'),
  isDrawGuiSystem = true})

function system:process(e)
	love.graphics.setColor(1,0,0)
  love.graphics.print("HOLES DONE: " .. HOLE_DONE_COUNT, 37, 57)
	love.graphics.setColor(1,1,1)
end

return system
