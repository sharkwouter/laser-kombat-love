function love.load()
  --Load the classic library so we can do oop
  Object = require "libraries/classic"

  font = love.graphics.newFont("fonts/DejaVuSansMono-Bold.ttf", 16 )
  love.graphics.setFont(font)

  love.window.setMode(800, 600)
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

  map = loadlevel(level)

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
end

function love.update(dt)
  if not pressed then
    pressed = false
  end
  if love.keyboard.isDown("n") then
    if pressed == false then
      level = level + 1
      map = loadlevel(level)
      pressed = true
    end
  else
    pressed = false
  end
end

function love.draw()
  for x=1, #map do
    for y=1, #map[x] do
      if map[x][y] == 2 then
        --love.graphics.setColor(colors.blue)
        love.graphics.rectangle( "fill", (x-1)*40, (y-1)*40, 40, 40 )
      end
    end
  end

  for x=1, #blocks do
    for y=1, #blocks[x] do
      if blocks[x][y] ~= 0 then
        if blocks[x][y] == 10 then
          love.graphics.draw(images.static, love.graphics.newQuad(0,0,40,40,images.static:getDimensions()), (x-1)*40, (y-1)*40)
        elseif blocks[x][y] == 4 then
          love.graphics.draw(images.redblock, love.graphics.newQuad(0,0,40,40,images.redblock:getDimensions()), (x-1)*40, (y-1)*40)
        elseif blocks[x][y] == 11 then
          love.graphics.draw(images.redblock, love.graphics.newQuad(40,0,40,40,images.redblock:getDimensions()), (x-1)*40, (y-1)*40)
        elseif blocks[x][y] == 21 then
          love.graphics.draw(images.redblock, love.graphics.newQuad(120,0,40,40,images.redblock:getDimensions()), (x-1)*40, (y-1)*40)
        elseif blocks[x][y] == 6 then
          love.graphics.draw(images.nuke, love.graphics.newQuad(0,0,40,40,images.nuke:getDimensions()), (x-1)*40, (y-1)*40)
        elseif blocks[x][y] == 17 then
          love.graphics.draw(images.mirror, love.graphics.newQuad(0,200,40,40,images.mirror:getDimensions()), (x-1)*40, (y-1)*40)
        elseif blocks[x][y] == 16 then
          love.graphics.draw(images.redblock, love.graphics.newQuad(80,0,40,40,images.redblock:getDimensions()), (x-1)*40, (y-1)*40)
        elseif blocks[x][y] == 14 then
          love.graphics.draw(images.bars, love.graphics.newQuad(40,0,40,40,images.bars:getDimensions()), (x-1)*40, (y-1)*40)
        elseif blocks[x][y] == 12 then
          love.graphics.draw(images.rusty, love.graphics.newQuad(0,0,40,40,images.rusty:getDimensions()), (x-1)*40, (y-1)*40)
        elseif blocks[x][y] == 9 then
          love.graphics.draw(images.rusty, love.graphics.newQuad(0,0,40,40,images.rusty:getDimensions()), (x-1)*40, (y-1)*40)
        else
          --love.graphics.setColor(colors.yellow)
          love.graphics.printf(blocks[x][y], (x-1)*40, (y-1)*40, 40, "left")
        end
      end
    end
  end
end

function loadlevel(number)
  filename = "levels/level"..string.format("%03d", number)..".lvl"
  print(filename)

  map = {}
  x = 1
  y = 1

  --Make sure the file exists
  if love_version > 11 then
    info = love.filesystem.getInfo(filename)
    if not info then
      print(filename.." doesn't exist")
      return map
    end
  end

  --Load the whole file
  file = love.filesystem.read(filename, all)

  playerx = string.byte(file, 1) - 1
  playery = string.byte(file, 5) - 1

  --The bytes 9 until 1205 contain which parts of the level are water and which parts aren't
  for b=9, 1205, 4 do
    output = string.byte(file, b)
    if output then
      if y == 16 then
        x = x + 1
        y = 1
      end
      if y == 1 then
        map[x] = {}
      end
      table.insert(map[x], output)
      y = y + 1
    end
  end

  x, y = 1, 1
  for b=1209, 2405, 4 do
    if y == 16 then
      x = x + 1
      y = 1
    end
    output = string.byte(file, b)
    print(x..", "..y..": "..output)
    y = y + 1
  end

  --byte 2405 means something, not sure what. It is usually 33, with a few exceptions
  x, y = 1, 1
  for b=2409, 3605, 4 do
    output = string.byte(file, b)
    if output then
      if y == 16 then
        x = x + 1
        y = 1
      end
      if y == 1 then
        blocks[x] = {}
      end
      table.insert(blocks[x], output)
      y = y + 1
    end
  end

  x, y = 1, 1
  for b=3609, 6005, 4 do
    if y == 16 then
      x = x + 1
      y = 1
    end
    if x == 21 then
      x = 1
    end
    output = string.byte(file, b)
    print(x..", "..y..": "..output)
    y = y + 1
  end

  description = string.sub(file, 6009, 6259)
  author = string.sub(file, 6265)

  print(author)
  print(description)

  return map
end
