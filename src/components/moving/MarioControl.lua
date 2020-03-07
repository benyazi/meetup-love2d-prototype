local MarioControl = Class{}

function MarioControl:init(speed)
  self.speed = speed
  self.yvel = 0
  self.xvel = 0
end

return MarioControl
