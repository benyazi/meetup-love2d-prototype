local system = Tiny.processingSystem({
  filter = Tiny.filter('marioControl&position')})

function system:onAdd(e)

end

local movingFilter = function(item, other)
  if other.isPlatform then
    return 'slide'
  end
  -- else return nil
end

function system:process(e, dt)
  local xvel = 0
  if love.keyboard.isDown('a') then
    	xvel = -e.marioControl.speed * 25 * dt
 	end
 	if love.keyboard.isDown('d') then
    	xvel = e.marioControl.speed * 25 * dt
 	end
  if xvel == 0 then
    return
  end
  local finalX, finalY, collisions = World.physics:move(e, e.position.x + xvel, e.position.y, movingFilter)
  e.position.x = finalX
  e.position.y = finalY
  World:notifyChange(e)
  -- print(World.physics:getRect(e))
end

return system
