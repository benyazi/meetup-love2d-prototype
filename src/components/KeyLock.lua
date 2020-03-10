local KeyLock = Class{}

function KeyLock:init()
  self.active = false
  self.combination = {}
  local combination = {}
  -- Shuffle key combination
  math.randomseed(os.time())
  for i, v in ipairs({'up','down','left','right'}) do
  	local pos = math.random(1, #combination+1)
  	table.insert(combination, pos, v)
  end
  -- 
  for i,v in pairs(combination) do
    self.combination[#self.combination+1] = {
      key = v,
      done = false
    }
  end
end

return KeyLock
