Redblock = Object:extend()

function Redblock:new(x, y, type)
  self.x = x
  self.y = y
  
  --Set the type
  self.type = type
  if not self.type then
    self.type = 0
  end
  
  --Set different type qualities
  if self.type == 0 then
    self.breakable = false
    self.sinkable = true
  elseif self.type == 1 then
    self.breakable = true
    self.sinkable = true
  elseif self.type == 2 then
    self.breakable = false
    self.sinkable = false
  else
    self.breakable = true
    self.sinkable = false
  end

  self.image = love.graphics.newImage("images/REDBLOCK.bmp")
end

function Redblock:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.type*40,0,40,40,self.image:getDimensions()), (self.x-1)*40, (self.y-1)*40)
end

function Redblock:update(dt)
end