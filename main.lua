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
  Systems.keyLock.DrawKeySystem,
  Systems.draw.DrawSpriteSystem,
  Systems.moving.MarioControlSystem,
  Systems.water.UpdateWaterLevelSystem,
  -- Systems.draw.ChangeColorSystem,
  -- Systems.MouseSelection.DrawMouseSelectionSystem,
  -- Systems.MouseSelection.UpdateMouseSelectionSystem,
  Systems.water.DrawWaterSystem,
  Systems.keyLock.TriggerEnterSystem,
  Systems.keyLock.KeyControlSystem,
  Systems.keyLock.HoleDoneSystem,
  Systems.pump.PumpDoneSystem,
  Systems.dev.DrawFpsSystem,
  Systems.hole.HoleSpawnSystem,
  Systems.hole.DrawCountSystem,
  Systems.trip.DrawTripSystem,
  Systems.trip.UpdateTripSystem,
  Systems.hole.UpdateHoleDoneCountSystem,
  Systems.draw.DrawTextSystem,
  Systems.event.GameOverSystem,
  Systems.event.GameWinSystem,
  Systems.clear.ClearEventSystem,
  Systems.clear.ClearBtnSystem
)

--  create system filters
local drawFilter = Tiny.requireAll('isDrawSystem')
local drawGuiFilter = Tiny.requireAll('isDrawGuiSystem')
local updateFilter = Tiny.rejectAny('isDrawSystem','isDrawGuiSystem')
BTN_PRESSED = {}
-- maximum count of hole in level
HOLE_MAX = 5
-- hole size
HOLE_POWER = 12
-- seconds for trip
TRIP_TIME = 300
-- hole done count, realy?
HOLE_DONE_COUNT = 0

function love.load()
  love.window.setTitle( 'GAME' )
  -- load all image, sound and etc.
  Assets.load()
  --  save window size to global
  WindowHeight = love.graphics.getHeight()
  WindowWidth = love.graphics.getWidth()
  --  Create camera instanse and set zoom value
  Camera = camera(WindowWidth/2,WindowHeight/2)
  local cam_scale = 1
  Camera:zoomTo(cam_scale)
-- set random seed
  math.randomseed(os.time())

  Mario = Entities.player.Mario(WindowWidth/2,WindowHeight-64)
  World:addEntity(Mario)

  World:addEntity(Entities.Platform(0,WindowHeight-32,WindowWidth,32))
  World:addEntity(Entities.Platform(0,0,WindowWidth,32))
  World:addEntity(Entities.Platform(0,0,32,WindowHeight))
  World:addEntity(Entities.Platform(WindowWidth-32,0,32,WindowHeight))
  -- Add sumply entity for print FPS system
  World:addEntity({guiManager = true})
  World:addEntity({tripManager = {value = 0}})
  -- Global list of holes
  HOLES = {}

  WaterManager = Entities.Water()
  World:addEntity(WaterManager)
  -- add pump
  World:addEntity(Entities.Pump(WindowWidth-64, WindowHeight-64))
  -- add spawner
  World:addEntity(Entities.HoleSpawner(0, WindowHeight-64))

  World:addEntity({garbageCollector = true})
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
  BTN_PRESSED[key] = true
end

function love.keyreleased(key, scancode)
  -- if BTN_PRESSED[key] then
  --   BTN_PRESSED[key] = nil
  -- end
end
