Redblock = BaseObject:extend()

function Redblock:new(x, y, floatType)
  Redblock.super.new(self, x, y, true, false)
  
  --Set the type
  self.type = floatType or 0
  
  --Set different type qualities
  if self.type == 0 then
    self:setDestructable(false)
    self.sinkable = true
  elseif self.type == 1 then
    self:setDestructable(true)
    self.sinkable = true
  elseif self.type == 2 then
    self:setDestructable(true)
    self.sinkable = false
  else
    self:setDestructable(true)
    self.sinkable = false
  end

  self.image = love.graphics.newImage("images/REDBLOCK.png")
end

function Redblock:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.type*gridSize,0,gridSize,gridSize,self.image:getDimensions()), (self.x-1)*gridSize, (self.y-1)*gridSize)
end