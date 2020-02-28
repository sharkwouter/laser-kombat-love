Static = BaseObject:extend()

function Static:new(x, y, staticType)
  Static.super.new(self, x,y, false, false)
  self.type = staticType or 0
  if self.type > 8 then
    self.animated = true
    self.type = self.type - 5
  else
    self.animated = false
  end
  self.image = love.graphics.newImage("images/STATIC.png")
end

function Static:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.type*gridSize,0,gridSize,gridSize,self.image:getDimensions()), (self.x-1)*gridSize, (self.y-1)*gridSize)
end

function Static:update(dt)
end