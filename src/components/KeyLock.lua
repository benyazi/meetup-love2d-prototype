local KeyLock = Class{}

function KeyLock:init(combination)
  self.active = false
  self.combination = {}
  for i,v in pairs(combination) do
    self.combination[#self.combination+1] = {
      key = v,
      done = false
    }
  end
end

return KeyLock
