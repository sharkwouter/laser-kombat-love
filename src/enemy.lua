Enemy = Object:extend()

function Enemy:new(x, y)
  self.x = x
  self.y = y
  self.direction = 0
  self.image = love.graphics.newImage("images/TANK.png")
end

function Enemy:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.direction*gridSize,gridSize,gridSize,gridSize,self.image:getDimensions()), (self.x-1)*gridSize, (self.y-1)*gridSize)
end

function Enemy:update(dt)
end