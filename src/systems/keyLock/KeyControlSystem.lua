local system = Tiny.processingSystem({
  filter = Tiny.filter('keyLock')
})

function system:process(e, dt)
  if not e.keyLock.active then
    return
  end

  local needBtn = nil

  local update = false
  for i, key in pairs(e.keyLock.combination) do
    if key.done == false and needBtn == nil then
      needBtn = key
    end
  end

  if needBtn == nil then
      e.keyLock.active = false
      update = true
  else
    for pressBtn,v in pairs(BTN_PRESSED) do
      if pressBtn == needBtn.key then
        needBtn.done = true
        local update = true
      else
        for i, key in pairs(e.keyLock.combination) do
          key.done = false
        end
        local update = true
      end
    end
  end

  if update then
    World:notifyChange(e)
  end
end

return system
