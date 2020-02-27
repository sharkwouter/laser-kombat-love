Mirror = Object:extend()

function Mirror:new(x, y, mirrorType, direction)
  self.x = x
  self.y = y
  self.type = mirrorType
  if not self.type then
    self.type = 0
  end
  self.direction = direction
  if not self.direction then
    self.direction = 0
  end
  self.image = love.graphics.newImage("images/MIRROR.bmp")
end

function Mirror:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.direction*40,self.type*40,40,40,self.image:getDimensions()), (self.x-1)*40, (self.y-1)*40)
end

function Mirror:update(dt)
end