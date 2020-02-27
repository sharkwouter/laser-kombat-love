Rusty = Object:extend()

function Rusty:new(x, y, rustyType)
  self.x = x
  self.y = y
  self.type = rustyType
  if not self.type then
    self.type = 0
  elseif self.type > 8 then
    self.animated = true
    print(self.type)
    self.type = self.type - 5
  else
    self.animated = false
  end
  self.image = love.graphics.newImage("images/RUSTY.bmp")
end

function Rusty:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.type*40,0,40,40,self.image:getDimensions()), (self.x-1)*40, (self.y-1)*40)
end

function Rusty:update(dt)
end