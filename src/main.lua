function love.load()
  --Load the classic library so we can do oop
  Object = require "libraries/classic"

  font = love.graphics.newFont("fonts/DejaVuSansMono-Bold.ttf", 16 )
  love.graphics.setFont(font)

  love.window.setMode(800, 600)
  love.window.setTitle("Laser Kombat")
  level = 1
  love_version, _, _, _ = love.getVersion()
  blocks = {}
  images={
    redblock = love.graphics.newImage("images/REDBLOCK.bmp"),
    ground = love.graphics.newImage("images/GROUND.bmp"),
    static = love.graphics.newImage("images/STATIC.bmp"),
    rusty = love.graphics.newImage("images/RUSTY.bmp"),
    tee = love.graphics.newImage("images/TEE.bmp"),
    mirror = love.graphics.newImage("images/MIRROR.bmp"),
    nuke = love.graphics.newImage("images/NUKE.bmp"),
    bars = love.graphics.newImage("images/BARS.bmp"),
    water = love.graphics.newImage("images/WATER.bmp")
  }

  --Color variables
  colors={
    red={255,0,0},
    blue={0,0,255},
    green={0,255,0},
    cyan={0,255,255},
    purple={128,0,255},
    orange={255,128,0},
    yellow={255,255,0},
    white={255,255,255},
    black={0,0,0}
  }
  love.graphics.setBackgroundColor(colors.green)

  --Load our classes
  require "player"
  require "static"
  require "redblock"
  require "nuke"
  require "enemy"
  require "mirror"
  require "rusty"
  require "bars"
  require "tee"
  require "level"

  --Load the level
  levelNumber = 1
  level = Level(levelNumber)
end

function love.update(dt)
  --level.update(dt)
  if not pressed then
    pressed = false
  end
  if love.keyboard.isDown("pageup") then
    if pressed == false then
      levelNumber = levelNumber + 1
      level = Level(levelNumber)
      pressed = true
    end
  elseif love.keyboard.isDown("pagedown") then
    if pressed == false and levelNumber > 1 then
      levelNumber = levelNumber - 1
      level = Level(levelNumber)
      pressed = true
    end
  else
    pressed = false
  end
end

function love.draw()
  level:draw()
end
