function love.load()
  --Load the classic library so we can do oop
  Object = require "libraries/classic"

  love.window.setMode(800, 600)
  map = readfile()
end

function love.update(dt)

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

function readfile()
  filename = "levels/level001.lvl"
  filesize = love.filesystem.getInfo(filename).size
  file = love.filesystem.read(filename, all)

  for b=1, filesize do
    contents = string.byte(file, b)
    print(b..": "..contents)
  end

  map = {}
  x = 1
  y = 1

  print("Filesize: "..filesize.." bytes")

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
