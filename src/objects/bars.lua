Bars = Object:extend()

function Bars:new(x, y, barsType, direction)
  self.x = x
  self.y = y
  self.type = barsType
  if not self.type then
    self.type = 0
  end
  self.direction = direction
  if not self.direction then
    self.direction = 0
  end
  self.image = love.graphics.newImage("images/BARS.png")
end

function Bars:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.direction*gridSize,self.type*gridSize,gridSize,gridSize,self.image:getDimensions()), (self.x-1)*gridSize, (self.y-1)*gridSize)
end

function Bars:update(dt)
end