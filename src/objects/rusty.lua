Rusty = BaseObject:extend()

function Rusty:new(x, y, rustyType)
  Rusty.super.new(self, x, y, false, true)
  self.type = rustyType or 0
  if self.type > 8 then
    self.animated = true
    self.type = self.type - 5
  else
    self.animated = false
  end
  self.image = love.graphics.newImage("images/RUSTY.png")
end

function Rusty:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.type*gridSize,0,gridSize,gridSize,self.image:getDimensions()), (self.x-1)*gridSize, (self.y-1)*gridSize)
end