local Platform = Class{}

function Platform:init(x, y, w, h)
    self.size = {w=w,h=h}
    self.position = {x=x,y=y}
    self.drawRect = Components.DrawRect(0,0.7,0.3)
    self.isPlatform = true
end

return Platform
