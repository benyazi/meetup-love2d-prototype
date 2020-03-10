local system = Tiny.processingSystem({
  filter = Tiny.filter('drawSprite&position'),
  isDrawSystem = true})

function system:process(e)
  love.graphics.setColor(1,1,1)
  love.graphics.draw(e.drawSprite.sprite, e.position.x, e.position.y)
end

return system
