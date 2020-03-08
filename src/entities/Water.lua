local Water = Class{}

function Water:init(x, y)
    self.waterLevel = Components.WaterLevel(5)
end

return Water
