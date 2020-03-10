local system = Tiny.processingSystem({
  filter = Tiny.filter('garbageCollector')
})

function system:process(e)
  
end

function system:postWrap(dt)
  BTN_PRESSED = {}
end

return system
