local system = Tiny.processingSystem({
  filter = Tiny.filter('tripManager')
})

function system:process(e, dt)
  local perSecond = 100/TRIP_TIME;
  e.tripManager.value = e.tripManager.value + perSecond*dt
  if e.tripManager.value >= 100 then
     e.tripManager.value = 100
     World:addEntity(Entities.events.GameWin())
  end
  World:notifyChange(e)
end

return system
