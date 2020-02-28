Terrain = Object:extend()

function Terrain:new(groundList)
  self.image = love.graphics.newImage("images/GROUND.png")
  self.tileList = {}
  for x=1, #groundList do
    self.tileList[x] = {}
    for y=1, #groundList[x] do
      -- Set entry to -1 for water
      if not groundList[x][y] then
        self.tileList[x][y] = -1
      else
        -- First check which sides around the current pieces are free
        local leftFree, upFree, rightFree, downFree = false, false, false, false
        if x > 1 and not groundList[x-1][y] then
          leftFree = true
        end
        if x < levelWidth and not groundList[x+1][y] then
          rightFree = true
        end
        if y > 1 and not groundList[x][y-1] then
          upFree = true
        end
        if y < levelHeight and not groundList[x][y+1] then
          downFree = true
        end
        
        -- Pick an image based on the free sides
        if leftFree and rightFree and upFree and downFree then
          self.tileList[x][y] = 0
        elseif leftFree or rightFree or upFree or downFree then
          -- These are all edge cases, if you know what I mean
          self.tileList[x][y] = 7
        else
          self.tileList[x][y] = 7
        end
      end
    end
  end
end

function Terrain:draw()
  for x=1, #self.tileList do
    for y=1, #self.tileList[x] do
      if self.tileList[x][y] >= 0 then
        love.graphics.draw(self.image, love.graphics.newQuad(gridSize*self.tileList[x][y], gridSize*3, gridSize, gridSize, self.image:getDimensions()), (x-1)*gridSize, (y-1)*gridSize)
      end
    end
  end
end

function Terrain:isTerrain(x, y)
  if 1 <= x and x <= #self.tileList and 1 <= y and y <= #self.tileList[x] then
    return self.tileList[x][y] ~= -1
  else
    return false
  end
end