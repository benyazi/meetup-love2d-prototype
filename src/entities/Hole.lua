local Hole = Class{}

function Hole:init(x, y)
    self.size = {w=32,h=32}
    self.position = {x=x,y=y}
    self.drawRect = Components.DrawRect(0.9,0.3,0.3)
    self.hole = Components.Hole(10)
    self.keyLock = Components.KeyLock({'up','down','left','up'})
end

return Hole
