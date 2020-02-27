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
  self.image = love.graphics.newImage("images/BARS.bmp")
end

function Bars:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.direction*40,self.type*40,40,40,self.image:getDimensions()), (self.x-1)*40, (self.y-1)*40)
end

function Bars:update(dt)
end