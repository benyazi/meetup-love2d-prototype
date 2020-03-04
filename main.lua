--load libs
require 'lib.require'
local camera = require 'lib.hump.camera'
Vector = require 'lib.hump.vector'
Class = require 'lib.hump.class'
Anim8 = require 'lib.anim8.anim8'
Assets = require 'src.assets'
Tiny = require 'lib.tiny-ecs.tiny'
Inspect = require 'lib.inspect.inspect'
Bump = require 'lib.bump.bump'
Beholder = require 'lib.beholder'

-- load world
local world = require 'src.world'

--load ecs
Components = require.tree('src.components')
Entities = require.tree('src.entities')
Systems = require.tree('src.systems')

-- create new world
World = world:new(
  Bump.newWorld(32),
  Systems.draw.DrawRectSystem,
  Systems.draw.ChangeColorSystem,
  Systems.draw.DrawMouseSelectionSystem,
  Systems.event.MouseClickSystem,
  Systems.clear.ClearEventSystem
)

local drawFilter = Tiny.requireAll('isDrawSystem')
local drawGuiFilter = Tiny.requireAll('isDrawGuiSystem')
local updateFilter = Tiny.rejectAny('isDrawSystem','isDrawGuiSystem')

function love.load()
  love.window.setTitle( 'GAME' )
  Assets.load()
  WindowHeight = love.graphics.getHeight()
  WindowWidth = love.graphics.getWidth()
  Camera = camera(WindowWidth/2,WindowHeight/2)
  local cam_scale = 1
  Camera:zoomTo(cam_scale)
  math.randomseed(os.time())

  for i=1,5 do
    local block = Entities.Block(
      10 * love.math.random(10, 70),
      10 * love.math.random(10, 70),
      50,45
    )
    block.drawRect = Components.DrawRect(0.3,0.8,0.1)
    World:addEntity(block)
  end
end

function love.draw()
  Camera:attach() --switch to camera scope
    World:update(love.timer.getDelta(), drawFilter)
  Camera:detach() --return from camera scope
  World:update(love.timer.getDelta(), drawGuiFilter)
end

function love.update(dt)
  World:update(dt,updateFilter)
end

function love.mousepressed(x, y, button)
  World:addEntity(Entities.events.MouseClick(x,y,button))
end

function love.keypressed(key, scancode, isrepeat)
end

function love.keyreleased(k, scancode)
end
