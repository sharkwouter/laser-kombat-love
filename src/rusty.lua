Rusty = Object:extend()

function Rusty:new(x, y, rustyType)
  self.x = x
  self.y = y
  self.type = rustyType
  if not self.type then
    self.type = 0
  elseif self.type > 8 then
    self.animated = true
    self.type = self.type - 5
  else
    self.animated = false
  end
  self.image = love.graphics.newImage("images/RUSTY.bmp")
end

function Rusty:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.type*gridSize,0,gridSize,gridSize,self.image:getDimensions()), (self.x-1)*gridSize, (self.y-1)*gridSize)
end

function Rusty:update(dt)
end