local Mario = Class{}

function Mario:init(x, y)
  self.drawRect = Components.DrawRect(0.5,0.8,0.2)
  self.position = Components.Position(x,y)
  self.size = Components.Size(32,32)
  self.marioControl = Components.moving.MarioControl(10)
end

return Mario