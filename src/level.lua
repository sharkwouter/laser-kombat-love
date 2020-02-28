Level = Object:extend()

function Level:new(number)
  local filename = "levels/level"..string.format("%03d", number)..".lvl"
  local file = love.filesystem.read(filename, all)
  
  self.player = Player(string.byte(file, 1) + 1, string.byte(file, 5) + 1)

  self.description = string.sub(file, 6009, 6259)
  self.author = string.sub(file, 6265)
  print(self.description)

  --Create variables for all
  self.objects = self:loadObjects(file)
  self.enemies = self:loadEnemies(file)
  self.terrain = self:loadTerrain(file)

  --Load the terrain images
  self.images = {
    ground = love.graphics.newImage("images/GROUND.bmp"),
    water = love.graphics.newImage("images/WATER.bmp")
  }
end

function Level:getAuthor()
  return self.author
end

function Level:getDescription()
  return self.description
end

function Level:update(dt)
  self.player:update(dt)
  for x=1, #self.objects do
        self.objects[i]:update(dt)
  end
end

function Level:draw()
  self:drawWater()
  self:drawTerrain()
  for i=1, #self.objects do
    self.objects[i]:draw()
  end
  for i=1, #self.enemies do
    self.enemies[i]:draw()
  end
  self.player:draw()
end

function Level:drawWater()
   for i = 0, love.graphics.getWidth() / self.images.water:getWidth() do
    for j = 0, love.graphics.getHeight() / self.images.water:getHeight() do
        love.graphics.draw(self.images.water, i * self.images.water:getWidth(), j * self.images.water:getHeight())
    end
  end
end

function Level:drawTerrain()
  groundQuad = love.graphics.newQuad(40*7, 40*3, 40, 40, self.images.ground:getDimensions())

  for x=1, #self.terrain do
    for y=1, #self.terrain[x] do
      if self.terrain[x][y] then
        love.graphics.draw(self.images.ground, groundQuad, (x-1)*40, (y-1)*40)
      end
    end
  end
end

function Level:loadTerrain(file)
  local list = {}
  x, y = 1, 1
  for b=1209, 2405, 4 do
    output = string.byte(file, b)
    if output then
      if y == 16 then
        x = x + 1
        y = 1
      end
      if y == 1 then
          list[x] = {}
      end
      if output > 0 then
        table.insert(list[x], true)
      else
        table.insert(list[x], false)
      end
      y = y + 1
    end
  end
  return list
end

function Level:loadObjects(file)
  local list = {}
  local x, y = 1, 1
  for b=2409, 3605, 4 do
    local output = string.byte(file, b)
    local rotation = string.byte(file, b+1200)
    if output then
      if y == 16 then
        x = x + 1
        y = 1
      end
      if output > 0 then
        if output == 10 then
          table.insert(list, Static(x, y, rotation))
        elseif output == 12 then
          table.insert(list, Rusty(x ,y, rotation))
        elseif output == 4 then
          table.insert(list, Redblock(x ,y, 0))
        elseif output == 11 then
          table.insert(list, Redblock(x ,y, 1))
        elseif output == 16 then
          table.insert(list, Redblock(x ,y, 2))
        elseif output == 21 then
          table.insert(list, Redblock(x ,y, 3))
        elseif output == 6 then
          table.insert(list, Nuke(x ,y, 0))
        elseif output == 7 then
          table.insert(list, Nuke(x ,y, 1))
        elseif output == 9 then
          table.insert(list, Tee(x, y, rotation))
        elseif output == 13 then
          table.insert(list, Bars(x, y, 0, 0))
        elseif output == 14 then
          table.insert(list, Bars(x, y, 0, 1))
        elseif output == 15 then
          table.insert(list, Bars(x, y, 0, 2))
        elseif output == 8 then
          table.insert(list, Mirror(x, y, 0, rotation))
        elseif output == 17 then
          table.insert(list, Mirror(x, y, 5, rotation))
        elseif output == 18 then
          table.insert(list, Mirror(x, y, 6, rotation))
        elseif output == 19 then
          table.insert(list, Bars(x, y, 1, 0))
        elseif output == 20 then
          table.insert(list, Bars(x, y, 1, 1))
        elseif output ~= 5 and output ~=1 then
          -- Don't execute this part for enemies, which are 5
          printText = string.format("%02d,%02d: %d", x, y, output)
          print(printText)
          table.insert(list, Static(x, y, 1))
        end
      end
      y = y + 1
    end
  end
  return list
end

function Level:loadEnemies(file)
  local list = {}
  x, y = 1, 1
  for b=2409, 3605, 4 do
    local output = string.byte(file, b)
    if output then
      if y == 16 then
        x = x + 1
        y = 1
      end
      if output == 5 then
        table.insert(list, Enemy(x, y))
      end
      y = y + 1
    end
  end
  return list
end

function Level:drawCoorts()
  
end