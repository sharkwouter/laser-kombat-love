Bars = BaseObject:extend()

function Bars:new(x, y, barsType, direction)
  Bars.super.new(self, x, y, false, false)
  self.type = barsType or 0
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