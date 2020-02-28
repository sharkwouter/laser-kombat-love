Mirror = BaseObject:extend()

function Mirror:new(x, y, mirrorType, direction)
  Mirror.super.new(self, x, y, false, false)
  self.type = mirrorType or 0
  self.direction = direction
  if not self.direction then
    self.direction = 0
  end
  self.image = love.graphics.newImage("images/MIRROR.png")
end

function Mirror:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.direction*gridSize,self.type*gridSize,gridSize,gridSize,self.image:getDimensions()), (self.x-1)*gridSize, (self.y-1)*gridSize)
end

function Mirror:update(dt)
end