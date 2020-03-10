local HoleSpawner = Class{}

function HoleSpawner:init(x, y)
    self.position = {x=x,y=y}
    self.holeSpawner = true
end

return HoleSpawner
