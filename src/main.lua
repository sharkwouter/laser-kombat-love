function love.load()
  --Load the classic library so we can do oop
  Object = require "libraries/classic"

  love.window.setMode(800, 600)
  level = 1
  love_version, _, _, _ = love.getVersion()
  map = loadlevel(level)
end

function love.update(dt)
  if love.keyboard.isDown("n") then
    level = level + 1
    map = loadlevel(level)
  end
end

function love.draw()
  for x=1, #map do
    for y=1, #map[x] do
      if map[x][y] == 2 then
        love.graphics.rectangle( "fill", (x-1)*40, (y-1)*40, 40, 40 )
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

  --The bytes 9 until 1205 contain which parts of the level are water and which parts aren't
  for b=9, 1205 do
    output = string.byte(file, b)
    if output and output ~= 0 then
      --print(b..": "..output)
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

  return map
end
