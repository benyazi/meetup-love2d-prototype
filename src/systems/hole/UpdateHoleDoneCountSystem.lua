local system = Tiny.processingSystem({
  filter = Tiny.filter('holeDoneEvent')
})

function system:process(e, dt)
  HOLE_DONE_COUNT = HOLE_DONE_COUNT + 1
end

return system
