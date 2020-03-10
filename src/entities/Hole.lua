local Hole = Class{}

function Hole:init(x, y)
    self.size = {w=32,h=32}
    self.position = {x=x,y=y}
    -- self.drawRect = Components.DrawRect(0.9,0.3,0.3)
    self.drawSprite = Components.DrawSprite(Assets['hole'])
    self.hole = Components.Hole(HOLE_POWER)
    self.keyLock = Components.KeyLock()
end

return Hole
