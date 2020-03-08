local system = Tiny.processingSystem({
  filter = Tiny.filter('keyLock&position&size')
})

local keyLockEnterFilter = function(item, other)
  if item.isPlayer then
    return 'cross'
  end
  -- else return nil
end

function system:process(e, dt)
  local items, len = World.physics:queryRect(e.position.x, e.position.y, e.size.w, e.size.h, keyLockEnterFilter)
  local active = false
	if len > 0 then
    active = true
  end
  if e.keyLock.active ~= active then
    e.keyLock.active = active
    World:notifyChange(e)
  end
end

return system
