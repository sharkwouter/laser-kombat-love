function love.load()
  --Load the classic library so we can do oop
  Object = require "libraries/classic"

  --Load our classes
  require "constants"
  
  require "objects/base"
  require "objects/static"
  require "objects/redblock"
  require "objects/nuke"
  require "objects/mirror"
  require "objects/rusty"
  require "objects/bars"
  require "objects/tee"
  
  require "player"
  require "enemy"

  require "terrain"
  require "level"

  -- Configure the window
  love.window.setMode(gridSize*levelWidth, gridSize*levelHeight)
  love.window.setTitle("Laser Kombat")

  math.randomseed(os.time())

  --Load the level
  levelNumber = 1
  level = Level(levelNumber)
end

function love.update(dt)
  level:update(dt)
  if not pressed then
    pressed = false
  end
  if love.keyboard.isDown("pageup") then
    if pressed == false and levelNumber > 1 then
      levelNumber = levelNumber - 1
      level = Level(levelNumber)
      pressed = true
    end
  elseif love.keyboard.isDown("pagedown") then
    if pressed == false then
      levelNumber = levelNumber + 1
      level = Level(levelNumber)
      pressed = true
    end
  elseif love.keyboard.isDown("u") then
    if pressed == false then
      level:undo()
      pressed = true
    end
  else
    pressed = false
  end
  
  
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
  -- Move the player character
  if love.keyboard.isDown("left") then
    level:movePlayer(0)
  elseif love.keyboard.isDown("up") then
    level:movePlayer(1)
  elseif love.keyboard.isDown("right") then
    level:movePlayer(2)
  elseif love.keyboard.isDown("down") then
    level:movePlayer(3)
  end
end

function love.draw()
  level:draw()
end
