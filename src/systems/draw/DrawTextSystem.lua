local system = Tiny.processingSystem({
  filter = Tiny.filter('drawText&position'),
  isDrawGuiSystem = true})

function system:process(e)
  love.graphics.setColor(1,1,1)
  love.graphics.print(e.drawText.text, e.position.x, e.position.y)
end

return system
