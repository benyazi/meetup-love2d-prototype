local Pump = Class{}

function Pump:init(x, y)
    self.size = {w=32,h=32}
    self.position = {x=x,y=y}
    -- self.drawRect = Components.DrawRect(0.1,0.6,0.7)
    self.drawSprite = Components.DrawSprite(Assets['pump'])
    self.keyLock = Components.KeyLock()
    self.isPump = true
end

return Pump
